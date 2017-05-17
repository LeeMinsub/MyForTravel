package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.ReviewReplyDTO;

@Repository("ReviewReplyDAO")
public class ReviewReplyDAO {
	String namespace="com.fortravel.ReviewReplyMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void replyWrite(ReviewReplyDTO dto){
		int n=template.insert(namespace+"replyWrite", dto);
	}//end boardWrite
	
	public int replyUpdate(ReviewReplyDTO dto){
		int n=template.insert(namespace+"replyUpdate", dto);
		return n;
	}
	public int replyInsert(ReviewReplyDTO dto){
		int n=template.insert(namespace+"replyInsert", dto);
		int m=replyUpdate(dto);
	return n+m;
	}
	
	
	
	public List<ReviewReplyDTO> replyList(int reviewNum){
		   return template.selectList(namespace+"replyList", reviewNum);
	}
	
	
	
}//end class
