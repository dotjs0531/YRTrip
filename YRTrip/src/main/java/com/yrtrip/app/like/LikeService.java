package com.yrtrip.app.like;

import java.util.List;

public interface LikeService {
	public void insertLike(LikeVO vo);
	public void deleteLike(LikeVO vo);
	public LikeVO getLike(LikeVO vo);
	public List<LikeVO> getLikeList(LikeVO vo);
}
