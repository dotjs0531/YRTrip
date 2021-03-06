package com.yrtrip.app.travel.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.notice.NoticeVO;
import com.yrtrip.app.travel.TravelBoardService;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelInfoVO;
import com.yrtrip.app.travel.TravelPlaceVO;

@Service("travelBoardService")
public class TravelBoardServiceImpl implements TravelBoardService {

	@Autowired TravelBoardDAOMybatis dao;
	
	@Override
	public void insertTravelBoard(TravelBoardVO vo) {
		dao.insertTravelBoard(vo);
	}
	
	@Override
	public void updateTravelBoard(TravelBoardVO vo) {
		dao.updateTravelBoard(vo);
	}
	
	@Override
	public void updateTravelBoardTwo(TravelBoardVO vo) {
		dao.updateTravelBoardTwo(vo);
	}

	@Override
	public void deleteTravelBoard(TravelBoardVO vo) {
		dao.deleteTravelBoard(vo);
	}

	@Override
	public void deleteTravelBoardList(TravelBoardVO vo) {
		dao.deleteTravelBoardList(vo);
	}
	
	@Override
	public TravelBoardVO getTravelBoard(TravelBoardVO vo) {
		return dao.getTravelBoard(vo);
	}
	
	@Override
	public int getCount(TravelBoardVO vo) {
		return dao.getCount(vo);
	}
	@Override
	public int getCountB(TravelBoardVO vo) {
		return dao.getCountB(vo);
	}

	@Override
	public List<TravelBoardVO> getTravelBoardList(TravelBoardVO vo) {
		return dao.getTravelBoardList(vo);
	}
	
	@Override
	public List<TravelBoardVO> getBestTravelList(TravelBoardVO vo) {
		return dao.getBestTravelList(vo);
	}
	
	@Override
	public List<TravelPlaceVO> getTravelPlaceList(TravelPlaceVO vo) {
		return dao.getTravelPlaceList(vo);
	}
	
	@Override
	public List<TravelBoardVO> getTravelInfoList(TravelInfoVO vo) {
		return dao.getTravelInfoList(vo);
	}
	
	@Override
	public List<TravelBoardVO> getTravelInfoListModal(TravelInfoVO vo){
		return dao.getTravelInfoListModal(vo);
	}
	
	@Override
	public void updateViewCnt(TravelBoardVO vo) {
		dao.updateViewCnt(vo);
	}
}
