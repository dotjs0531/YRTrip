package com.yrtrip.app.travel;

public class TravelInfoVO {
	
	private int tinfoId;
	private String tinfoCountry;
	private String tinfoState;
	private String tinfoCity;
	private String tinfoLocation;
	
	private String sortCol;
	private String searchTinfo;
	private String searchCheck;
	private String searchCheckModal;
	private String tinfoList;
	private String tinfoListModal;
	
	public int getTinfoId() {
		return tinfoId;
	}
	public void setTinfoId(int tinfoId) {
		this.tinfoId = tinfoId;
	}
	public String getTinfoCountry() {
		return tinfoCountry;
	}
	public void setTinfoCountry(String tinfoCountry) {
		this.tinfoCountry = tinfoCountry;
	}
	public String getTinfoState() {
		return tinfoState;
	}
	public void setTinfoState(String tinfoState) {
		this.tinfoState = tinfoState;
	}
	public String getTinfoCity() {
		return tinfoCity;
	}
	public void setTinfoCity(String tinfoCity) {
		this.tinfoCity = tinfoCity;
	}
	public String getTinfoLocation() {
		return tinfoLocation;
	}
	public void setTinfoLocation(String tinfoLocation) {
		this.tinfoLocation = tinfoLocation;
	}
	public String getSortCol() {
		return sortCol;
	}
	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}
	public String getSearchTinfo() {
		return searchTinfo;
	}
	public void setSearchTinfo(String searchTinfo) {
		this.searchTinfo = searchTinfo;
	}
	public String getSearchCheck() {
		return searchCheck;
	}
	public void setSearchCheck(String searchCheck) {
		this.searchCheck = searchCheck;
	}
	
	public String getSearchCheckModal() {
		return searchCheckModal;
	}
	public void setSearchCheckModal(String searchCheckModal) {
		this.searchCheckModal = searchCheckModal;
	}
	public String getTinfoList() {
		return tinfoList;
	}
	public void setTinfoList(String tinfoList) {
		this.tinfoList = tinfoList;
	}
	public String getTinfoListModal() {
		return tinfoListModal;
	}
	public void setTinfoListModal(String tinfoListModal) {
		this.tinfoListModal = tinfoListModal;
	}
	@Override
	public String toString() {
		return "TravelInfoVO [tinfoId=" + tinfoId + ", tinfoCountry=" + tinfoCountry + ", tinfoState=" + tinfoState
				+ ", tinfoCity=" + tinfoCity + ", tinfoLocation=" + tinfoLocation + ", sortCol=" + sortCol
				+ ", searchTinfo=" + searchTinfo + ", searchCheck=" + searchCheck + ", searchCheckModal="
				+ searchCheckModal + ", tinfoList=" + tinfoList + ", tinfoListModal=" + tinfoListModal + "]";
	}
}
