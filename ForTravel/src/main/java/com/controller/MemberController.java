package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.MemberDTO;
import com.exception.CommonException;
import com.service.MemberService;

@Controller
public class MemberController {
	
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

	@RequestMapping("/SignUP")
	public String signUp() throws CommonException{
		
		return "SignUP";
	}
	@RequestMapping("/MemberJoin")
	public String MemberJoin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
		String userid=request.getParameter("userid");
		String passwd=request.getParameter("passwd");
		String username=request.getParameter("username");
		int post1=Integer.parseInt(request.getParameter("post1"));
		int post2=Integer.parseInt(request.getParameter("post2"));
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		int phone1=Integer.parseInt(request.getParameter("phone1"));
		int phone2=Integer.parseInt(request.getParameter("phone2"));
		int phone3=Integer.parseInt(request.getParameter("phone3"));
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String birth=request.getParameter("birth");
		
		MemberDTO mDTO=new MemberDTO(userid, passwd, username, post1, post2, addr1, addr2, phone1, phone2, phone3, email1, email2, birth, 0);
		
		try {
			service.memberJoin(mDTO);
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		return "redirect:Home";
	}
	
	@RequestMapping("/IdCheck")
	public @ResponseBody String IdCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		 String userid = request.getParameter("userid");
		   int result = service.idCheck(userid);
		   String res=String.valueOf(result);
		return res;
	}

}//end class
