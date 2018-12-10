package com.yrtrip.app.joiner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.joiner.JoinerVO;

@Repository
public class JoinerDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 신청
	public void insertJoiner(JoinerVO vo) {
		System.out.println("mybatis 동행 신청 기능 처리");
		mybatis.update("joiner.inserJoiner", vo);
	}

	// 신청 취소
	public void deleteJoiner(JoinerVO vo) {
		System.out.println("mybatis 동생 신청 취소 기능 처리");
		mybatis.update("joiner.deleteJoiner", vo.getJoinnerid());
	}

	// 전체조회
	public List<JoinerVO> getJoinerList(JoinerVO vo) {
		System.out.println("mybatis 동행 신청 리스트 조회 기능 처리");
		return mybatis.selectList("joiner.getJoinerList", vo);
	}

}
