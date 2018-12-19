package com.yrtrip.app.user.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.UserVO;


@Controller
public class MyPageController {

	@Autowired MyPageService mypageService;
	
	//여행정보 페이지
	@RequestMapping(value = "/getMyTravelList", method = RequestMethod.GET)
	public ModelAndView getMyTravelList(TravelBoardVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(mypageService.getMyTravelCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("MyTravelList", mypageService.getMyTravelList(vo));
		mv.setViewName("mypage/getMyTravelList");
		return mv;
	}
	@RequestMapping("/deleteMyTravelList") //여행정보 선택 삭제
	public String deleteMyTravelList(Model model, HttpSession session, TravelBoardVO vo) {
		mypageService.deleteMyTravelList(vo);
		model.addAttribute("myTravelList", mypageService.getMyTravelList(vo));
		return "mypage/getMyTravelList";
	}
	
	//동행 페이지
	@RequestMapping("/getMyPartnerList")
	public String getMyPartnerList(Model model, PartnerVO pvo, JoinerVO jvo) {
		model.addAttribute("MyPartnerList", mypageService.getMyPartnerList(pvo));
		model.addAttribute("MyJoinerList", mypageService.getMyJoinerList(jvo));
		return "mypage/getMyPartnerList";
	}
	
	//좋아요 페이지
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
	
	//상품 페이지
	@RequestMapping(value = "/getMyProductList", method = RequestMethod.GET)
	public ModelAndView getMyProductList(ProductVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(mypageService.getMyProductCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("MyProductList", mypageService.getMyProductList(vo));
		mv.setViewName("mypage/getMyProductList");
		return mv;
	}

	//거래내역 페이지
	@RequestMapping(value = "/getMyOrderList", method = RequestMethod.GET)
	public ModelAndView getMyOrderList(OrderVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(mypageService.getMyOrderCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("MyOrderList", mypageService.getMyOrderList(vo));
		mv.setViewName("mypage/getMyOrderList");
		return mv;
	}
	
	//리뷰 페이지
	@RequestMapping("/getMyReviewList")
	public String getMyReviewList(Model model, UserVO vo) {
		model.addAttribute("MyReviewList", mypageService.getMyReviewList(vo));
		return "mypage/getMyReviewList";
	}
}