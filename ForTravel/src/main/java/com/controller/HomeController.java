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
public class HomeController {
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
		return "main";
	}
	
	

}
