package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.PackageFirstDTO;
import com.entity.PackageThirdDTO;
import com.exception.CommonException;
import com.service.PackageFirstService;
import com.service.PackageThirdService;

@Controller
public class PackageThirdController {
	
	@Autowired
	private PackageThirdService Service;

	
	@RequestMapping("/PackageFirst")
	public String PackageFirst(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws CommonException{
		String city = request.getParameter("city");
		
		String target ="";
		try {
			List<PackageThirdDTO> list = Service.packageList(city);
			request.setAttribute("Plist", list);
			target="PackageFirst";
			
		} catch (CommonException e) {
			e.printStackTrace();
			target="error";
		}
		
		return target;
	}
	
	@RequestMapping("/PackageThirdList")
	public String PackageThirdList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws CommonException{
		int packageno= Integer.parseInt(request.getParameter("packageno"));
		String target="";
		try {
			List<PackageThirdDTO> list=Service.packageAllList(packageno);
			
         	
			request.setAttribute("Plist", list);
			target="PackageThird";
			
		} catch (CommonException e) {
			e.printStackTrace();
			target="error";
		}
		
		return target;
	}
	@RequestMapping("/PackageDeteil")
	public String PackageDeteil(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws CommonException{
		String packagenum = request.getParameter("packageno");
		int packageno = Integer.parseInt(packagenum);
		String startdate = request.getParameter("startdate");
		String term = request.getParameter("term");
		System.out.println(startdate);
		String target="";
		
		try {
			List<PackageThirdDTO> list=Service.packageAllList(packageno);
			request.setAttribute("Plist", list);
			target="PackageSecond";
			
		} catch (CommonException e) {
			e.printStackTrace();
			target="error";
		}
		
		return target;
	}
	
	@RequestMapping("/PackageThirdListUpdate")
	public @ResponseBody List<PackageThirdDTO> PackageThirdListUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws CommonException{
		String packageno=request.getParameter("packageno");
		String startyear=request.getParameter("startyear");
		String startmonth=request.getParameter("startmonth");
		System.out.println("month"+startmonth);
		System.out.println("year"+startyear);
		String term=request.getParameter("term");
		String startdate=startyear+"/0"+startmonth;
		System.out.println("aaaaa"+startdate);
		System.out.println(Integer.parseInt(packageno));
		PackageThirdDTO dto = new PackageThirdDTO();
		dto.setPackageno(Integer.parseInt(packageno));
		dto.setStartdate(startdate);
		dto.setTerm(term);
		System.out.println(dto);
		List<PackageThirdDTO> list3=null;
		try {
			list3=Service.packageTableAllList(dto);
		System.out.println("LISTSIZE::::"+list3.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list3;
	}
	
}//end class
