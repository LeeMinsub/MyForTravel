package com.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ReviewDAO;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.exception.CommonException;

@Service("ReviewService")
public class ReviewBoardService {
	@Autowired
	private ReviewDAO dao;
	
	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}
	public List<ReviewBoardDTO> staticReview(HashMap<String, String> map) throws CommonException{
		return dao.staticReview(map);
	}
	
	
	
	public List<ReviewBoardDTO> bestredcnt(int readcnt) throws CommonException{
		return dao.bestredcnt(readcnt);
	}	
	
	public void reviewBoardWrite(HashMap<String, String> map) throws CommonException{
		dao.reviewBoardWrite(map);
	}//end boardWrite
	
	public void ReviewReadcntUpdate(int num){
		//jsp,servlet 버전의 boardReadcnt 역할
		dao.ReviewReadcntUpdate(num);
	}	
	public void reviewBoardUpdate(HashMap<String, String> map) throws CommonException{
		dao.reviewBoardUpdate(map);
	}//end update
	
	
	public void reviewBoardDelete(int num) throws CommonException{
	dao.reviewBoardDelete(num);
	}//end delete	
	
	public ReviewBoardDTO boardRetrieve(int num){
	return dao.boardRetrieve(num);
	}
	
	public List<ReviewBoardDTO> ReviewBoardSelect() throws CommonException{
		return dao.ReviewBoardSelect();
	}
	//전체 레코드
	
	/*private int totalrecord(){
			SqlSession session=MySqlSessionFactory.openSession();
			int count=0;
			try{
				count=session.selectOne("totalrecord");
			}finally {
				session.close();
			}
			return dao.r;
		}//end total record
*/	
	public ReviewBoardPageDTO boardNewPage(HashMap<String, String> map){
		
		return dao.boardNewPage(map);
	}
	
	public List<String> locSelect(HashMap<String, String> map){
		return dao.locSelect(map);
	}
	
}//end class
