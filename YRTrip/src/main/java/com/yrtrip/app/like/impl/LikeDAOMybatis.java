package com.yrtrip.app.like.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.like.LikeVO;

@Repository
public class LikeDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//등록
	public void insertLike(LikeVO vo) {
		mybatis.update("like.insertLike", vo);
	}
	//삭제
	public void deleteLike(LikeVO vo) {
		mybatis.update("like.deleteLike", vo.getLikeNo());
	}
	
	//좋아요 여부 조회
	public int getLike(LikeVO vo) {
		return mybatis.selectOne("like.getLike", vo);
	}
	//전체조회
	public List<LikeVO> getLikeList(LikeVO vo) {
		return mybatis.selectList("like.getLikeList", vo);
	}

}
