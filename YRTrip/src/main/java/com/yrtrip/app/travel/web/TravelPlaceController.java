package com.yrtrip.app.travel.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.travel.TravelPlaceService;
import com.yrtrip.app.travel.TravelPlaceVO;

@Controller
public class TravelPlaceController {

	@Autowired
	TravelPlaceService travelPlaceService;

//전체조회
	@RequestMapping(value = { "/getTravelPlaceList", "/getListTravelPlace", "/getTravelPlaces" }, method = RequestMethod.GET)
	public ModelAndView getTravelPlaceList(TravelPlaceVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();
		
		//페이징 처리
		//페이지번호 파라미터
		if( paging.getPage() == null) {
			paging.setPage(1); 
		}
		
		//한페이지에 출력할 레코드 건수
		paging.setPageUnit(9);
		
		//first, last 계산
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		//전체 레코드 건수
		paging.setTotalRecord(travelPlaceService.getCount(vo));
		
		mv.addObject("paging", paging);
		
		mv.addObject("travelPlaceList", travelPlaceService.getTravelPlaceList(vo));
		mv.setViewName("travel/getTravelPlaceList");
		return mv;
	}

//단건조회
	@RequestMapping("/getTravelPlace")
	public String getTravelPlace(Model model, TravelPlaceVO vo) {
		model.addAttribute("travelPlace", travelPlaceService.getTravelPlace(vo));
		return "travel/getTravelPlace";
	}

//등록폼
	@RequestMapping(value = { "/insertTravelPlaceform" }, method = RequestMethod.GET)
	public String insertTravelPlaceform() {
		return "travel/insertTravelPlace";
	}

//등록처리
	@RequestMapping(value = { "/insertTravelPlace" }, method = RequestMethod.POST)
	public String insertTravelPlace(TravelPlaceVO vo) { // 커맨드 객체
		travelPlaceService.insertTravelPlace(vo); // 등록처리
		return "redirect:getTravelPlaceList"; // 목록요청
	}

//수정폼
	@RequestMapping("/updateTravelPlaceform")
	public String updateTravelPlaceform(Model model, TravelPlaceVO vo) {
		model.addAttribute("travelPlace", travelPlaceService.getTravelPlace(vo));
		return "travel/updateTravelPlace";
	}

//수정처리
	@RequestMapping("updateTravelPlace")
	public String updateTravelPlace(TravelPlaceVO vo) {
		travelPlaceService.updateTravelPlace(vo); // 수정처리
		return "redirect:getTravelPlaceList"; // 목록요청
	}

//삭제처리
	@RequestMapping("deleteTravelPlace")
	public String deleteTravelPlace(TravelPlaceVO vo) {
		travelPlaceService.deleteTravelPlace(vo); // 삭제처리
		return "redirect:getTravelPlaceList"; // 목록요청
	}

//선택삭제처리
	@RequestMapping("deleteTravelPlaceList")
	public String deleteTravelPlaceList(TravelPlaceVO vo) {
		travelPlaceService.deleteTravelPlaceList(vo); // 삭제처리
		return "redirect:getTravelPlaceList"; // 목록요청
	}
	
}
