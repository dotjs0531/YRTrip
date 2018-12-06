package com.yrtrip.app.qna;

public class QnaVO {
	private int qnaId;			//글번호
	private String qnaTitle;	//글제목
	private String qnaContent;	//글내용
	private String userId;		//작성자ID
	private String userName;	//작성자이름
	private String qnaDate;		//작성일
	private String qnaAnswer;	//답변여부
	public int getQnaId() {
		return qnaId;
	}
	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
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
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	@Override
	public String toString() {
		return "QnaVO [qnaId=" + qnaId + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", userId=" + userId
				+ ", userName=" + userName + ", qnaDate=" + qnaDate + ", qnaAnswer=" + qnaAnswer + "]";
	}
	
}
