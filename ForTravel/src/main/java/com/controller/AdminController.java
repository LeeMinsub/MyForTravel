package com.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.entity.BannerFileDTO;
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

@RequestMapping("/AdminBannerUpdate")
	public String AdminBannerUpdate(BannerFileDTO dto,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws CommonException{
	String [] caption;
	caption=dto.getContent();
	String [] existingImages;
	existingImages=dto.getExistingImages();
	CommonsMultipartFile [] theFile=dto.getTheFile();
	String imageCaption="";
	String imageName="";
	if(caption.length!=0||caption!=null){
		for (int i = 0; i < caption.length; i++) {
			imageCaption +=caption[i]+"/";
		}
	}
	if(existingImages!=null){
		for (int i = 0; i < existingImages.length; i++) {
			imageName +=existingImages[i]+"/";
		}
	}
	//특정 폴더에 저장
	try {
		if(theFile.length!=0||theFile!=null){
		for (int i = 0; i < theFile.length; i++) {
			String fileName="";
			fileName=theFile[i].getOriginalFilename();
			if(!fileName.trim().isEmpty()){
			File f=new File("C:\\temp\\upload",fileName);
			theFile[i].transferTo(f);
			imageName += fileName+"/";
				}//end if
			}
		}
	} catch (IllegalStateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	BannerImageDTO bdto=new BannerImageDTO(1,imageName,imageCaption);
	try {
		BannerImageService.BannerUpdate(bdto);
	} catch (CommonException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return "redirect:Home";
}//end adminMain
	
}//end class
