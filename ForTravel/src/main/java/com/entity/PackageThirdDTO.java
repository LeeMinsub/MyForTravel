package com.entity;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;

@Alias("PackageThirdDTO")
public class PackageThirdDTO {
	private int packageno;
	private String company;
	private String startdate;
	private String lastdate;
	private String airline;
	private String startairplaneid;
	private String lastairplaneid;
	private String term;
	private String packagename;
	private int price;
	private String reservationab;
	private int minpersonnel;
	private int presentreservation;
	private int personnel;
	private String loc;
	private String link;
	private String image1;
	private String image2;
	private String image3;
	private String city;
	private String doorimg;
	private String overview;
	private String detail;
	private int babyprice;
	private int childprice;
	private int tax;
	private String imgdetail;
	
	public PackageThirdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PackageThirdDTO(int packageno, String company, String startdate, String lastdate, String airline,
			String startairplaneid, String lastairplaneid, String term, String packagename, int price,
			String reservationab, int minpersonnel, int presentreservation, int personnel, String loc, String link,
			String image1, String image2, String image3, String city, String doorimg, String overview, String detail,
			int babyprice, int childprice, int tax, String imgdetail) {
		super();
		this.packageno = packageno;
		this.company = company;
		this.startdate = startdate;
		this.lastdate = lastdate;
		this.airline = airline;
		this.startairplaneid = startairplaneid;
		this.lastairplaneid = lastairplaneid;
		this.term = term;
		this.packagename = packagename;
		this.price = price;
		this.reservationab = reservationab;
		this.minpersonnel = minpersonnel;
		this.presentreservation = presentreservation;
		this.personnel = personnel;
		this.loc = loc;
		this.link = link;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.city = city;
		this.doorimg = doorimg;
		this.overview = overview;
		this.detail = detail;
		this.babyprice = babyprice;
		this.childprice = childprice;
		this.tax = tax;
		this.imgdetail = imgdetail;
	}

	public int getPackageno() {
		return packageno;
	}

	public void setPackageno(int packageno) {
		this.packageno = packageno;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getLastdate() {
		return lastdate;
	}

	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getStartairplaneid() {
		return startairplaneid;
	}

	public void setStartairplaneid(String startairplaneid) {
		this.startairplaneid = startairplaneid;
	}

	public String getLastairplaneid() {
		return lastairplaneid;
	}

	public void setLastairplaneid(String lastairplaneid) {
		this.lastairplaneid = lastairplaneid;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getPackagename() {
		return packagename;
	}

	public void setPackagename(String packagename) {
		this.packagename = packagename;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getReservationab() {
		return reservationab;
	}

	public void setReservationab(String reservationab) {
		this.reservationab = reservationab;
	}

	public int getMinpersonnel() {
		return minpersonnel;
	}

	public void setMinpersonnel(int minpersonnel) {
		this.minpersonnel = minpersonnel;
	}

	public int getPresentreservation() {
		return presentreservation;
	}

	public void setPresentreservation(int presentreservation) {
		this.presentreservation = presentreservation;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDoorimg() {
		return doorimg;
	}

	public void setDoorimg(String doorimg) {
		this.doorimg = doorimg;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getBabyprice() {
		return babyprice;
	}

	public void setBabyprice(int babyprice) {
		this.babyprice = babyprice;
	}

	public int getChildprice() {
		return childprice;
	}

	public void setChildprice(int childprice) {
		this.childprice = childprice;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public String getImgdetail() {
		return imgdetail;
	}

	public void setImgdetail(String imgdetail) {
		this.imgdetail = imgdetail;
	}

	@Override
	public String toString() {
		return "PackageThirdDTO [packageno=" + packageno + ", company=" + company + ", startdate=" + startdate
				+ ", lastdate=" + lastdate + ", airline=" + airline + ", startairplaneid=" + startairplaneid
				+ ", lastairplaneid=" + lastairplaneid + ", term=" + term + ", packagename=" + packagename + ", price="
				+ price + ", reservationab=" + reservationab + ", minpersonnel=" + minpersonnel
				+ ", presentreservation=" + presentreservation + ", personnel=" + personnel + ", loc=" + loc + ", link="
				+ link + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", city=" + city
				+ ", doorimg=" + doorimg + ", overview=" + overview + ", detail=" + detail + ", babyprice=" + babyprice
				+ ", childprice=" + childprice + ", tax=" + tax + ", imgdetail=" + imgdetail + "]";
	}

	
}	