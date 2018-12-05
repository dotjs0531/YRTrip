package com.yrtrip.app.partner;

import org.springframework.stereotype.Repository;

@Repository
public class PartnerVO {
	private Integer	partnerno; // 동행게시판번호
	private String	partnertitle; // 동행게시판제목
	private String	partnercontent;	//동행게시판내용
	private Integer Partnerhit; // 동행게시판조회수
	private String	Partnerdate; // 동행게시판등록일

	private String partnerpay; // 동행 비용
	private String partnerclass; // 동행 문화, 맛집, 여행
	private String partnerperson; // 동행 인원
	private String partnerstartdate; // 출발일
	private String partnerfinishdate; // 도착일
	private String partnercondition; // 현재 상태

	private String userid; // 글쓴이
	private String tinfoid; // 여행정보 ID

	private String searchcondition; //
	private String searchkeyword; // 검색키워드

	private String sortCol; // 정렬

	private String[] seqList; //

	public Integer getPartnerno() {
		return partnerno;
	}

	public void setPartnerno(Integer partnerno) {
		this.partnerno = partnerno;
	}

	public String getPartnertitle() {
		return partnertitle;
	}

	public void setPartnertitle(String partnertitle) {
		this.partnertitle = partnertitle;
	}

	public String getPartnercontent() {
		return partnercontent;
	}

	public void setPartnercontent(String partnercontent) {
		this.partnercontent = partnercontent;
	}

	public Integer getPartnerhit() {
		return Partnerhit;
	}

	public void setPartnerhit(Integer partnerhit) {
		Partnerhit = partnerhit;
	}

	public String getPartnerdate() {
		return Partnerdate;
	}

	public void setPartnerdate(String partnerdate) {
		Partnerdate = partnerdate;
	}

	public String getPartnerpay() {
		return partnerpay;
	}

	public void setPartnerpay(String partnerpay) {
		this.partnerpay = partnerpay;
	}

	public String getPartnerclass() {
		return partnerclass;
	}

	public void setPartnerclass(String partnerclass) {
		this.partnerclass = partnerclass;
	}

	public String getPartnerperson() {
		return partnerperson;
	}

	public void setPartnerperson(String partnerperson) {
		this.partnerperson = partnerperson;
	}

	public String getPartnerstartdate() {
		return partnerstartdate;
	}

	public void setPartnerstartDate(String partnerstartdate) {
		this.partnerstartdate = partnerstartdate;
	}

	public String getPartnerfinishdate() {
		return partnerfinishdate;
	}

	public void setPartnerfinishdate(String partnerfinishdate) {
		this.partnerfinishdate = partnerfinishdate;
	}

	public String getPartnercondition() {
		return partnercondition;
	}

	public void setPartnercondition(String partnercondition) {
		this.partnercondition = partnercondition;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTinfoid() {
		return tinfoid;
	}

	public void setTinfoid(String tinfoid) {
		this.tinfoid = tinfoid;
	}

	public String getSearchcondition() {
		return searchcondition;
	}

	public void setSearchcondition(String searchcondition) {
		this.searchcondition = searchcondition;
	}

	public String getSearchkeyword() {
		return searchkeyword;
	}

	public void setSearchkeyword(String searchkeyword) {
		this.searchkeyword = searchkeyword;
	}

	public String getSortCol() {
		return sortCol;
	}

	public void setSortCol(String sortCol) {
		this.sortCol = sortCol;
	}

	public String[] getSeqList() {
		return seqList;
	}

	public void setSeqList(String[] seqList) {
		this.seqList = seqList;
	}
}
