package com.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.BannerImageDTO;
import com.entity.MemberDTO;
import com.exception.CommonException;
import com.service.BannerImageService;

@Controller
public class AdminController {
	@Autowired
	private BannerImageService BannerImageService;
	
	@RequestMapping("/AdminUI")
	public String AdminUI(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
		String target ="";
		MemberDTO admindto=(MemberDTO)session.getAttribute("adminlogin");
		if(admindto!=null){
		target="AdminUI";
		}else{
			target="redirect:Home";
		}
		return target;
	}
	
	@RequestMapping("/admin")
	@ResponseBody
	public String admin(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
		String html ="";
		html += "<br/><br/><div class='openDiv'>";
		html += "<a href='https://analytics.google.com/analytics/web/?hl=ko&pli=1#report/defaultid/a97815317w143932944p148586598/'>로그분석 열기</a>";
		html +=	"</div>";
		return html;
	}
	
	/*@RequestMapping("/adminMain")
	@ResponseBody
	public HashMap<String,String> adminMain(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
		BannerImageDTO dto=null;
		dto=BannerImageService.BannerImageSelect();
		String imageName=dto.getImageName();
		String imageCaption=dto.getImageCaption();
		
		HashMap<String, String> map=new HashMap<>();
		map.put("imageName", imageName);
		map.put("imageCaption", imageCaption);
		return map;
	}//end adminMain
*/	@RequestMapping("/adminMain")
	public String adminMain(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{

	BannerImageDTO dto=BannerImageService.BannerImageSelect();
	ArrayList<String> imageList=new ArrayList<>();
	ArrayList<String> captionList=new ArrayList<>();
	StringTokenizer imagetoken=new StringTokenizer(dto.getImageName(),"/");

	if(dto.getImageCaption()!=null){
	StringTokenizer captiontoken=new StringTokenizer(dto.getImageCaption(),"/");
	while(captiontoken.hasMoreTokens()){
		captionList.add(captiontoken.nextToken());
	}
		
	}
	while(imagetoken.hasMoreTokens()){
		imageList.add(imagetoken.nextToken());
	}
	
	request.setAttribute("imageList", imageList);
	request.setAttribute("captionList", captionList);
		return "bannerUpdate";
	}//end adminMain
	
}//end class
