package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReviewReplyDAO;
import com.entity.ReviewReplyDTO;

@Service("ReviewReplyService")
public class ReviewReplyService {
	@Autowired
	private ReviewReplyDAO dao;
	
	public void replyWrite(ReviewReplyDTO dto){
		dao.replyWrite(dto);
	}//end boardWrite
	
	public int replyUpdate(ReviewReplyDTO dto){
		int n=dao.replyUpdate(dto);
		return n;
	}
	public int replyInsert(ReviewReplyDTO dto){
		int n=dao.replyInsert(dto);
		int m=replyUpdate(dto);
	return n+m;
	}
	
	public List<ReviewReplyDTO> replyList(int reviewNum){
		   return dao.replyList(reviewNum);
	}
	
}//end class
