package com.yrtrip.app.travel;

public class TravelPlaceVO {

	private int placeNo;
	private String placeName;
	private String placeAddress;
	private int placeLike;
	private String placeDate;
	private String placeContent;
	private int placeTravelBoardNo;
	private String placePic;
	private String UserId;
	
	private String searchKeyword;
	private String searchCondition;
	
	private String sortCol;
	
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceAddress() {
		return placeAddress;
	}
	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}
	public int getPlaceLike() {
		return placeLike;
	}
	public void setPlaceLike(int placeLike) {
		this.placeLike = placeLike;
	}
	public String getPlaceDate() {
		return placeDate;
	}
	public void setPlaceDate(String placeDate) {
		this.placeDate = placeDate;
	}
	public String getPlaceContent() {
		return placeContent;
	}
	public void setPlaceContent(String placeContent) {
		this.placeContent = placeContent;
	}
	public int getPlaceTravelBoardNo() {
		return placeTravelBoardNo;
	}
	public void setPlaceTravelBoardNo(int placeTravelBoardNo) {
		this.placeTravelBoardNo = placeTravelBoardNo;
	}
	public String getPlacePic() {
		return placePic;
	}
	public void setPlacePic(String placePic) {
		this.placePic = placePic;
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSortCol() {
		return sortCol;
	}
	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}
		
}