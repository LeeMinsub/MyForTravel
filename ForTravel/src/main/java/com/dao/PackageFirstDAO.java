package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.PackageFirstDTO;
import com.exception.CommonException;

@Repository("PackageFirstDAO")
public class PackageFirstDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	String namespace="com.fortravel.PackageFirstMapper.";
	
	
	public List<PackageFirstDTO> countryAllList(String loc) throws CommonException{
		return template.selectList(namespace+"countryAllList", loc);
	}
	
	public List<PackageFirstDTO> packageNewlist() throws CommonException{
		return template.selectList(namespace+"packageNewlist");
	}
	
	
	
}




