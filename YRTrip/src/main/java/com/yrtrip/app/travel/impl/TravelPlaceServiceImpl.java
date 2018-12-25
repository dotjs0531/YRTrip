package com.yrtrip.app.travel.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.travel.TravelPlaceService;
import com.yrtrip.app.travel.TravelPlaceVO;


@Service
public class TravelPlaceServiceImpl implements TravelPlaceService {

	@Autowired TravelPlaceDAOMybatis dao;
	
	@Override
	public void insertTravelPlace(TravelPlaceVO vo) {
		dao.insertTravelPlace(vo);
	}

	@Override
	public void updateTravelPlace(TravelPlaceVO vo) {
		dao.updateTravelPlace(vo);
	}

	@Override
	public void deleteTravelPlace(TravelPlaceVO vo) {
		dao.deleteTravelPlace(vo);
	}

	@Override
	public void deleteTravelPlaceList(TravelPlaceVO vo) {
		dao.deleteTravelPlaceList(vo);
	}
	
	@Override
	public TravelPlaceVO getTravelPlace(TravelPlaceVO vo) {
		return dao.getTravelPlace(vo);
	}
	
	@Override
	public int getCount(TravelPlaceVO vo) {
		return dao.getCount(vo);
	}
	
	@Override
	public List<TravelPlaceVO> getTravelPlaceList(TravelPlaceVO vo) {
		return dao.getTravelPlaceList(vo);
	}
	
	@Override
	public List<TravelPlaceVO> selectTravelPlaceList(TravelPlaceVO vo) {
		return dao.selectTravelPlaceList(vo);
	}
	
}
