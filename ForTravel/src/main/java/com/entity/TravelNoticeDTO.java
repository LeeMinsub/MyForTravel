package com.entity;

import org.apache.ibatis.type.Alias;

@Alias("TravelNoticeDTO")
public class TravelNoticeDTO {
	private int num;
	private String bandate;
	private String warningDate;
	public TravelNoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TravelNoticeDTO(int num, String bandate, String warningDate) {
		super();
		this.num = num;
		this.bandate = bandate;
		this.warningDate = warningDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBandate() {
		return bandate;
	}
	public void setBandate(String bandate) {
		this.bandate = bandate;
	}
	public String getWarningDate() {
		return warningDate;
	}
	public void setWarningDate(String warningDate) {
		this.warningDate = warningDate;
	}
	
	

}
