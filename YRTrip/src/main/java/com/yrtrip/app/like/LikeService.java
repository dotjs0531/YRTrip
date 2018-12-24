package com.yrtrip.app.like;

import java.util.List;

public interface LikeService {
	public void insertLike(LikeVO vo);
	public void deleteLike(LikeVO vo);
	public int getLike(LikeVO vo);
	public List<LikeVO> getLikeList(LikeVO vo);
	
	public void updateTLikeCnt(LikeVO vo);
	public void updatePLikeCnt(LikeVO vo);
	public void updateILikeCnt(LikeVO vo);
}
