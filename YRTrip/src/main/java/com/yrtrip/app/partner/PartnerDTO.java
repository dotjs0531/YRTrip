package com.yrtrip.app.partner;

import org.springframework.stereotype.Repository;

@Repository
public class PartnerDTO {
	private Integer partnerNo;			//	동행게시판번호
	private String	partnerTitle;		//	동행게시판제목
	private Integer PartnerHit;			//	동행게시판조회수
	private	String	PartnerDate;		//	동행게시판등록일
	
	private	String	partnerPay;			//	동행 비용
	private	String	partnerClass;		//	동행 문화, 맛집, 여행
	private String	partnerPerson;		//	동행 인원
	private String	partnerStartDate;	//	출발일
	private String	partnerFinishDate;	//	도착일
	private String	partnerCondition;	//	현재 상태
	
	private String	userId;				//	글쓴이
	private	String	tinfoId;			//	여행정보 ID
	
	private String searchCondition;		//
	private String searchKeyword;		//	검색키워드
	
	private String sortCol;				//	정렬
	
	private String[] seqList;			//
	
	public Integer getPartnerNo() {
		return partnerNo;
	}
	public void setPartnerNo(Integer partnerNo) {
		this.partnerNo = partnerNo;
	}
	public String getPartnerTitle() {
		return partnerTitle;
	}
	public void setPartnerTitle(String partnerTitle) {
		this.partnerTitle = partnerTitle;
	}
	public Integer getPartnerHit() {
		return PartnerHit;
	}
	public void setPartnerHit(Integer partnerHit) {
		PartnerHit = partnerHit;
	}
	public String getPartnerDate() {
		return PartnerDate;
	}
	public void setPartnerDate(String partnerDate) {
		PartnerDate = partnerDate;
	}
	public String getPartnerPay() {
		return partnerPay;
	}
	public void setPartnerPay(String partnerPay) {
		this.partnerPay = partnerPay;
	}
	public String getPartnerClass() {
		return partnerClass;
	}
	public void setPartnerClass(String partnerClass) {
		this.partnerClass = partnerClass;
	}
	public String getPartnerPerson() {
		return partnerPerson;
	}
	public void setPartnerPerson(String partnerPerson) {
		this.partnerPerson = partnerPerson;
	}
	public String getPartnerStartDate() {
		return partnerStartDate;
	}
	public void setPartnerStartDate(String partnerStartDate) {
		this.partnerStartDate = partnerStartDate;
	}
	public String getPartnerFinishDate() {
		return partnerFinishDate;
	}
	public void setPartnerFinishDate(String partnerFinishDate) {
		this.partnerFinishDate = partnerFinishDate;
	}
	public String getPartnerCondition() {
		return partnerCondition;
	}
	public void setPartnerCondition(String partnerCondition) {
		this.partnerCondition = partnerCondition;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTinfoId() {
		return tinfoId;
	}
	public void setTinfoId(String tinfoId) {
		this.tinfoId = tinfoId;
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
