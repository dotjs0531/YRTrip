package com.yrtrip.app.partner;

import org.springframework.stereotype.Repository;

import com.yrtrip.app.travel.TravelInfoVO;

@Repository
public class PartnerVO extends TravelInfoVO {
	private Integer	partnerId; // 동행게시판번호
	private String	partnerTitle; // 동행게시판제목
	private String	partnerContent;	//동행게시판내용
	private Integer PartnerHit; // 동행게시판조회수
	private String	PartnerDate; // 동행게시판등록일

	private String partnerPay; // 동행 비용
	private String partnerClass; // 동행 문화, 맛집, 여행
	private String partnerPers; // 동행 인원
	private String partnerStart; // 출발일
	private String partnerEnd; // 도착일
	private String partnerCondition; // 현재 상태
	
	private String userId; // 작성자ID
	private String userName; // 회원 이름
	private String userGen;	// 회원 성별
	private int tinfoId; // 여행정보 ID
	
	private int joinerCnt;	//동행 신청자수

	private String searchCondition; //
	private String searchClass;
	private String searchKeyword; // 검색키워드
	private String selectedTinfoModal;
	private String searchTinfo;
	private String searchPartnerStart;
	private String searchPartnerEnd;
	
	private String sortCol; // 정렬

	private String[] seqList; //
	private int first;
	private int last;
	
	
	public Integer getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(Integer partnerId) {
		this.partnerId = partnerId;
	}
	public String getPartnerTitle() {
		return partnerTitle;
	}
	public void setPartnerTitle(String partnerTitle) {
		this.partnerTitle = partnerTitle;
	}
	public String getPartnerContent() {
		return partnerContent;
	}
	public void setPartnerContent(String partnerContent) {
		this.partnerContent = partnerContent;
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
	public String getPartnerPers() {
		return partnerPers;
	}
	public void setPartnerPers(String partnerPers) {
		this.partnerPers = partnerPers;
	}
	public String getPartnerStart() {
		return partnerStart;
	}
	public void setPartnerStart(String partnerStart) {
		this.partnerStart = partnerStart;
	}
	public String getPartnerEnd() {
		return partnerEnd;
	}
	public void setPartnerEnd(String partnerEnd) {
		this.partnerEnd = partnerEnd;
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
	public int getTinfoId() {
		return tinfoId;
	}
	public void setTinfoId(int tinfoId) {
		this.tinfoId = tinfoId;
	}
	public String getSearchClass() {
		return searchClass;
	}
	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
	}
	public String getSearchPartnerStart() {
		return searchPartnerStart;
	}
	public void setSearchPartnerStart(String searchPartnerStart) {
		this.searchPartnerStart = searchPartnerStart;
	}
	public String getSearchPartnerEnd() {
		return searchPartnerEnd;
	}
	public void setSearchPartnerEnd(String searchPartnerEnd) {
		this.searchPartnerEnd = searchPartnerEnd;
	}
	public int getJoinerCnt() {
		return joinerCnt;
	}
	public void setJoinerCnt(int joinerCnt) {
		this.joinerCnt = joinerCnt;
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
	public String[] getSeqList() {
		return seqList;
	}
	public void setSeqList(String[] seqList) {
		this.seqList = seqList;
	}
	public int getFirst() {
		return first;
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
	
	@Override
	public String toString() {
		return "PartnerVO [partnerId=" + partnerId + ", partnerTitle=" + partnerTitle + ", partnerContent="
				+ partnerContent + ", PartnerHit=" + PartnerHit + ", PartnerDate=" + PartnerDate + ", partnerPay="
				+ partnerPay + ", partnerClass=" + partnerClass + ", partnerPers=" + partnerPers + ", partnerStart="
				+ partnerStart + ", partnerEnd=" + partnerEnd + ", partnerCondition=" + partnerCondition + ", userId="
				+ userId + ", tinfoId=" + tinfoId + "]";
	}
	
	
}
