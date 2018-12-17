package com.yrtrip.app.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.MyPageVO;


@Controller
public class MyPageController {

	@Autowired MyPageService mypageService;
	
	@RequestMapping("/getMyTravelList")
	public String getMyTravelList(Model model, MyPageVO vo) {
		model.addAttribute("MyTravelList", mypageService.getMyTravelList(vo));
		return "mypage/getMyTravelList";
	}
}
