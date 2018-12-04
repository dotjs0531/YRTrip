package com.yrtrip.app.notice;

public class NoticeDTO {
	private int nid; //글번호
	private String ntitle; //글제목
	private String ncontent;  //글내용
	private int nhit; //조회수
	private String ndate;  //작성일
	private String uid;  //작성자
	
	public NoticeDTO() { }
	public NoticeDTO(int nid, String ntitle, String ncontent, int nhit, String ndate, String uid) {
		super();
		this.nid = nid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nhit = nhit;
		this.ndate = ndate;
		this.uid = uid;
	}
	
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public int getNhit() {
		return nhit;
	}
	public void setNhit(int nhit) {
		this.nhit = nhit;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
}
