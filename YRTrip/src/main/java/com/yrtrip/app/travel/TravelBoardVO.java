package com.yrtrip.app.travel;

public class TravelBoardVO {

	private int travelNo;
	private int travelperson;
	private int travelPay;
	private String travelSche;
	private String travelStart;
	private String travelTitle;
	private String travelContent;
	private String travelDate;
	private int travelHit;
	private int travelLike;
	private int tinfoId;
	private String userId;
	private int travelWith;
	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(int travelNo) {
		this.travelNo = travelNo;
	}
	public int getTravelperson() {
		return travelperson;
	}
	public void setTravelperson(int travelperson) {
		this.travelperson = travelperson;
	}
	public int getTravelPay() {
		return travelPay;
	}
	public void setTravelPay(int travelPay) {
		this.travelPay = travelPay;
	}
	public String getTravelSche() {
		return travelSche;
	}
	public void setTravelSche(String travelSche) {
		this.travelSche = travelSche;
	}
	public String getTravelStart() {
		return travelStart;
	}
	public void setTravelStart(String travelStart) {
		this.travelStart = travelStart;
	}
	public String getTravelTitle() {
		return travelTitle;
	}
	public void setTravelTitle(String travelTitle) {
		this.travelTitle = travelTitle;
	}
	public String getTravelContent() {
		return travelContent;
	}
	public void setTravelContent(String travelContent) {
		this.travelContent = travelContent;
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
	public int getTinfoId() {
		return tinfoId;
	}
	public void setTinfoId(int tinfoId) {
		this.tinfoId = tinfoId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTravelWith() {
		return travelWith;
	}
	public void setTravelWith(int travelWith) {
		this.travelWith = travelWith;
	}
	@Override
	public String toString() {
		return "TravelBoardVO [travelNo=" + travelNo + ", travelperson=" + travelperson + ", travelPay=" + travelPay
				+ ", travelSche=" + travelSche + ", travelStart=" + travelStart + ", travelTitle=" + travelTitle
				+ ", travelContent=" + travelContent + ", travelDate=" + travelDate + ", travelHit=" + travelHit
				+ ", travelLike=" + travelLike + ", tinfoId=" + tinfoId + ", userId=" + userId + ", travelWith="
				+ travelWith + "]";
	}
}
