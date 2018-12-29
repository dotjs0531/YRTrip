package com.yrtrip.app.partner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.partner.PartnerVO;

@Repository
public class PartnerBoardDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//등록
	public void insertPartner(PartnerVO vo) {
		mybatis.update("partner.insertPartner", vo);	
	}
	
	//수정
	public void updatePartner(PartnerVO vo) {
		mybatis.update("partner.updatePartner", vo);	
	}
	
	//마감 처리
		public void closePartner(PartnerVO vo) {
		mybatis.update("partner.closePartner", vo);
	}
		
	//삭제
	public void deletePartner(PartnerVO vo) {
		mybatis.update("partner.deletePartner", vo.getPartnerId());	
	}
	
	//선택삭제
	public void deletePartnerList(PartnerVO vo) {
		mybatis.update("partner.deletePartnerList", vo);
	}
	
	//전체조회
	public List<PartnerVO> getPartnerList(PartnerVO vo) {
		return mybatis.selectList("partner.getPartnerList", vo);
	}
	//단건조회
	public PartnerVO getPartner(PartnerVO vo) {
		return mybatis.selectOne("partner.getPartner", vo);
	}
	// 페이징 처리 건수 조회
	public int getCount(PartnerVO vo) {
		return mybatis.selectOne("partner.getCount", vo);
	}
	public void updateViewCnt(PartnerVO vo) {
		mybatis.update("partner.updateViewCnt", vo);
	}
	
	//동행신청자 수
	public int getJoinerCount(JoinerVO vo) {
		return mybatis.selectOne("partner.getJoinerCount", vo);
	}
}
