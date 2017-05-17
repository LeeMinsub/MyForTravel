package com.entity;

import org.apache.ibatis.type.Alias;
import org.springframework.beans.factory.annotation.Autowired;

@Alias("ReviewReplyDTO")
public class ReviewReplyDTO {
	private int num;
	private String content;
	private String userid;
	private String writeday;
	private int repRoot;
	private int repStep;
	private int repIndent;
	private int reviewNum;
	public ReviewReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewReplyDTO(int num, String content, String userid, String writeday, int repRoot, int repStep,
			int repIndent, int reviewNum) {
		super();
		this.num = num;
		this.content = content;
		this.userid = userid;
		this.writeday = writeday;
		this.repRoot = repRoot;
		this.repStep = repStep;
		this.repIndent = repIndent;
		this.reviewNum = reviewNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getRepRoot() {
		return repRoot;
	}
	public void setRepRoot(int repRoot) {
		this.repRoot = repRoot;
	}
	public int getRepStep() {
		return repStep;
	}
	public void setRepStep(int repStep) {
		this.repStep = repStep;
	}
	public int getRepIndent() {
		return repIndent;
	}
	public void setRepIndent(int repIndent) {
		this.repIndent = repIndent;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	@Override
	public String toString() {
		return "ReviewReplyDTO [num=" + num + ", content=" + content + ", userid=" + userid + ", writeday=" + writeday
				+ ", repRoot=" + repRoot + ", repStep=" + repStep + ", repIndent=" + repIndent + ", reviewNum="
				+ reviewNum + "]";
	}
	
	
	
}
