package com.yrtrip.app.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;
import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.UserVO;
import com.yrtrip.app.user.YourPageService;

@Controller
public class YourPageController {

	@Autowired YourPageService yourpageService;
	@Autowired MyPageService mypageService;
	
	//여행정보 페이지
	@RequestMapping(value = "/getYourTravelList", method = RequestMethod.GET)
	public ModelAndView getYourTravelList(TravelBoardVO vo, UserVO uvo, Paging paging) {
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(9);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(yourpageService.getYourTravelCount(vo));

		yourpageService.updateUserStar(uvo); //상품 평점 업데이트
		
		mv.addObject("paging", paging);
		mv.addObject("user", yourpageService.getYourInfo(uvo));
		mv.addObject("YourTravelList", yourpageService.getYourTravelList(vo));
		mv.setViewName("yourpage/getYourTravelList");
		return mv;
	}
	
	//동행 페이지
	@RequestMapping(value = "/getYourPartnerList", method = RequestMethod.GET)
	public ModelAndView getYourPartnerList(PartnerVO vo, JoinerVO jvo, UserVO uvo, Paging paging) {
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(5);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(yourpageService.getYourPartnerCount(vo));

		yourpageService.updateUserStar(uvo); //상품 평점 업데이트

		mv.addObject("paging", paging);
		mv.addObject("user", yourpageService.getYourInfo(uvo));
		mv.addObject("YourJoinerCnt", yourpageService.getYourJoinerCnt(jvo));
		mv.addObject("YourPartnerList", yourpageService.getYourPartnerList(vo));
		mv.setViewName("yourpage/getYourPartnerList");
		return mv;
	}
	
	//좋아요 페이지
	@RequestMapping(value = "/getYourLikedTravelList", method = RequestMethod.GET) //여행정보 좋아요
	public ModelAndView getYourLikedTravelList(TravelBoardVO vo, UserVO uvo, Paging paging) {
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(9);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setLikeCategory("T");

		paging.setTotalRecord(yourpageService.getYourLikedCount(vo));

		yourpageService.updateUserStar(uvo); //상품 평점 업데이트
		
		mv.addObject("paging", paging);
		mv.addObject("user", yourpageService.getYourInfo(uvo));
		mv.addObject("YourLikedTravelList", yourpageService.getYourLikedTravelList(vo));
		mv.setViewName("yourpage/getYourLikedTravelList");
		return mv;
	}
	@RequestMapping(value = "/getYourLikedPlaceList", method = RequestMethod.GET) //여행지 좋아요
	public ModelAndView getYourLikedPlaceList(TravelPlaceVO vo, UserVO uvo, Paging paging) {
		ModelAndView mv = new ModelAndView();
		
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(9);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setLikeCategory("P");

		paging.setTotalRecord(yourpageService.getYourLikedCount(vo));

		yourpageService.updateUserStar(uvo); //상품 평점 업데이트
		
		mv.addObject("paging", paging);
		mv.addObject("user", yourpageService.getYourInfo(uvo));
		mv.addObject("YourLikedPlaceList", yourpageService.getYourLikedPlaceList(vo));
		mv.setViewName("yourpage/getYourLikedPlaceList");
		return mv;
	}
	@RequestMapping(value = "/getYourLikedProductList", method = RequestMethod.GET) //상품 좋아요
	public ModelAndView getYourLikedProductList(ProductVO vo, UserVO uvo, Paging paging) {
		ModelAndView mv = new ModelAndView();
		
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setLikeCategory("I");

		paging.setTotalRecord(yourpageService.getYourLikedCount(vo));

		yourpageService.updateUserStar(uvo); //상품 평점 업데이트
		
		mv.addObject("paging", paging);
		mv.addObject("user", yourpageService.getYourInfo(uvo));
		mv.addObject("YourLikedProductList", yourpageService.getYourLikedProductList(vo));
		mv.setViewName("yourpage/getYourLikedProductList");
		return mv;
	}
	
	//상품 페이지
	@RequestMapping(value = "/getYourProductList", method = RequestMethod.GET)
	public ModelAndView getYourProductList(ProductVO vo, OrderVO ovo, UserVO uvo, Paging paging) {
		uvo.setUserId(vo.getSellerId());
		ovo.setItemId(vo.getItemId());
		
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(yourpageService.getYourProductCount(vo));

		yourpageService.updateUserStar(uvo); //상품 평점 업데이트

		mv.addObject("paging", paging);
		mv.addObject("user", yourpageService.getYourInfo(uvo));
		mv.addObject("YourReviewCnt", yourpageService.getYourProductReviewCnt(ovo));
		mv.addObject("YourProductList", yourpageService.getYourProductList(vo));
		mv.setViewName("yourpage/getYourProductList");
		return mv;
	}

	//리뷰 페이지
	@RequestMapping(value = "/getYourReviewList", method = RequestMethod.GET)
	public ModelAndView getYourReviewList(OrderVO vo, UserVO uvo, Paging paging) {
		uvo.setUserId(vo.getSellerId());
		
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(yourpageService.getYourReviewCount(vo));

		yourpageService.updateUserStar(uvo); //상품 평점 업데이트

		mv.addObject("paging", paging);
		mv.addObject("user", yourpageService.getYourInfo(uvo));
		mv.addObject("YourReviewList", yourpageService.getYourReviewList(vo));
		mv.setViewName("yourpage/getYourReviewList");
		return mv;
	}
}
