package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.entity.ReviwFileDTO;
import com.entity.MemberDTO;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.entity.ReviewReplyDTO;
import com.exception.CommonException;
import com.service.ReviewBoardService;
import com.service.ReviewReplyService;

@Controller
public class ReviewBoardController {
	int readcnt = 0;

	@Autowired
	private ReviewBoardService ReviewService;
	@Autowired
	private ReviewReplyService ReviewReplyService;

	// 후기 리스트
	@RequestMapping("/ReviewBoard")
	public String ReviewBoard(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		String curpage = request.getParameter("curpage");
		String perPage = request.getParameter("perPageCount");
		String orders = request.getParameter("orders");
		String travelNation = request.getParameter("travelNation");
		String travelLoc = request.getParameter("travelLoc");
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		if (perPage == null) perPage = "3";
		if (curpage == null) curpage = "1";
		if (travelNation == null) travelNation = "전체보기";
		if (travelLoc == null) travelLoc = "전체보기";
		if (orders == null) orders = "writeday";

		HashMap<String, String> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("perPage", perPage);
		map.put("orders", orders);
		map.put("travelNation", travelNation);
		map.put("travelLoc", travelLoc);
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);

		session.setAttribute("hmap", map);
		session.setAttribute("curpage", curpage);
		session.setAttribute("perPage", perPage);
		session.setAttribute("orders", orders);
		session.setAttribute("travelNation", travelNation);
		session.setAttribute("travelLoc", travelLoc);
		session.setAttribute("searchName", searchName);
		session.setAttribute("searchValue", searchValue);

		List<String> locList = ReviewService.locSelect(map);
		ReviewBoardPageDTO pageDTO = ReviewService.boardNewPage(map);

