package com.entity;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;

@Alias("ReviewBoardPageDTO")
public class ReviewBoardPageDTO {
	private List<ReviewBoardDTO> list; 
	private int totalrecord; //전체 레코드
	private int perpage =3; //한 페이지에 보여줄 레코드 갯수
	private int curpage; //현재 페이지 번호
	public ReviewBoardPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewBoardPageDTO(List<ReviewBoardDTO> list, int totalrecord, int perpage, int curpage) {
		super();
		this.list = list;
		this.totalrecord = totalrecord;
		this.perpage = perpage;
		this.curpage = curpage;
	}
	public List<ReviewBoardDTO> getList() {
		return list;
	}
	public void setList(List<ReviewBoardDTO> list) {
		this.list = list;
	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	public int getPerpage() {
		return perpage;
	}
	public void setPerpage(int perpage) {
		this.perpage = perpage;
	}
	public int getCurpage() {
		return curpage;
	}
	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	
	
	
	
	
	
	
	
}
