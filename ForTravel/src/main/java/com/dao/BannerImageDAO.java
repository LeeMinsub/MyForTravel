package com.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.BannerImageDTO;
import com.exception.CommonException;

@Repository("BannerImageDAO")
public class BannerImageDAO {
	String namespace="com.fortravel.BannerImageMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	public BannerImageDTO BannerImageSelect() throws CommonException{
		return template.selectOne(namespace+"BannerImageSelect");
	}
	public void BannerImageInsert(BannerImageDTO dto)throws CommonException{
		int n=template.insert(namespace+"BannerImageInsert",dto);
	}
	public void BannerUpdate(BannerImageDTO dto) throws CommonException{
		int n=template.update(namespace+"BannerUpdate",dto);
	}
}
