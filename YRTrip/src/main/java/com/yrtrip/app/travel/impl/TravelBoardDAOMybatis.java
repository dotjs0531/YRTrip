package com.yrtrip.app.travel.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.travel.TravelBoardVO;

@Repository
public class TravelBoardDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//등록
	public void insertTravelBoard(TravelBoardVO vo) {
		System.out.println("mybatis insertTravelBoard() 기능 처리");
		mybatis.update("travelBoard.insertTravelBoard", vo);	
	}
	
	//수정
	public void updateTravelBoard(TravelBoardVO vo) {
		System.out.println("mybatis updateTravelBoard() 기능 처리");
		mybatis.update("travelBoard.updateTravelBoard", vo);	
	}
	
	//삭제
	public void deleteTravelBoard(TravelBoardVO vo) {
		System.out.println("mybatis deleteTravelBoard() 기능 처리");
		mybatis.update("travelBoard.deleteTravelBoard", vo.getTravelNo());	
	}
	
	//선택삭제
	public void deleteTravelBoardList(TravelBoardVO vo) {
		System.out.println("mybatis deleteTravelBoardList() 기능 처리");
		mybatis.update("travelBoard.deleteTravelBoardList", vo);
	}
	
	//전체조회
	public List<TravelBoardVO> getTravelBoardList(TravelBoardVO vo) {
		System.out.println("mybatis getTravelBoardList() 기능 처리");
		return mybatis.selectList("travelBoard.getTravelBoardList", vo);
	}
	//단건조회
	public TravelBoardVO getTravelBoard(TravelBoardVO vo) {
		System.out.println("mybatis getTravelBoard() 기능 처리");
		return mybatis.selectOne("travelBoard.getTravelBoard", vo);
	}
}
