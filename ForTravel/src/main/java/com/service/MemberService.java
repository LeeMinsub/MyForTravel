package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.entity.MemberDTO;
import com.exception.CommonException;

@Service("MemberService")
public class MemberService {
	@Autowired
	private MemberDAO dao;
	
	
	 public MemberDTO login(HashMap<String, String> map)
	    		throws CommonException{
		 System.out.println("dao   :::::::::"+dao.login(map));
			return dao.login(map);
	    }//end login
	
	
	public void memberJoin(MemberDTO mDTO)throws CommonException{
		dao.memberJoin(mDTO);
	}	
}
