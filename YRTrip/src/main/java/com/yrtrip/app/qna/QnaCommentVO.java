package com.yrtrip.app.qna;

public class QnaCommentVO {
	private int commentId;			//답변번호
	private String userId;			//작성자(admin)
	private String commentContent;	//답변내용
	private String commentDate;		//답변일자
	private int commentQnaid;		//문의글 번호
	
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
	public int getCommentQnaid() {
		return commentQnaid;
	}
	public void setCommentQnaid(int commentQnaid) {
		this.commentQnaid = commentQnaid;
	}
	
}
