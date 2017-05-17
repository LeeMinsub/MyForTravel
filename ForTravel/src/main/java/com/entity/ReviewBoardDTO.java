package com.entity;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;

@Alias("ReviewBoardDTO")
public class ReviewBoardDTO {
	private int num;
	private String title; 
	private String content; 
	private String userid; 
	private String writeday;
	private int readcnt;
	private String travelNation;
	private String travelLoc; 
	private String image1; 
	private String image2;
	private String image3;
	public ReviewBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewBoardDTO(int num, String title, String content, String userid, String writeday, int readcnt,
			String travelNation, String travelLoc, String image1, String image2, String image3) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.travelNation = travelNation;
		this.travelLoc = travelLoc;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getTravelNation() {
		return travelNation;
	}
	public void setTravelNation(String travelNation) {
		this.travelNation = travelNation;
	}
	public String getTravelLoc() {
		return travelLoc;
	}
	public void setTravelLoc(String travelLoc) {
		this.travelLoc = travelLoc;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	@Override
	public String toString() {
		return "ReviewBoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", userid=" + userid
				+ ", writeday=" + writeday + ", readcnt=" + readcnt + ", travelNation=" + travelNation + ", travelLoc="
				+ travelLoc + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + "]";
	}
	
	
	
}//end class
