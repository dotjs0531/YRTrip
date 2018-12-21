package com.yrtrip.app.user.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView getMyTravelList(TravelBoardVO vo, Paging paging, HttpSession session) {
		vo.setUserId(((UserVO)session.getAttribute("login")).getUserId());
		
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
	public String deleteMyTravelList(TravelBoardVO vo) {
		mypageService.deleteMyTravelList(vo);
		return "redirect:getMyTravelList";
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
	public ModelAndView getMyProductList(ProductVO vo, Paging paging, HttpSession session) {
		vo.setSellerId(((UserVO)session.getAttribute("login")).getUserId());
		
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
	@RequestMapping("/deleteMyProductList") //상품 선택 삭제
	public String deleteMyProductList(ProductVO vo) {
		mypageService.deleteMyProductList(vo);
		return "redirect:getMyProductList";
	}
	@RequestMapping("getMyBuyerList")
	@ResponseBody
	public List<OrderVO> getMyBuyerList(OrderVO vo) {	//구매자 목록보기
		return mypageService.getMyBuyerList(vo);
	}

	//거래내역 페이지
	@RequestMapping(value = "/getMyOrderList", method = RequestMethod.GET)
	public ModelAndView getMyOrderList(OrderVO vo, Paging paging, HttpSession session) {
		vo.setBuyerId(((UserVO)session.getAttribute("login")).getUserId());
		
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
	@RequestMapping("getMyOrder")
	@ResponseBody
	public OrderVO getMyOrder(OrderVO vo) {	//거래내역 상세보기
		return mypageService.getMyOrder(vo);
	}
	@RequestMapping("/deleteMyOrderList") //거래내역 선택 삭제
	public String deleteMyOrderList(OrderVO vo) {
		mypageService.deleteMyOrderList(vo);
		return "redirect:getMyOrderList";
	}
	
	//리뷰 페이지
	@RequestMapping(value = "/getMyReviewList", method = RequestMethod.GET)
	public ModelAndView getMyReviewList(OrderVO vo, Paging paging, HttpSession session) {
		vo.setBuyerId(((UserVO)session.getAttribute("login")).getUserId());
		
		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(mypageService.getMyReviewCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("MyReviewList", mypageService.getMyReviewList(vo));
		mv.addObject("MyOrderList", mypageService.getMyOrderList(vo));
		mv.setViewName("mypage/getMyReviewList");
		return mv;
	}
	@RequestMapping("insertMyReview") //리뷰 등록
	public String insertMyReview(Model model, OrderVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		model.addAttribute("MyOrder", mypageService.getMyOrder(vo));
		
		String path = request.getSession().getServletContext().getRealPath("/images/review");

		MultipartFile reviewPicFile = vo.getReviewPicFile();
		if (!reviewPicFile.isEmpty() && reviewPicFile.getSize() > 0) {
			String filename = reviewPicFile.getOriginalFilename();
			reviewPicFile.transferTo(new File(path, filename));

			vo.setReviewPic(filename);
		}
		mypageService.insertMyReview(vo);
		return "redirect:getMyReviewList";
	}
	@RequestMapping("/getMyReview") //리뷰 조회
	@ResponseBody
	public OrderVO getMyReview(OrderVO vo) {
		return mypageService.getMyReview(vo);
	}
	@RequestMapping("updateMyReview") //리뷰 수정
	public String updateMyReview(Model model, OrderVO vo) {
		mypageService.updateMyReview(vo);
		model.addAttribute("MyReview", mypageService.getMyReview(vo));
		return "redirect:getMyReviewList";
	}
	@RequestMapping("/deleteMyReview") //리뷰 삭제
	public String deleteMyReview(OrderVO vo) {
		mypageService.deleteMyReview(vo);
		return "redirect:getMyReviewList";
	}
}