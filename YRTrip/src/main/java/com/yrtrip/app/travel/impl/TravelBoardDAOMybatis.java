package com.yrtrip.app.travel.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelInfoVO;
import com.yrtrip.app.travel.TravelPlaceVO;

@Repository
public class TravelBoardDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//등록
	public void insertTravelBoard(TravelBoardVO vo) {
		System.out.println("insertTravelBoard() 기능 처리");
		sqlSession.update("travelBoard.insertTravelBoard", vo);	
	}
	
	//수정
	public void updateTravelBoard(TravelBoardVO vo) {
		System.out.println("updateTravelBoard() 기능 처리");
		sqlSession.update("travelBoard.updateTravelBoard", vo);	
	}
	
	//수정2(등록폼에서)
	public void updateTravelBoardTwo(TravelBoardVO vo) {
		System.out.println("updateTravelBoardTwo() 기능 처리");
		sqlSession.update("travelBoard.updateTravelBoardTwo", vo);	
	}
	
	//삭제
	public void deleteTravelBoard(TravelBoardVO vo) {
		System.out.println("deleteTravelBoard() 기능 처리");
		sqlSession.update("travelBoard.deleteTravelBoard", vo.getTravelNo());	
	}
	
	//선택삭제
	public void deleteTravelBoardList(TravelBoardVO vo) {
		System.out.println("deleteTravelBoardList() 기능 처리");
		sqlSession.update("travelBoard.deleteTravelBoardList", vo);
	}
	
	//전체조회
	public List<TravelBoardVO> getTravelBoardList(TravelBoardVO vo) {
		System.out.println("getTravelBoardList() 기능 처리");
		return sqlSession.selectList("travelBoard.getTravelBoardList", vo);
	}
	
	//건수조회
	public int getCount(TravelBoardVO vo) {
		return sqlSession.selectOne("travelBoard.getCount", vo);
	}
	
	//단건조회
	public TravelBoardVO getTravelBoard(TravelBoardVO vo) {
		System.out.println("getTravelBoard() 기능 처리");
		return sqlSession.selectOne("travelBoard.getTravelBoard", vo);
	}
	public List<TravelPlaceVO> getTravelPlaceList(TravelPlaceVO vo) {
		return sqlSession.selectList("travelBoard.getTravelPlaceList", vo);
	}
	
	//검색 조회
	public List<TravelBoardVO> getTravelInfoList(TravelInfoVO vo) {
		return sqlSession.selectList("travelBoard.getTravelInfoList", vo);
	}
	
	//모달 등록시 조회
	public List<TravelBoardVO> getTravelInfoListModal(TravelInfoVO vo) {
		return sqlSession.selectList("travelBoard.getTravelInfoListModal", vo);
	}
}
