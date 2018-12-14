package com.yrtrip.app.travel;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class TravelBoardVO {

	private int travelNo;
	private int travelPerson;
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
	private String travelPic;
	
	private String searchKeyword;
	private String searchCondition;
	private String sortCol;
	private int first;
	private int last;
	
	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(int travelNo) {
		this.travelNo = travelNo;
	}
	public int getTravelPerson() {
		return travelPerson;
	}
	public void setTravelPerson(int travelPerson) {
		this.travelPerson = travelPerson;
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
	public String getTravelPic() {
		return travelPic;
	}
	public void setTravelPic(String travelPic) {
		this.travelPic = travelPic;
	}
	
	@JsonIgnore
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@JsonIgnore
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	@JsonIgnore
	public String getSortCol() {
		return sortCol;
	}
	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
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
