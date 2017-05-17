package com.entity;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;

@Alias("PackageFirstDTO")
public class PackageFirstDTO {
	private int packageno;
	private String packagename;
	private String price;
	private String term;
	private String loc;
	private String image;
	public PackageFirstDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PackageFirstDTO(int packageno, String packagename, String price, String term, String loc, String image) {
		super();
		this.packageno = packageno;
		this.packagename = packagename;
		this.price = price;
		this.term = term;
		this.loc = loc;
		this.image = image;
	}
	public int getPackageno() {
		return packageno;
	}
	public void setPackageno(int packageno) {
		this.packageno = packageno;
	}
	public String getPackagename() {
		return packagename;
	}
	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "PackageFirstDTO [packageno=" + packageno + ", packagename=" + packagename + ", price=" + price
				+ ", term=" + term + ", loc=" + loc + ", image=" + image + "]";
	}
	
}
