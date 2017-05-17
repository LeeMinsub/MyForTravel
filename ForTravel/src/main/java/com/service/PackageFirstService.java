package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PackageFirstDAO;
import com.entity.PackageFirstDTO;
import com.exception.CommonException;

@Service("PackageFirstService")
public class PackageFirstService {
	@Autowired
	private PackageFirstDAO dao;
	
	public void setDao(PackageFirstDAO dao) {
		this.dao = dao;
	}
	
	public List<PackageFirstDTO> countryAllList(String loc) throws CommonException{
		return dao.countryAllList(loc);
	}
	
	public List<PackageFirstDTO> packageNewlist() throws CommonException{
		return dao.packageNewlist();
	}
	
}//end class
