package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.PackageFirstDTO;
import com.exception.CommonException;
import com.service.PackageFirstService;

@Controller
public class PackageFirstController {
	
	@Autowired
	private PackageFirstService Service;

	
	@RequestMapping("/PackageFirstALL")
	public String PackageFirstALL(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws CommonException{
		String loc = request.getParameter("loc");
		String target ="";
	
		try {
			List<PackageFirstDTO> list = Service.countryAllList(loc);
			request.setAttribute("Plist", list);
			System.out.println(list);
			target="PackageALLFirst";
			
		} catch (CommonException e) {
			e.printStackTrace();
			target="error.jsp";
		}
		
		
		return target;
	}
	
	

}
