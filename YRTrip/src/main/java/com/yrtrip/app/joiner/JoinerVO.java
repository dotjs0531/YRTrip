package com.yrtrip.app.joiner;

import org.springframework.stereotype.Repository;

@Repository
public class JoinerVO {

	private Integer joinerid;
	private String joinerdate;
	private String userid;
	private String partnerid;	// 참조키
	private String joinercondition;
	private Integer	pageUnit;
	
	public Integer getJoinerid() {
		return joinerid;
	}
	public void setJoinerid(Integer joinerid) {
		this.joinerid = joinerid;
	}
	public String getJoinerdate() {
		return joinerdate;
	}
	public void setJoinerdate(String joinerdate) {
		this.joinerdate = joinerdate;
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
	public String getJoinercondition() {
		return joinercondition;
	}
	public void setJoinercondition(String joinercondition) {
		this.joinercondition = joinercondition;
	}
	public Integer getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(Integer pageUnit) {
		this.pageUnit = pageUnit;
	}
	
	@Override
	public String toString() {
		return "JoinerVO [joinerid=" + joinerid + ", joinerdate=" + joinerdate + ", userid=" + userid + ", partnerid="
				+ partnerid + ", joinercondition=" + joinercondition + ", pageUnit=" + pageUnit + "]";
	}
	
	
	
}
