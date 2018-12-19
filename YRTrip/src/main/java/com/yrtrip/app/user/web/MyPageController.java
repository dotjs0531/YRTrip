package com.yrtrip.app.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.UserVO;


@Controller
public class MyPageController {

	@Autowired MyPageService mypageService;
	
	@RequestMapping(value = "/getMyTravelList", method = RequestMethod.GET)
	public ModelAndView getMyTravelList(TravelBoardVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체 건수
		paging.setTotalRecord(mypageService.getMyTravelCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("MyTravelList", mypageService.getMyTravelList(vo));
		mv.setViewName("mypage/getMyTravelList");
		return mv;
	}
	@RequestMapping("/deleteMyTravelList")
	public String deleteMyTravelList(TravelBoardVO vo) {
		mypageService.deleteMyTravelList(vo);
		mypageService.getMyTravelList(vo);
		return "mypage/getMyTravelList";
	}
	
	@RequestMapping("/getMyPartnerList")
	public String getMyPartnerList(Model model, PartnerVO pvo, JoinerVO jvo) {
		model.addAttribute("MyPartnerList", mypageService.getMyPartnerList(pvo));
		model.addAttribute("MyJoinerList", mypageService.getMyJoinerList(jvo));
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