package com.yrtrip.app.travel;

import java.util.List;


public interface TravelBoardService {

	public void insertTravelBoard(TravelBoardVO vo);
	public void updateTravelBoard(TravelBoardVO vo);
	public void updateTravelBoardTwo(TravelBoardVO vo);
	public void deleteTravelBoard(TravelBoardVO vo);
	public void deleteTravelBoardList(TravelBoardVO vo);
	public TravelBoardVO getTravelBoard(TravelBoardVO vo);
	public int getCount(TravelBoardVO vo);
	public List<TravelBoardVO> getTravelBoardList(TravelBoardVO vo);
	public List<TravelPlaceVO> getTravelPlaceList(TravelPlaceVO vo);
	public List<TravelBoardVO> getTravelInfoList(TravelInfoVO vo);
	public List<TravelBoardVO> getTravelInfoListModal(TravelInfoVO vo);
	
}
