package com.entity;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BannerFileDTO {
	private int num;
	private String [] content;
	private String [] existingImages;
	private CommonsMultipartFile[] theFile;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String[] getContent() {
		return content;
	}
	public void setContent(String[] content) {
		this.content = content;
	}
	public String[] getExistingImages() {
		return existingImages;
	}
	public void setExistingImages(String[] existingImages) {
		this.existingImages = existingImages;
	}
	public CommonsMultipartFile[] getTheFile() {
		return theFile;
	}
	public void setTheFile(CommonsMultipartFile[] theFile) {
		this.theFile = theFile;
	}

	
	
	
	
	

}//end class
