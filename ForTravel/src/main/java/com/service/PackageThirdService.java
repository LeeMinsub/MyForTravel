package com.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PackageThirdDAO;
import com.entity.PackageThirdDTO;
import com.exception.CommonException;

@Service("PackageThirdService")
public class PackageThirdService {
	@Autowired
	private PackageThirdDAO dao;
	
	public List<PackageThirdDTO> packageAllList(int packageno) throws CommonException{
		return dao.packageAllList(packageno);
	}
	public List<PackageThirdDTO> packageList(String city) throws CommonException{
		return dao.packageList(city);
	}
	
	public int selectCountList(String loc) throws CommonException{
		return dao.selectCountList(loc);
	}
	
	
	public List<PackageThirdDTO>packageTableAllList(PackageThirdDTO dto) throws CommonException{
		return dao.packageTableAllList(dto);
	}
	
}//end class
