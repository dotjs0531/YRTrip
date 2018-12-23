package com.yrtrip.app.joiner;

import org.springframework.stereotype.Repository;

@Repository
public class JoinerVO {

	private Integer joinerId;
	private String joinerDate;
	private String userId;
	private String partnerId;	// 참조키
	private String joinerCondition;
	private Integer	pageUnit;
	
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
	public String getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(String partnerId) {
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
	
	@Override
	public String toString() {
		return "JoinerVO [joinerId=" + joinerId + ", joinerDate=" + joinerDate + ", userId=" + userId + ", partnerId="
				+ partnerId + ", joinerCondition=" + joinerCondition + ", pageUnit=" + pageUnit + "]";
	}
	
}
