package com.yrtrip.app.partner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.partner.PartnerVO;

@Repository
public class PartnerBoardDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//등록
	public void insertPartner(PartnerVO vo) {
		System.out.println("mybatis 동행게시판 등록 기능 처리");
		mybatis.update("partner.insertPartner", vo);	
	}
	
	//수정
	public void updatePartner(PartnerVO vo) {
		System.out.println("mybatis 동행게시판 수정 기능 처리");
		mybatis.update("partner.updatePartner", vo);	
	}
	
	//삭제
	public void deletePartner(PartnerVO vo) {
		System.out.println("mybatis 동행게시판 삭제 기능 처리");
		mybatis.update("partner.deletePartner", vo.getPartnerid());	
	}
	
	//선택삭제
	public void deletePartnerList(PartnerVO vo) {
		System.out.println("mybatis 동행게시판 선택삭제 기능 처리");
		mybatis.update("partner.deletePartnerList", vo);
	}
	
	//전체조회
	public List<PartnerVO> getPartnerList(PartnerVO vo) {
		System.out.println("mybatis 동행게시판 전체조회 기능 처리");
		return mybatis.selectList("partner.getPartnerList", vo);
	}
	//단건조회
	public PartnerVO getPartner(PartnerVO vo) {
		System.out.println("mybatis 동행게시판 단건조회 기능 처리");
		return mybatis.selectOne("partner.getPartner", vo);
	}
}
