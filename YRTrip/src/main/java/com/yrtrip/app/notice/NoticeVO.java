package com.yrtrip.app.notice;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class NoticeVO {
	private int noticeId; //글번호
	private String noticeTitle; //글제목
	private String noticeContent;  //글내용
	private int noticeHit; //조회수
	private String noticeDate;  //작성일
	private String userName;  //작성자
	private String noticeImg;	//이미지 이름
	private MultipartFile noticeImgFile;	//실제 이미지 파일
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeHit() {
		return noticeHit;
	}
	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getNoticeImg() {
		return noticeImg;
	}
	public void setNoticeImg(String noticeImg) {
		this.noticeImg = noticeImg;
	}
	@JsonIgnore
	public MultipartFile getNoticeImgFile() {
		return noticeImgFile;
	}
	public void setNoticeImgFile(MultipartFile noticeImgFile) {
		this.noticeImgFile = noticeImgFile;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeHit=" + noticeHit + ", noticeDate=" + noticeDate + ", userName=" + userName + "]";
	}
	
}
