package com.yrtrip.app.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.admin.AdminVO;

@Repository
public class AdminDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<AdminVO> getTinfoChart(AdminVO vo) {
		return sqlSession.selectList("admin.getTinfoChart", vo);
	}
	
}
