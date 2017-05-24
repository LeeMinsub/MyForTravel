package com.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.TravelNoticeDTO;
import com.exception.CommonException;
import com.service.NoitceService;

@Controller
public class NoticeController {
	@Autowired
	private NoitceService service;
	
	@RequestMapping("/SiteMap")
	public String SiteMap() throws CommonException{
		return "SiteMap";
	}
	
	@RequestMapping(value="/QABoardList")
	public String QABoardList() throws CommonException{
		return "FAQBoard";
	}
	
	@RequestMapping("/NoticeUI")
	public String NoticeUI(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws CommonException{
		TravelNoticeDTO dto=service.TravelNoticeSelcet();
		request.setAttribute("TravelNoticeDTO", dto);
		return "Notice";
	}
	@RequestMapping("/BanListUpdate")
	public String BanListUpdate() throws CommonException{
		Calendar cal = Calendar.getInstance();
		Date Bandate=cal.getTime();
		
		FileOutputStream fos = null;
	        InputStream is = null;
	        try {

			// 다운로드할 URL 주소
				String sourceUrl = "http://apis.data.go.kr/1262000/TravelBanService/getTravelBanList?ServiceKey=Mf2l3D3UqYuFtvFpn8hCECfVaMTxH9HCvqZTuAmsPYNNqJ8i8rrBH5ExjOsYcbJ1kYpixDEzmiN7dWQRk6ZXhw%3D%3D";	 
			// 생성될 TEXT 파일 경로,파일명
				String targetFilename = "C:\\temp\\upload\\getTravelBanList.xml";

	            fos = new FileOutputStream(""+ targetFilename);
	            URL url = new URL(sourceUrl);
	            URLConnection urlConnection = url.openConnection();
	            is = urlConnection.getInputStream();
	            byte[] buffer = new byte[1024];
	            int readBytes;
	            while ((readBytes = is.read(buffer)) != -1) {
	                fos.write(buffer, 0, readBytes);
	            }
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	            System.out.println("FileNotFoundException 에러");
	        } catch (MalformedURLException e) {
	            e.printStackTrace();
	            System.out.println("MalformedURLException 에러");
	        } catch (IOException e) {
	            e.printStackTrace();
	            System.out.println("IOException 에러");
	        } finally {
	            try {
	                if (fos != null) {
	                    fos.close();
	                }
	                if (is != null) {
	                    is.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	                System.out.println("파이널리에러");
	            }
	        }
	        System.out.println("banlistupdate완료");
	        System.out.println("banddate"+Bandate);
	        
	        service.BanDateUpdate();
		return "redirect:NoticeUI";
	}
	@RequestMapping("/WarningListUpdate")
	public String WarningListUpdate() throws CommonException{
		FileOutputStream fos = null;
        InputStream is = null;
        try {

		// 다운로드할 URL 주소
			String sourceUrl = "http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=Mf2l3D3UqYuFtvFpn8hCECfVaMTxH9HCvqZTuAmsPYNNqJ8i8rrBH5ExjOsYcbJ1kYpixDEzmiN7dWQRk6ZXhw%3D%3D&numOfRows=150";	 
		// 생성될 TEXT 파일 경로,파일명
			String targetFilename = "C:\\temp\\upload\\getTravelWarningList.xml";

            fos = new FileOutputStream(""+ targetFilename);
            URL url = new URL(sourceUrl);
            URLConnection urlConnection = url.openConnection();
            is = urlConnection.getInputStream();
            byte[] buffer = new byte[1024];
            int readBytes;
            while ((readBytes = is.read(buffer)) != -1) {
                fos.write(buffer, 0, readBytes);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (fos != null) {
                    fos.close();
                }
                if (is != null) {
                    is.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("WarningListUpdate 완료");
        service.WarningDateUpdate();
		return "redirect:NoticeUI";
	}
	
}// end class
