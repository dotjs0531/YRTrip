package com.yrtrip.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.tiles.jsp.taglib.AddAttributeTag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.joiner.JoinerService;
import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.travel.TravelBoardService;
import com.yrtrip.app.travel.TravelBoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired ProductService productService; //user정보에서 상품 많이 올린순, 최근에 올린 상품, 최신리뷰순
	@Autowired JoinerService joinerService;								//동행게시판 최신글 순
	@Autowired TravelBoardService travelBoardService;								//베스트 여행정보후기 순
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/main")
	public String mainForm(Model model, ProductVO pvo, JoinerVO jvo, TravelBoardVO tbvo) {
		//최신 상품 목록
		pvo.setFirst(1);
		pvo.setLast(3);
		//특정 동행자 ...?
		jvo.setJoinerId(3);
		//최신 여행기 목록
		tbvo.setFirst(1);
		tbvo.setLast(5);
		//정보 뿌리기
		model.addAttribute("productList", productService.getProductList(pvo));
		model.addAttribute("joinerlist", joinerService.getJoinerList(jvo));
		model.addAttribute("bestTravelList", travelBoardService.getBestTravelList(tbvo));
		return "main";
	}
	
}
