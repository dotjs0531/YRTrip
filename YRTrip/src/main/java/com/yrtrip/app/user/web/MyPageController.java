package com.yrtrip.app.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.UserVO;


@Controller
public class MyPageController {

	@Autowired MyPageService mypageService;
	
	@RequestMapping("/getMyTravelList")
	public String getMyTravelList(Model model, TravelBoardVO vo) {
		model.addAttribute("MyTravelList", mypageService.getMyTravelList(vo));
		return "mypage/getMyTravelList";
	}
	@RequestMapping("/getMyPartnerList")
	public String getMyPartnerList(Model model, PartnerVO pvo, JoinerVO jvo) {
		model.addAttribute("MyPartnerList", mypageService.getMyPartnerList(pvo));
		//model.addAttribute("MyJoinerList", mypageService.getMyJoinerList(jvo));
		return "mypage/getMyPartnerList";
	}
	
	@RequestMapping("/getMyLikedList")
	public String getMyLikedList(Model model, UserVO vo) {
		model.addAttribute("MyLikedList", mypageService.getMyLikedList(vo));
		return "mypage/getMyLikedList";
	}
	@RequestMapping("/getMyULikeList")
	public String getMyULikeList(Model model, UserVO vo) {
		model.addAttribute("MyULikeList", mypageService.getMyULikeList(vo));
		return "mypage/getMyULikeList";
	}
	
	@RequestMapping("/getMyProductList")
	public String getMyProductList(Model model, ProductVO vo) {
		model.addAttribute("MyProductList", mypageService.getMyProductList(vo));
		return "mypage/getMyProductList";
	}
	@RequestMapping("/getMyOrderList")
	public String getMyOrderList(Model model, UserVO vo) {
		model.addAttribute("MyOrderList", mypageService.getMyOrderList(vo));
		return "mypage/getMyOrderList";
	}
	@RequestMapping("/getMyReviewList")
	public String getMyReviewList(Model model, UserVO vo) {
		model.addAttribute("MyReviewList", mypageService.getMyReviewList(vo));
		return "mypage/getMyReviewList";
	}
}
