package com.yrtrip.app.like.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.like.LikeService;
import com.yrtrip.app.like.LikeVO;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired LikeDAOMybatis dao;
	
	public void insertLike(LikeVO vo) {
		dao.insertLike(vo);
	}
	public void deleteLike(LikeVO vo) {
		dao.deleteLike(vo);
	}
	public int getLike(LikeVO vo) {
		return dao.getLike(vo);
	}
	public List<LikeVO> getLikeList(LikeVO vo) {
		return dao.getLikeList(vo);
	}

	public void plusTLikeCnt(LikeVO vo) {
		dao.plusTLikeCnt(vo);
	}
	public void plusPLikeCnt(LikeVO vo) {
		dao.plusPLikeCnt(vo);
	}
	public void plusILikeCnt(LikeVO vo) {
		dao.plusILikeCnt(vo);
	}
	
	public void minusTLikeCnt(LikeVO vo) {
		dao.minusTLikeCnt(vo);
	}
	public void minusPLikeCnt(LikeVO vo) {
		dao.minusPLikeCnt(vo);
	}
	public void minusILikeCnt(LikeVO vo) {
		dao.minusILikeCnt(vo);
	}
}
