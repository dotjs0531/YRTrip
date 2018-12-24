package com.yrtrip.app.like;

import java.util.List;

public interface LikeService {
	public void insertLike(LikeVO vo);
	public void deleteLike(LikeVO vo);
	public int getLike(LikeVO vo);
	public List<LikeVO> getLikeList(LikeVO vo);
	
	public void plusTLikeCnt(LikeVO vo);
	public void plusPLikeCnt(LikeVO vo);
	public void plusILikeCnt(LikeVO vo);
	
	public void minusTLikeCnt(LikeVO vo);
	public void minusPLikeCnt(LikeVO vo);
	public void minusILikeCnt(LikeVO vo);
}
