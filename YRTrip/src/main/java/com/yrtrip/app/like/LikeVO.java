package com.yrtrip.app.like;

public class LikeVO {
	private int likeNo;				//좋아요 번호(PK)
	private String userId;			//좋아요 누른 사용자
	private String likeCategory;	//카테고리(여행지P or 여행정보T or 상품I)
	private int likeBoardid;		//좋아요 받은 게시글 번호
	
	//선택삭제
	private String[] likeNoList;
	
	private int first;
	private int last;
	
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLikeCategory() {
		return likeCategory;
	}
	public void setLikeCategory(String likeCategory) {
		this.likeCategory = likeCategory;
	}
	public int getLikeBoardid() {
		return likeBoardid;
	}
	public void setLikeBoardid(int likeBoardid) {
		this.likeBoardid = likeBoardid;
	}
	
	public String[] getLikeNoList() {
		return likeNoList;
	}
	public void setLikeNoList(String[] likeNoList) {
		this.likeNoList = likeNoList;
	}
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	
}
