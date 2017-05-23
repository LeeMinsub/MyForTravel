package com.entity;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ReviwFileDTO {
	private String travelNation;
	private String content;
	private String travelLoc;
	private String title;
	private String [] existingImages;
	private CommonsMultipartFile[] theFile;
	private String num;
	
	public String getTravelNation() {
		return travelNation;
	}
	public void setTravelNation(String travelNation) {
		this.travelNation = travelNation;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTravelLoc() {
		return travelLoc;
	}
	public void setTravelLoc(String travelLoc) {
		this.travelLoc = travelLoc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}

	

}//end class