		session.setAttribute("pageDTO", pageDTO);
		session.setAttribute("locList", locList);
		return "ReviewBoard";
	}

	@RequestMapping("/ReviewBoardDetail")
	public String ReviewBoardDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		String snum = request.getParameter("num");
		int num = Integer.parseInt(snum);

		ReviewBoardDTO dto = ReviewService.boardRetrieve(num);
		List<ReviewReplyDTO> rpList = ReviewReplyService.replyList(num);
		request.setAttribute("boardRetrieve", dto);
		request.setAttribute("rpList", rpList);

		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;

		if (cookies != null && cookies.length > 0) {

			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("VIEWCOOKIE")) { 
					// Cookie의name이 VIEWCOOKIE와 일치하는 쿠키를 viewCookie에 넣어준다.
					viewCookie = cookies[i];
				}
			}
		}

		// 만일 viewCookie없다면
		if (viewCookie == null) {
			System.out.println("VIEWCOOKIE 없음");
			Cookie newCookie = new Cookie("VIEWCOOKIE", "|" + num + "|"); 
			// ("VIEWCOOKIE"는 name,"|"+bbsno+"|" 는 value다.
			response.addCookie(newCookie);
			ReviewService.ReviewReadcntUpdate(num);
		} else {
			System.out.println("VIEWCOOKIE 있음");
			String value = viewCookie.getValue();

			if (value.indexOf("|" + num + "|") < 0) { 
				// 입력한 번화와 일치하는 번호가 없으면 추가한다.
				value = value + "|" + num + "|";
				viewCookie.setValue(value);
				response.addCookie(viewCookie);
				ReviewService.ReviewReadcntUpdate(num);
			}
		}
		return "ReviewBoardDetail";
	}

	@RequestMapping("/ReviewBoardUpdateUI")
	public String ReviewBoardUpdateUI(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		String num = request.getParameter("num");

		ReviewBoardDTO dto = ReviewService.boardRetrieve(Integer.parseInt(num));
		List<ReviewReplyDTO> rpList = ReviewReplyService.replyList(Integer.parseInt(num));
		request.setAttribute("boardRetrieve", dto);
		request.setAttribute("rpList", rpList);
		request.setAttribute("updateNum", Integer.parseInt(num));
		return "ReviewBoardUpdateUI";
	}

	@RequestMapping("/ReviewBoardUpdate")
	public ModelAndView ReviewBoardUpdate(ReviwFileDTO dto){
		String [] existingImages=dto.getExistingImages();
		CommonsMultipartFile [] theFile=dto.getTheFile();
		String travelNation=dto.getTravelNation();
		String content=dto.getContent();
		String travelLoc=dto.getTravelLoc();
		String title=dto.getTitle();
		String num=dto.getNum();
		
		String fileName="";
		String image1="";
		if(existingImages.length!=0||existingImages!=null){
			for (int i = 0; i < existingImages.length; i++) {
				image1 = existingImages[i]+"/";
				}
			}
		//특정 폴더에 저장
		try {
			if(theFile.length!=0||theFile!=null){
			for (int i = 0; i < theFile.length; i++) {
				fileName=theFile[i].getOriginalFilename();
				File f=new File("C:\\temp\\upload",fileName);
				theFile[i].transferTo(f);
				image1 = fileName+"/";
				}
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, String> map=new HashMap<>();
		map.put("travelNation",travelNation);
		map.put("content",content);
		map.put("travelLoc",travelLoc);
		map.put("title",title);
		map.put("image1",image1);
		map.put("num",num);
		try {
			ReviewService.reviewBoardUpdate(map);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:ReviewBoardDetail?num="+num);//redirect:ReviewBoardDetail.jsp

		return mav;
	}
	
	@RequestMapping("/ReviewBoardDelete")
	public String ReviewBoardDelete(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		String target="";
		String snum=request.getParameter("num");
		int num=Integer.parseInt(snum);
		try {
			ReviewService.reviewBoardDelete(num);
			target="redirect:ReviewBoard";
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
		}
		return target;
	}
	@RequestMapping("/ReviewBoardWriteUI")
	public String ReviewBoardWriteUI(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		String target=""; 
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		
		if(dto != null){
			target="ReviewBoardWriteUI";
		}else{
			target="forward:LoginUI";
			request.setAttribute("loginFail", "로그인 후 시도하세요");
		}
		return target;
	}
	
	@RequestMapping("/ReviewBoardWrite")
	public ModelAndView ReviewBoardWrite(ReviwFileDTO dto,HttpSession session){
		CommonsMultipartFile [] theFile=dto.getTheFile();
		String travelNation=dto.getTravelNation();
		String content=dto.getContent();
		String travelLoc=dto.getTravelLoc();
		String title=dto.getTitle();
		MemberDTO mdto=(MemberDTO)session.getAttribute("login");
		String userid=mdto.getUserid();
		
		String fileName="";
		String image1="";
		//특정 폴더에 저장
		try {
			if(theFile.length!=0||theFile!=null){
			for (int i = 0; i < theFile.length; i++) {
				fileName=theFile[i].getOriginalFilename();
				File f=new File("C:\\temp\\upload",fileName);
				theFile[i].transferTo(f);
				image1 = fileName+"/";
				}
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, String> map=new HashMap<>();
		map.put("travelNation",travelNation);
		map.put("content",content);
		map.put("travelLoc",travelLoc);
		map.put("title",title);
		map.put("image1",image1);
		map.put("userid", userid);
		try {
			ReviewService.reviewBoardWrite(map);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:ReviewBoard");

		return mav;
	}
	
	@RequestMapping("/ReviewReplyWrite")
	public String ReviewReplyWrite(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		String target=""; 
		String content=request.getParameter("rpContent");
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		ReviewReplyDTO rpDTO=new ReviewReplyDTO();
		if(mdto != null){
			int num=Integer.parseInt(request.getParameter("num"));
			rpDTO.setContent(content);
			rpDTO.setReviewNum(num);
			rpDTO.setUserid(mdto.getUserid());
			ReviewReplyService.replyWrite(rpDTO);
			target="redirect:ReviewBoardDetail?num="+num;
		}else{
			target="forward:LoginUI";
			session.setAttribute("loginFail", "로그인 후 시도하세요");
		}
		return target;
	}

	@RequestMapping("/ReviewReplyInsert")
	@ResponseBody
	public String ReviewReplyInsert(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws CommonException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String content=request.getParameter("rprpContent");
	    String repRoot=request.getParameter("repRoot");
	    String repStep=request.getParameter("repStep");
	    String repIndent=request.getParameter("repIndent");
	    String reviewNum=request.getParameter("reviewNum");
	    ReviewReplyDTO rpDTO=new ReviewReplyDTO();
	    MemberDTO mdto = (MemberDTO)session.getAttribute("login");
	    
	    rpDTO.setContent(content);
		rpDTO.setUserid(mdto.getUserid());
		rpDTO.setRepRoot(Integer.parseInt(repRoot));
		rpDTO.setRepStep(Integer.parseInt(repStep));
		rpDTO.setRepIndent(Integer.parseInt(repIndent));
		rpDTO.setReviewNum(Integer.parseInt(reviewNum));
	    System.out.println(rpDTO);
	    
		List<ReviewReplyDTO> rpList=null;
		
	    int result = 0;
	    try{
	 	 result = ReviewReplyService.replyInsert(rpDTO);
	     
	     rpList=ReviewReplyService.replyList(Integer.parseInt(reviewNum));
	   }catch(Exception e){
	 	  e.printStackTrace();
	   }finally{
	   }
	    String responseData="";
	    if(rpList.size()!=0){
	    for (int i = 0; i < rpList.size(); i++) {
	    	responseData +="<div class='media'>";
	    	for (int j = 0; j < rpList.get(i).getRepIndent(); j++) {
	    		responseData +="<a class='pull-left' href='#'><div class='media-object' >&nbsp;&nbsp;&nbsp;&nbsp;</div></a>";
			}//end for j
	    	responseData +="<a class='pull-left' href='#'><div class='media-object arrowdiv' ></div></a><div class='media-body'><h4 class='media-heading'>By ";
	    	responseData +=rpList.get(i).getUserid()+" <small>"+rpList.get(i).getWriteday()+"</small></h4><pre style='background: none; border: 0;'>";
	    	responseData +=rpList.get(i).getContent()+"</pre><span class='replebutton label label-success' style='cursor: pointer;'>답글 달기</span><br/><br/><div class='reple well' style='display: none;'><h4>Leave a Comment:</h4>";
	    	responseData +="<form class='rprpform' name='rprpform' role='form' method='post'>";
	    	responseData +="<div class='form-group'><textarea name='rprpContent'class='form-control' rows='3'></textarea></div>";
	    	responseData +="<input type='hidden' name='userid' value='${sessionScope.login.userid}'>";
	    	responseData +="<input type='hidden' name='num' value="+rpList.get(i).getNum();
	    	responseData +="<input type='hidden' name='repRoot' value="+rpList.get(i).getRepRoot();
	    	responseData +="<input type='hidden' name='repStep' value="+rpList.get(i).getRepStep();
	    	responseData +="<input type='hidden' name='repIndent' value="+rpList.get(i).getRepIndent();
	    	responseData +="<input type='hidden' name='reviewNum' value="+rpList.get(i).getReviewNum();
	    	responseData +="<button type='button' class='rprpformButton btn btn-primary'>Submit</button></form></div></div></div>";
	    	}//end for i
	    }//end if
	   return responseData;
	}
}// end class
