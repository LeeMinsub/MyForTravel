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

import com.entity.BannerImageDTO;
import com.entity.PackageFirstDTO;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.exception.CommonException;
import com.service.BannerImageService;
import com.service.PackageFirstService;
import com.service.ReviewBoardService;
import com.service.ReviewReplyService;

@Controller
public class ReviewBoardController {
	int readcnt = 0;
	
	@Autowired
	private ReviewBoardService ReviewService;
	@Autowired
	private ReviewReplyService ReviewReplyService;
	
	
	
	@RequestMapping("/ReviewBoard")
	public String Review(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
		String curpage=request.getParameter("curpage");
		String perPage=request.getParameter("perPageCount");
		String orders=request.getParameter("orders");
		String travelNation=request.getParameter("travelNation");
		String travelLoc=request.getParameter("travelLoc");
		String searchName=request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		if(perPage==null) perPage="3";
		if(curpage==null) curpage="1";
		if(travelNation==null) travelNation="전체보기";
		if(travelLoc==null) travelLoc="전체보기";
		if(orders==null) orders="writeday";
		
		HashMap<String, String> map=new HashMap<>();
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
		session.setAttribute("pageCount", 3);
		
		List<String> locList=ReviewService.locSelect(map);
		ReviewBoardPageDTO pageDTO=ReviewService.boardNewPage(map);
		
		int endPageCount=0;
		int startPageCount=0;
		int totalrecord = pageDTO.getTotalrecord(); 
		int pageCount = (int)session.getAttribute("pageCount");
		int totalPageCount=totalrecord/Integer.parseInt(perPage);
		session.setAttribute("totalPageCount", totalPageCount);
		
		if(session.getAttribute("endPageCount") ==null) {
			endPageCount=3;
			session.setAttribute("endPageCount", endPageCount);
		}
			
		if(session.getAttribute("startPageCount") ==null){ 
			startPageCount=1;
			session.setAttribute("startPageCount", startPageCount);
		}
		session.setAttribute("pageDTO", pageDTO);
		session.setAttribute("locList", locList);
		return "ReviewBoard";
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
