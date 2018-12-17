package com.yrtrip.app.travel.web;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.travel.TravelInfoService;
import com.yrtrip.app.travel.TravelInfoVO;

@Controller
public class TravelInfoController {

/*	@Autowired
	TravelInfoService travelInfoService;
	
	// list 조회 Ajax
	@RequestMapping(value="/getTravelInfoListData", method=RequestMethod.GET)
	@ResponseBody
	public List<TravelInfoVO> getTravelInfoListData(TravelInfoVO vo) {
		return travelInfoService.getTravelInfoList(vo);
	}

	@RequestMapping(value="/getTravelInfoList", method=RequestMethod.GET)
	public String getTravelInfoList(TravelInfoVO vo) {
		//return travelInfoService.getTravelInfoList(vo);
		return "travel/getTravelBoardList";
	}
*/
}
	
