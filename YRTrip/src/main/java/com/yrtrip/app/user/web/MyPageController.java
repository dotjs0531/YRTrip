package com.yrtrip.app.user.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.like.LikeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelPlaceVO;
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
	public ModelAndView getMyPartnerList(PartnerVO pvo, JoinerVO jvo, Paging paging, HttpSession session) {
		pvo.setUserId(((UserVO)session.getAttribute("login")).getUserId());

		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(5);
		
		pvo.setFirst(paging.getFirst());
		pvo.setLast(paging.getLast());

		paging.setTotalRecord(mypageService.getMyPartnerCount(pvo));

		mv.addObject("paging", paging);
		mv.addObject("MyPartnerList", mypageService.getMyPartnerList(pvo));
		mv.addObject("MyJoinerList", mypageService.getMyJoinerList(jvo));
		mv.setViewName("mypage/getMyPartnerList");
		return mv;
	}
	@RequestMapping("/cancleMyJoinerList") //동행자 수락취소
	public String cancleMyJoinerList(JoinerVO vo) {
		mypageService.cancleMyJoinerList(vo);
		return "redirect:getMyPartnerList";
	}
	
	//좋아요 페이지
	@RequestMapping(value = "/getMyLikedTravelList", method = RequestMethod.GET) //여행정보 좋아요
	public ModelAndView getMyLikedTravelList(TravelBoardVO vo, Paging paging, HttpSession session) {
		vo.setUserId(((UserVO)session.getAttribute("login")).getUserId());

		ModelAndView mv = new ModelAndView();

		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setLikeCategory("T");

		paging.setTotalRecord(mypageService.getMyLikedCount(vo));
		
		mv.addObject("paging", paging);
		mv.addObject("MyLikedTravelList", mypageService.getMyLikedTravelList(vo));
		mv.setViewName("mypage/getMyLikedTravelList");
		return mv;
	}
	@RequestMapping(value = "/getMyLikedPlaceList", method = RequestMethod.GET) //여행지 좋아요
	public ModelAndView getMyLikedPlaceList(TravelPlaceVO vo, Paging paging, HttpSession session) {
		vo.setUserId(((UserVO)session.getAttribute("login")).getUserId());

		ModelAndView mv = new ModelAndView();
		
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setLikeCategory("P");

		paging.setTotalRecord(mypageService.getMyLikedCount(vo));
		
		mv.addObject("paging", paging);
		mv.addObject("MyLikedPlaceList", mypageService.getMyLikedPlaceList(vo));
		mv.setViewName("mypage/getMyLikedPlaceList");
		return mv;
	}
	@RequestMapping(value = "/getMyLikedProductList", method = RequestMethod.GET) //상품 좋아요
	public ModelAndView getMyLikedProductList(ProductVO vo, Paging paging, HttpSession session) {
		vo.setUserId(((UserVO)session.getAttribute("login")).getUserId());

		ModelAndView mv = new ModelAndView();
		
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(4);
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setLikeCategory("I");

		paging.setTotalRecord(mypageService.getMyLikedCount(vo));
		
		mv.addObject("paging", paging);
		mv.addObject("MyLikedProductList", mypageService.getMyLikedProductList(vo));
		mv.setViewName("mypage/getMyLikedProductList");
		return mv;
	}
	
	//상품 페이지
	@RequestMapping(value = "/getMyProductList", method = RequestMethod.GET)
	public ModelAndView getMyProductList(ProductVO vo, /*OrderVO ovo,*/ Paging paging, HttpSession session) {
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
		//mv.addObject("MyBuyerList", mypageService.getMyBuyerList(ovo));
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
	@RequestMapping("getMyBuyer")
	@ResponseBody
	public OrderVO getMyBuyer(OrderVO vo) {	//구매자 목록보기
		return mypageService.getMyBuyer(vo);
	}
	@RequestMapping("/updateDno") //구매자 송장번호 등록
	public String updateDno(OrderVO vo) {
		mypageService.updateDno(vo);
		return "redirect:getMyProductList";
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
	@RequestMapping("/updateOrderCondition") //거래내역 상태 변경(구매확정시 배송완료+거래완료)
	public String updateOrderCondition(OrderVO vo) {
		mypageService.updateOrderCondition(vo);
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
		mv.setViewName("mypage/getMyReviewList");
		return mv;
	}
	@RequestMapping("insertMyReview") //리뷰 등록
	public String insertMyReview(Model model, OrderVO vo, MultipartHttpServletRequest request, MultipartFile[] reviewPicFile) throws IllegalStateException, IOException {
		model.addAttribute("MyOrder", mypageService.getMyOrder(vo));
		
		String path = request.getSession().getServletContext().getRealPath("/images/review");
		String fileOriginName = "";
		String fileMultiName = "";
		
		for(int i=0;i<reviewPicFile.length; i++) {
			fileOriginName = reviewPicFile[i].getOriginalFilename();
			System.out.println("기존 파일명 : " + fileOriginName);
			SimpleDateFormat formatter = new SimpleDateFormat("YYMMDD_"+i);
			Calendar now = Calendar.getInstance();
			
			String extension = fileOriginName.split("\\.")[1];
			
			fileOriginName = formatter.format(now.getTime())+"."+extension;
			System.out.println("변경된 파일명 : "+fileOriginName);
			
			File f = new File(path+"\\"+fileOriginName);
			reviewPicFile[i].transferTo(f);
			if(i==0) {fileMultiName += fileOriginName;}
			else {fileMultiName += "," +fileOriginName;}
		}
		
		vo.setReviewPic(fileMultiName);
		
		mypageService.insertMyReview(vo);
		mypageService.updateProductStar(vo); //상품 평점 업데이트
		mypageService.updateOrderCondition(vo); //구매확정 완료
		return "redirect:getMyReviewList";
	}
	@RequestMapping("getMyReview") //리뷰 조회
	@ResponseBody
	public OrderVO getMyReview(OrderVO vo) {
		return mypageService.getMyReview(vo);
	}
	@RequestMapping("updateMyReview") //리뷰 수정
	public String updateMyReview(Model model, OrderVO vo, MultipartHttpServletRequest request, MultipartFile[] reviewPicFile) throws IllegalStateException, IOException {
		model.addAttribute("MyReview", mypageService.getMyReview(vo));

		String path = request.getSession().getServletContext().getRealPath("/images/review");
		String fileOriginName = "";
		String fileMultiName = "";
		
		for(int i=0;i<reviewPicFile.length; i++) {
			fileOriginName = reviewPicFile[i].getOriginalFilename();
			System.out.println("기존 파일명 : " + fileOriginName);
			SimpleDateFormat formatter = new SimpleDateFormat("YYMMDD_"+i);
			Calendar now = Calendar.getInstance();
			
			String extension = fileOriginName.split("\\.")[1];
			
			fileOriginName = formatter.format(now.getTime())+"."+extension;
			System.out.println("변경된 파일명 : "+fileOriginName);
			
			File f = new File(path+"\\"+fileOriginName);
			reviewPicFile[i].transferTo(f);
			if(i==0) {fileMultiName += fileOriginName;}
			else {fileMultiName += "," +fileOriginName;}
		}
		
		vo.setReviewPic(fileMultiName);

		mypageService.updateMyReview(vo);
		mypageService.updateProductStar(vo); //상품 평점 업데이트
		return "redirect:getMyReviewList";
	}
	@RequestMapping("/deleteMyReview") //리뷰 삭제
	public String deleteMyReview(OrderVO vo) {
		mypageService.deleteMyReview(vo);
		mypageService.updateProductStar(vo); //상품 평점 업데이트
		return "redirect:getMyReviewList";
	}
}