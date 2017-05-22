package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.entity.BannerImageDTO;
import com.entity.ReviwFileDTO;
import com.entity.MemberDTO;
import com.entity.PackageFirstDTO;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.entity.ReviewReplyDTO;
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
		if (perPage == null)
			perPage = "3";
		if (curpage == null)
			curpage = "1";
		if (travelNation == null)
			travelNation = "전체보기";
		if (travelLoc == null)
			travelLoc = "전체보기";
		if (orders == null)
			orders = "writeday";

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
				if (cookies[i].getName().equals("VIEWCOOKIE")) { // Cookie의
																	// name이
																	// VIEWCOOKIE와
																	// 일치하는 쿠키를
																	// viewCookie에
																	// 넣어준다.
					viewCookie = cookies[i];
				}
			}
		}

		// 만일 viewCookie없다면
		if (viewCookie == null) {
			System.out.println("VIEWCOOKIE 없음");
			Cookie newCookie = new Cookie("VIEWCOOKIE", "|" + num + "|"); // ("VIEWCOOKIE"는
																			// name,
																			// "|"+bbsno+"|"
																			// 는
																			// value
																			// 다.
			response.addCookie(newCookie);
			ReviewService.ReviewReadcntUpdate(num);
		} else {
			System.out.println("VIEWCOOKIE 있음");
			String value = viewCookie.getValue();

			if (value.indexOf("|" + num + "|") < 0) { // 입력한 번화와 일치하는 번호가 없으면
														// 추가한다.
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
		CommonsMultipartFile [] existingImages=dto.getExistingImages();
		CommonsMultipartFile [] theFile=dto.getTheFile();
		String travelNation=dto.getTravelNation();
		String content=dto.getContent();
		String travelLoc=dto.getTravelLoc();
		String title=dto.getTitle();
		String num=dto.getNum();
		
		String fileName="";
		String image1="";
		//특정 폴더에 저장
		try {
			for (int i = 0; i < existingImages.length; i++) {
				fileName=theFile[i].getOriginalFilename();
				File f=new File("C:\\temp\\upload",fileName);
				theFile[i].transferTo(f);
				image1 = fileName+"/";
			}
			for (int i = 0; i < theFile.length; i++) {
				fileName=theFile[i].getOriginalFilename();
				File f=new File("C:\\temp\\upload",fileName);
				theFile[i].transferTo(f);
				image1 = fileName+"/";
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
	
}// end class
