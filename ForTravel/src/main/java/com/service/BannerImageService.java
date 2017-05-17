package com.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BannerImageDAO;
import com.entity.BannerImageDTO;
import com.exception.CommonException;

@Service("BannerImageService")
public class BannerImageService {
	@Autowired
	private BannerImageDAO dao;
	
	public void setDao(BannerImageDAO dao) {
		this.dao = dao;
	}
	
	public BannerImageDTO BannerImageSelect() throws CommonException{
		return dao.BannerImageSelect();
	}
	public void BannerImageInsert(BannerImageDTO dto)throws CommonException{
		dao.BannerImageInsert(dto);
	}
	public void BannerUpdate(BannerImageDTO dto) throws CommonException{
		dao.BannerUpdate(dto);
	}
}//end class
