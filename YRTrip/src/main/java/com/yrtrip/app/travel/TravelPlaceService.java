package com.yrtrip.app.travel;

import java.util.List;

public interface TravelPlaceService {

	public void insertTravelPlace(TravelPlaceVO vo);
	public void updateTravelPlace(TravelPlaceVO vo);
	public void deleteTravelPlace(TravelPlaceVO vo);
	public void deleteTravelPlaceList(TravelPlaceVO vo);
	public TravelPlaceVO getTravelPlace(TravelPlaceVO vo);
	public int getCount(TravelPlaceVO vo);
	public List<TravelPlaceVO> getTravelPlaceList(TravelPlaceVO vo);
	
	
}
