package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.exception.CommonException;

@Repository("Reviewdao")
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	/*public void insert(DeptDTO dto){
		int n = template.insert("dept.bbb", dto);
	}*/
	public List<ReviewBoardDTO> bestredcnt(int readcnt)throws CommonException{
		return template.selectList("ReviewBoardMapper.bestredcnt",readcnt);
		
	}
	public List<ReviewBoardDTO> staticReview(HashMap<String, String> map) throws CommonException {
	
		return template.selectList("ReviewBoardMapper.staticReview",map);
	}
	
	public void reviewBoardWrite(HashMap<String, String> map) throws CommonException{
		int n = template.insert("ReviewBoardMapper.reviewBoardWrite", map);
	}//end boardWrite
	
	public void ReviewReadcntUpdate(int num){
		//jsp,servlet 버전의 boardReadcnt 역할
		int n=template.update("ReviewBoardMapper.ReviewReadcntUpdate",num);
	}	
	
	public void reviewBoardUpdate(HashMap<String, String> map) throws CommonException{
		int n=template.update("ReviewBoardMapper.reviewBoardUpdate",map);
	}//end update
	
	
	public void reviewBoardDelete(int num) throws CommonException{
		int n=template.delete("ReviewBoardMapper.reviewBoardDelete", num);
	}//end delete	
	
	//여기까지 함
	public ReviewBoardDTO boardRetrieve(int num){
		return template.selectOne("ReviewBoardMapper.boardRetrieve", num);
	}
	
	public List<ReviewBoardDTO> ReviewBoardSelect() throws CommonException{
		return template.selectList("ReviewBoardMapper.ReviewBoardSelect");
	}
	//전체 레코드
	
	private int totalrecord(HashMap<String, String> map){
			return template.selectOne("ReviewBoardMapper.totalrecord",map);
		}//end total record
	
	public ReviewBoardPageDTO boardNewPage(HashMap<String, String> map){
		ReviewBoardPageDTO page=new ReviewBoardPageDTO();
		int curPage=Integer.parseInt(map.get("curpage"));
		int perPage=Integer.parseInt(map.get("perPage"));
		
		List<ReviewBoardDTO> list=null;
		int skip=(curPage-1)*page.getPerpage();
		page.setPerpage(perPage);
			//pageDTO에 4가지 정보 저장
		list=template.selectList("ReviewBoardMapper.boardNewPage", map, new RowBounds(skip,page.getPerpage()));
		page.setList(list);
		page.setCurpage(curPage);
		page.setTotalrecord(totalrecord(map));
		
		return page;
	}
	
	public List<String> locSelect(HashMap<String, String> map){
		return template.selectList("ReviewBoardMapper.locSelect", map);
	}
	
	
	
}




