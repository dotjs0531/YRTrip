package com.yrtrip.app.travel.web;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.travel.TravelInfoService;
import com.yrtrip.app.travel.TravelInfoVO;

@Controller
public class TravelInfoController {

	@Autowired
	TravelInfoService travelInfoService;
	
	// list 조회 Ajax
	@RequestMapping(value="/getTravelInfoList", method=RequestMethod.GET)
	@ResponseBody
	public List<TravelInfoVO> getTravelInfoList(Model model,TravelInfoVO vo) {
		return travelInfoService.getTravelInfoList(vo);
	}
}
	
