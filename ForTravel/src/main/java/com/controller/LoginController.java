package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.BannerImageDTO;
import com.entity.MemberDTO;
import com.entity.PackageFirstDTO;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.exception.CommonException;
import com.service.BannerImageService;
import com.service.MemberService;
import com.service.PackageFirstService;
import com.service.ReviewBoardService;
import com.service.ReviewReplyService;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService service;

	
	
	
	@RequestMapping(value="/LoginUI")
	public String loginUI() throws CommonException{

		return "login";
	}
	
	@RequestMapping(value="/Login",method=RequestMethod.POST)
	public String login(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		System.out.println(userid+"\t"+passwd);
		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);		 
		
		String target = "";
		try {
			MemberDTO dto = service.login(map);
			if(dto==null){
				//아이디 또는 비번 틀리다.
				target = "forward:LoginUI";
				request.setAttribute("loginFail", "아이디와 비번을 확인해주세요.");
			}else{
				// 아이디와 비번이 모두 맞다.
				target = "redirect:Home";
				session.setAttribute("login", dto);
				if(map.get("userid").equals("admin")){
				session.setAttribute("adminlogin", dto);	
				}
			}
			
		} catch (CommonException e) {
			target = "error.jsp";
			request.setAttribute("message", e.getMessage());
			request.setAttribute("link", "Login");
		}
		return target;
	}
	
	@RequestMapping("/LogOut")
	public String LogOut(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
		 MemberDTO dto =(MemberDTO)session.getAttribute("login");
		 String target = "";
		 if(dto == null){ //로그인 안됨
			 target="forward:LoginUI";
			 request.setAttribute("loginFail", "로그인 후 시도하세요");
		 }else{  // 로그인 됨.
			 session.invalidate();
			 target="redirect:Home";
		 }
		return target;
	}
	/*//1.목록보기
	@RequestMapping("/list")
	@ModelAttribute("xxx")
	public List<DeptDTO> list(){
		List<DeptDTO> list=service.select();
		return list;
	}
	
	//2.글쓰기 화면 보기
	@RequestMapping("/writeUI")
	public String writeUI(){
		return "writeUI"; //write.jsp
	}
	
	//3.글쓰기
	@RequestMapping("/write")
	public String write(DeptDTO dto){
		service.insert(dto);
		//return "list"; //list.jsp
		//return "forward:list"; //포워드:list
		return "redirect:list"; //포워드:list
	}*/

}
