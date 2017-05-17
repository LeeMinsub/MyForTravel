package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.BannerImageDTO;
import com.entity.PackageFirstDTO;
import com.entity.ReviewBoardDTO;
import com.exception.CommonException;
import com.service.BannerImageService;
import com.service.PackageFirstService;
import com.service.ReviewBoardService;

@Controller
public class ReviewBoardController {
	int readcnt = 0;
	
	@Autowired
	private ReviewBoardService ReviewService;
	@Autowired
	private PackageFirstService PackageFirstService;
	@Autowired
	private BannerImageService BannerImageService;
	
	@RequestMapping("/Home")
	public String home(Model m) throws CommonException{
		BannerImageDTO bannerdto=BannerImageService.BannerImageSelect();
		List<ReviewBoardDTO> reviewList=ReviewService.bestredcnt(readcnt);
		List<PackageFirstDTO> packageList=PackageFirstService.packageNewlist();
		
		m.addAttribute("Plist", packageList);
		m.addAttribute("Plist2", reviewList);
		m.addAttribute("bannerdto", bannerdto);
		System.out.println(bannerdto);
		return "main";
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
