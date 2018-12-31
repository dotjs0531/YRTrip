package com.yrtrip.app.joiner;

import org.springframework.stereotype.Repository;

@Repository
public class JoinerVO {

	private Integer joinerId; // 동행신청 번호
	private String joinerDate; // 신청일
	private String userId; // 신청자 ID
	private String userName; // 회원 이름
	private String userGen;	// 회원 성별
	
	private int partnerId;	// 동행글(참조키)
	private String joinerCondition;
	private Integer	pageUnit;

	//선택삭제
	private String[] joinerNoList;
	
	public Integer getJoinerId() {
		return joinerId;
	}
	public void setJoinerId(Integer joinerId) {
		this.joinerId = joinerId;
	}
	public String getJoinerDate() {
		return joinerDate;
	}
	public void setJoinerDate(String joinerDate) {
		this.joinerDate = joinerDate;
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
	public String getUserGen() {
		return userGen;
	}
	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}
	
	public int getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(int partnerId) {
		this.partnerId = partnerId;
	}
	public String getJoinerCondition() {
		return joinerCondition;
	}
	public void setJoinerCondition(String joinerCondition) {
		this.joinerCondition = joinerCondition;
	}
	public Integer getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(Integer pageUnit) {
		this.pageUnit = pageUnit;
	}
	
	public String[] getJoinerNoList() {
		return joinerNoList;
	}
	public void setJoinerNoList(String[] joinerNoList) {
		this.joinerNoList = joinerNoList;
	}
	
	@Override
	public String toString() {
		return "JoinerVO [joinerId=" + joinerId + ", joinerDate=" + joinerDate + ", userId=" + userId + ", partnerId="
				+ partnerId + ", joinerCondition=" + joinerCondition + ", pageUnit=" + pageUnit + "]";
	}
	
}
