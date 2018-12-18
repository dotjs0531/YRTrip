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

	public LikeVO getLike(LikeVO vo) {
		return dao.getLike(vo);
	}

	public List<LikeVO> getLikeList(LikeVO vo) {
		return dao.getLikeList(vo);
	}

}
