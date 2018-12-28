package com.yrtrip.app.travel;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yrtrip.app.like.LikeVO;

public class TravelBoardVO  extends LikeVO {

	private Integer travelNo;
	private int travelPerson;
	private int travelPay;
	private String travelSche;
	private String travelStart;
	private String travelEnd;
	private String travelTitle;
	private String travelContent;
	private String travelDate;
	private int travelHit;
	private int travelLike;
	private int tinfoId;
	private String userId;
	private String travelWith;
	private String travelPic;
	
	private String selectedTinfoModal;
	private String searchTinfo;
	
	private String sortCol;
	private int first;
	private int last;
	
	private String[] travelNoList;
	
	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(Integer travelNo) {
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
	public String getTravelEnd() {
		return travelEnd;
	}
	public void setTravelEnd(String travelEnd) {
		this.travelEnd = travelEnd;
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
	public String getTravelWith() {
		return travelWith;
	}
	public void setTravelWith(String travelWith) {
		this.travelWith = travelWith;
	}
	public String getTravelPic() {
		return travelPic;
	}
	public void setTravelPic(String travelPic) {
		this.travelPic = travelPic;
	}
	
	@JsonIgnore
	public String getSortCol() {
		return sortCol;
	}

	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}
	@JsonIgnore
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	
	@JsonIgnore
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	
	@JsonIgnore
	public String getSelectedTinfoModal() {
		return selectedTinfoModal;
	}
	public void setSelectedTinfoModal(String selectedTinfoModal) {
		this.selectedTinfoModal = selectedTinfoModal;
	}
	
	@JsonIgnore
	public String getSearchTinfo() {
		return searchTinfo;
	}
	
	public void setSearchTinfo(String searchTinfo) {
		this.searchTinfo = searchTinfo;
	}
	
	public String[] getTravelNoList() {
		return travelNoList;
	}
	public void setTravelNoList(String[] travelNoList) {
		this.travelNoList = travelNoList;
	}
	@Override
	public String toString() {
		return "TravelBoardVO [travelNo=" + travelNo + ", travelPerson=" + travelPerson + ", travelPay=" + travelPay
				+ ", travelSche=" + travelSche + ", travelStart=" + travelStart + ", travelTitle=" + travelTitle
				+ ", travelContent=" + travelContent + ", travelDate=" + travelDate + ", travelHit=" + travelHit
				+ ", travelLike=" + travelLike + ", tinfoId=" + tinfoId + ", userId=" + userId + ", travelWith="
				+ travelWith + ", travelPic=" + travelPic + ", selectedTinfoModal=" + selectedTinfoModal
				+ ", searchTinfo=" + searchTinfo + ", sortCol=" + sortCol + ", first=" + first + ", last=" + last + "]";
	}
}
