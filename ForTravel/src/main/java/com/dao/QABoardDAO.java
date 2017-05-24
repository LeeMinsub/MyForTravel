package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.entity.PackageThirdDTO;
import com.entity.QABoardDTO;
import com.exception.CommonException;

public class QABoardDAO {
	String namespace="com.fortravel.QABoardMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<QABoardDTO> QABoardSelect() throws CommonException{
		List<QABoardDTO> list=null;
		list=template.selectList(namespace+"QABoardSelect");
		System.out.println(list.size());
		return list;
	}
	
}//end class
