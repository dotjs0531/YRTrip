package com.yrtrip.app.user;

public class MyPageVO extends UserVO {
	private int travelNo;			//글 번호
	private String travelTitle;		//글 제목
	private String travelPic;		//사진
	private String travelDate;		//등록일
	private int travelHit;			//조회수
	private int travelLike;			//좋아요 수
	
	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(int travelNo) {
		this.travelNo = travelNo;
	}
	public String getTravelTitle() {
		return travelTitle;
	}
	public void setTravelTitle(String travelTitle) {
		this.travelTitle = travelTitle;
	}
	public String getTravelPic() {
		return travelPic;
	}
	public void setTravelPic(String travelPic) {
		this.travelPic = travelPic;
	}
	public String getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public int getTravelHit() {
		return travelHit;
	}
	public void setTravelHit(int travelHit) {
		this.travelHit = travelHit;
	}
	public int getTravelLike() {
		return travelLike;
	}
	public void setTravelLike(int travelLike) {
		this.travelLike = travelLike;
	}
}
