package com.yrtrip.app.travel.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.travel.TravelInfoVO;

@Repository
public class TravelInfoDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<TravelInfoVO> getTravelInfoList(TravelInfoVO vo) {
		return sqlSession.selectList("travelInfo.getTravelInfoList", vo);
	}
	
}
