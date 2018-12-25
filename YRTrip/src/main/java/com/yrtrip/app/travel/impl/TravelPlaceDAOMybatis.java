package com.yrtrip.app.travel.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.travel.TravelPlaceVO;

@Repository
public class TravelPlaceDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//등록
	public void insertTravelPlace(TravelPlaceVO vo) {
		System.out.println("insertTravelPlace() 기능 처리");
		sqlSession.update("travelPlace.insertTravelPlace", vo);	
	}
	
	//수정
	public void updateTravelPlace(TravelPlaceVO vo) {
		System.out.println("updateTravelPlace() 기능 처리");
		sqlSession.update("travelPlace.updateTravelPlace", vo);	
	}
	
	//삭제
	public void deleteTravelPlace(TravelPlaceVO vo) {
		System.out.println("deleteTravelPlace() 기능 처리");
		sqlSession.update("travelPlace.deleteTravelPlace", vo.getPlaceNo());	
	}
	
	//선택삭제
	public void deleteTravelPlaceList(TravelPlaceVO vo) {
		System.out.println("deleteTravelPlaceList() 기능 처리");
		sqlSession.update("travelPlace.deleteTravelPlaceList", vo);
	}
	
	//전체조회
	public List<TravelPlaceVO> getTravelPlaceList(TravelPlaceVO vo) {
		System.out.println("getTravelPlaceList() 기능 처리");
		return sqlSession.selectList("travelPlace.getTravelPlaceList", vo);
	}
	
	//리스트선택조회
	public List<TravelPlaceVO> selectTravelPlaceList(TravelPlaceVO vo) {
		System.out.println("selectTravelPlaceList() 기능 처리");
		return sqlSession.selectList("travelPlace.selectTravelPlaceList", vo);
	}
	
	//건수조회
	public int getCount(TravelPlaceVO vo) {
		return sqlSession.selectOne("travelPlace.getCount", vo);
	}
	
	//단건조회
	public TravelPlaceVO getTravelPlace(TravelPlaceVO vo) {
		System.out.println("getTravelPlace() 기능 처리");
		return sqlSession.selectOne("travelPlace.getTravelPlace", vo);
	}
}
