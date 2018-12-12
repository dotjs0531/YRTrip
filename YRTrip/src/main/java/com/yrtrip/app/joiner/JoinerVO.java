package com.yrtrip.app.joiner;

import org.springframework.stereotype.Repository;

@Repository
public class JoinerVO {

	private Integer joinnerid;
	private String joinnerdate;
	private String userid;
	private String partnerid;	// 참조키
	private String joinnercondition;
	private Integer	pageUnit;
	
	public Integer getJoinnerid() {
		return joinnerid;
	}
	public void setJoinnerid(Integer joinnerid) {
		this.joinnerid = joinnerid;
	}
	public String getJoinnerdate() {
		return joinnerdate;
	}
	public void setJoinnerdate(String joinnerdate) {
		this.joinnerdate = joinnerdate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPartnerid() {
		return partnerid;
	}
	public void setPartnerid(String partnerid) {
		this.partnerid = partnerid;
	}
	public String getJoinnercondition() {
		return joinnercondition;
	}
	public void setJoinnercondition(String joinnercondition) {
		this.joinnercondition = joinnercondition;
	}
	
	public Integer getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(Integer pageUnit) {
		this.pageUnit = pageUnit;
	}
	@Override
	public String toString() {
		return "JoinnerVO [joinnerid=" + joinnerid + ", joinnerdate=" + joinnerdate + ", userid=" + userid
				+ ", partnerid=" + partnerid + ", joinnercondition=" + joinnercondition + "]";
	}
	
	
}
