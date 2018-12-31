package com.yrtrip.app.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map> getTinfoChart(String day) {
		return sqlSession.selectList("admin.getTinfoChart", day);
	}
	
}
