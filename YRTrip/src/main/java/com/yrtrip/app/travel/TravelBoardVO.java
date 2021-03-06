package com.yrtrip.app.travel;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

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
	private String tinfoCity;
	private String userId;
	private String userName;
	private String travelWith;
	private String travelPic;
	private MultipartFile travelPicFile;
	
	private String selectedTinfoModal;
	private String searchTinfo;
	
	private String searchCondition;
	private String searchKeyword;
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
	public String getTinfoCity() {
		return tinfoCity;
	}
	public void setTinfoCity(String tinfoCity) {
		this.tinfoCity = tinfoCity;
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
	public MultipartFile getTravelPicFile() {
		return travelPicFile;
	}
	public void setTravelPicFile(MultipartFile travelPicFile) {
		this.travelPicFile = travelPicFile;
	}
	public int getFirst() {
		return first;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
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
	public String getSelectedTinfoModal() {
		return selectedTinfoModal;
	}
	public void setSelectedTinfoModal(String selectedTinfoModal) {
		this.selectedTinfoModal = selectedTinfoModal;
	}
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
				+ ", travelSche=" + travelSche + ", travelStart=" + travelStart + ", travelEnd=" + travelEnd
				+ ", travelTitle=" + travelTitle + ", travelContent=" + travelContent + ", travelDate=" + travelDate
				+ ", travelHit=" + travelHit + ", travelLike=" + travelLike + ", tinfoId=" + tinfoId + ", tinfoCity="
				+ tinfoCity + ", userId=" + userId + ", travelWith=" + travelWith + ", travelPic=" + travelPic
				+ ", travelPicFile=" + travelPicFile + ", selectedTinfoModal=" + selectedTinfoModal + ", searchTinfo="
				+ searchTinfo + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", first="
				+ first + ", last=" + last + ", travelNoList=" + Arrays.toString(travelNoList) + ", getTravelNo()="
				+ getTravelNo() + ", getTravelPerson()=" + getTravelPerson() + ", getTravelPay()=" + getTravelPay()
				+ ", getTravelSche()=" + getTravelSche() + ", getTravelStart()=" + getTravelStart()
				+ ", getTravelEnd()=" + getTravelEnd() + ", getTravelTitle()=" + getTravelTitle()
				+ ", getTravelContent()=" + getTravelContent() + ", getTravelDate()=" + getTravelDate()
				+ ", getTravelHit()=" + getTravelHit() + ", getTravelLike()=" + getTravelLike() + ", getTinfoId()="
				+ getTinfoId() + ", getTinfoCity()=" + getTinfoCity() + ", getUserId()=" + getUserId()
				+ ", getTravelWith()=" + getTravelWith() + ", getTravelPic()=" + getTravelPic()
				+ ", getTravelPicFile()=" + getTravelPicFile() + ", getFirst()=" + getFirst()
				+ ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getLast()=" + getLast() + ", getSelectedTinfoModal()=" + getSelectedTinfoModal()
				+ ", getSearchTinfo()=" + getSearchTinfo() + ", getTravelNoList()=" + Arrays.toString(getTravelNoList())
				+ ", getLikeNo()=" + getLikeNo() + ", getLikeCategory()=" + getLikeCategory() + ", getLikeBoardid()="
				+ getLikeBoardid() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	
}
