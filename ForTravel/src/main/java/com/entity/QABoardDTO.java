package com.entity;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;

@Alias("QABoardDTO")
public class QABoardDTO {
	private int num;
	private String title;
	private String content;
	private String userid;
	private String writeday;
	private int readcnt;
	public QABoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QABoardDTO(int num, String title, String content, String userid, String writeday, int readcnt) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.writeday = writeday;
		this.readcnt = readcnt;
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
	@Override
	public String toString() {
		return "QABoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", userid=" + userid
				+ ", writeday=" + writeday + ", readcnt=" + readcnt + "]";
	}
	
	
	
	
	
	
}
