package com.yrtrip.app.partner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.partner.PartnerBoardVO;

@Repository
public class PartnerBoardDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//등록
	public void insertPartnerBoard(PartnerBoardVO vo) {
		System.out.println("mybatis 동행게시판 등록 기능 처리");
		mybatis.update("partnerBoard.insertPartnerBoard", vo);	
	}
	
	//수정
	public void updatePartnerBoard(PartnerBoardVO vo) {
		System.out.println("mybatis 동행게시판 수정 기능 처리");
		mybatis.update("partnerBoard.updatePartnerBoard", vo);	
	}
	
	//삭제
	public void deletePartnerBoard(PartnerBoardVO vo) {
		System.out.println("mybatis 동행게시판 삭제 기능 처리");
		mybatis.update("partnerBoard.deletePartnerBoard", vo.getPartnerno());	
	}
	
	//선택삭제
	public void deletePartnerBoardList(PartnerBoardVO vo) {
		System.out.println("mybatis 동행게시판 선택삭제 기능 처리");
		mybatis.update("partnerBoard.deletePartnerBoardList", vo);
	}
	
	//전체조회
	public List<PartnerBoardVO> getPartnerBoardList(PartnerBoardVO vo) {
		System.out.println("mybatis 동행게시판 전체조회 기능 처리");
		return mybatis.selectList("partnerBoard.getPartnerBoardList", vo);
	}
	//단건조회
	public PartnerBoardVO getPartnerBoard(PartnerBoardVO vo) {
		System.out.println("mybatis 동행게시판 단건조회 기능 처리");
		return mybatis.selectOne("partnerBoard.getTravelBoard", vo);
	}
}