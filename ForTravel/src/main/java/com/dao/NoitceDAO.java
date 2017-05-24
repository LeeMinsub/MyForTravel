package com.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TravelNoticeDTO;
import com.exception.CommonException;

@Repository("NoticeDAO")
public class NoitceDAO {
	String namespace="com.fortravel.TravelNoticeMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	public TravelNoticeDTO TravelNoticeSelcet() throws CommonException{
		return template.selectOne(namespace+"TravelNoticeSelcet");
	}
	public void BanDateUpdate()throws CommonException{
		int n=template.update(namespace+"BanDateUpdate");
	}
	public void WarningDateUpdate() throws CommonException{
		int n=template.update(namespace+"WarningDateUpdate");
	}
}
