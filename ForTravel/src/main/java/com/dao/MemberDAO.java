package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.MemberDTO;
import com.exception.CommonException;

@Repository("MemberDAO")
public class MemberDAO {
	String namespace="com.fortravel.MemberMapper.";
	@Autowired
	private SqlSessionTemplate template;
	
	
	 public MemberDTO login(HashMap<String, String> map)
	    		throws CommonException{
			return template.selectOne(namespace+"login", map);
	    }//end login
	
	
	public void memberJoin(MemberDTO mDTO)throws CommonException{
		int n=template.insert(namespace+"memberJoin",mDTO);
	}	
	public int idCheck(String userid)throws CommonException{
		int n=template.selectOne(namespace+"idCheck",userid);
		return n;
	}	
}
