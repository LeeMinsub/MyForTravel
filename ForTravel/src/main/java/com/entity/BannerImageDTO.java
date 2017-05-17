package com.entity;

import org.apache.ibatis.type.Alias;

@Alias("BannerImageDTO")
public class BannerImageDTO {
	private int num;
	private String imageName;
	private String imageCaption;
	public BannerImageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BannerImageDTO(int num, String imageName, String imageCaption) {
		super();
		this.num = num;
		this.imageName = imageName;
		this.imageCaption = imageCaption;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageCaption() {
		return imageCaption;
	}
	public void setImageCaption(String imageCaption) {
		this.imageCaption = imageCaption;
	}
	

}
