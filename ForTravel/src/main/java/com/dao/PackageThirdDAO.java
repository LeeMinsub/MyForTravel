package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.PackageThirdDTO;
import com.exception.CommonException;

@Repository("PackageThirdDAO")
public class PackageThirdDAO {
	String namespace="com.fortravel.PackageThirdMapper.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<PackageThirdDTO> packageAllList(int packageno) throws CommonException{
		return template.selectList(namespace+"packageAllList",packageno);
	}
	public List<PackageThirdDTO> packageList(String city) throws CommonException{
		return template.selectList(namespace+"packageList",city);
	}
	
	public int selectCountList(String loc) throws CommonException{
		return template.selectOne(namespace+"selectCountList",loc);
	}
	
	
	public List<PackageThirdDTO>packageTableAllList(PackageThirdDTO dto) throws CommonException{
		return template.selectList(namespace+"packageTableAllList",dto);
	}
	
}//end class
