package com.yrtrip.app.partner;

public class PartnerCommentVO {
	private int commentId;			//댓글번호
	private String userId;			//작성자
	private String userName;		//작성자 이름
	private String userGen;			//작성자 성별
	private String commentContent;	//댓글내용
	private String commentDate;		//댓글작성일
	private int commentPartnerid;	//동행글 번호
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGen() {
		return userGen;
	}
	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getCommentPartnerid() {
		return commentPartnerid;
	}
	public void setCommentPartnerid(int commentPartnerid) {
		this.commentPartnerid = commentPartnerid;
	}
}
