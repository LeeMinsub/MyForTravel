package com.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NoitceDAO;
import com.entity.TravelNoticeDTO;
import com.exception.CommonException;

@Service("NoitceService")
public class NoitceService {
	@Autowired
	private NoitceDAO dao;
	
	
	public TravelNoticeDTO TravelNoticeSelcet() throws CommonException{
		return dao.TravelNoticeSelcet();
	}
	public void BanDateUpdate()throws CommonException{
		dao.BanDateUpdate();;
	}
	public void WarningDateUpdate() throws CommonException{
		dao.WarningDateUpdate();
	}
}//end class
