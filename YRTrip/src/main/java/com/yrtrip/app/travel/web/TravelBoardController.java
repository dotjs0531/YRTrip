package com.yrtrip.app.travel.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.travel.TravelBoardService;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelInfoVO;
import com.yrtrip.app.travel.TravelPlaceService;
import com.yrtrip.app.travel.TravelPlaceVO;

@Controller
public class TravelBoardController {

	@Autowired
	TravelBoardService travelBoardService;
	TravelPlaceService travelPlaceService;
	
	//전체조회
	@RequestMapping(value = { "/getTravelBoardList"}, method = RequestMethod.GET)
	public ModelAndView getTravelBoardList(TravelBoardVO vo, Paging paging) {
		
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
				// 페이지번호 파라미터
				if( paging.getPage() == null) {
					paging.setPage(1); 
				}

				paging.setPageUnit(12);
				
				// 시작/마지막 레코드 번호
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				// 전체 건수
				paging.setTotalRecord(travelBoardService.getCount(vo));
				
				mv.addObject("paging", paging);
				
				mv.addObject("travelBoardList", travelBoardService.getTravelBoardList(vo));
				
				mv.setViewName("travel/getTravelBoardList");
				return mv;
			}

	//상세조회
	@RequestMapping("/getTravelBoard")
	public String getTravelBoard(Model model, TravelBoardVO vo, TravelPlaceVO pvo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		model.addAttribute("travelPlace", travelBoardService.getTravelPlaceList(pvo));
		return "travel/getTravelBoard";
	}

	//등록처리
	@RequestMapping(value = { "/insertTravelBoardform" }, method = RequestMethod.POST)
	public String insertTravelBoardform(TravelBoardVO vo) {
		travelBoardService.insertTravelBoard(vo);
		return "travel/insertTravelBoard";
	}
	
/*
//紐⑤떖 �벑濡앹쿂由� 
	@RequestMapping(value = { "insertTravelBoard" }, method = RequestMethod.POST)
	public String insertTravelBoard(TravelBoardVO vo) { // 而ㅻ㎤�뱶 媛앹껜		
		travelBoardService.insertTravelBoard(vo); // �벑濡앹쿂由�
		return "redirect:insertTravelBoard"; // insertTravelBoard.jsp濡� �씠�룞
	}*/

//수정폼
	@RequestMapping("/updateTravelBoardform")
	public String updateTravelBoardform(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/updateTravelBoard";
	}

//수정처리
	@RequestMapping("updateTravelBoard")
	public String updateTravelBoard(TravelBoardVO vo) {
		travelBoardService.updateTravelBoard(vo); 
		return "redirect:getTravelBoardList";
	}

//삭제
	@RequestMapping("deleteTravelBoard")
	public String deleteTravelBoard(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoard(vo); // �궘�젣泥섎━
		return "redirect:getTravelBoardList"; // 紐⑸줉�슂泥�
	}

//선택삭제
	@RequestMapping("deleteTravelBoardList")
	public String deleteTravelBoardList(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoardList(vo); // �궘�젣泥섎━
		return "redirect:getTravelBoardList"; // 紐⑸줉�슂泥�
	}
	
// travelinfot list Ajax
	@RequestMapping(value="/getTravelInfoListData", method=RequestMethod.POST)
	@ResponseBody
	public List<TravelBoardVO> getTravelInfoListData(TravelInfoVO vo) {
		System.out.println("--------------------------");
		System.out.println(vo);
		return travelBoardService.getTravelInfoList(vo);
	}

	@RequestMapping(value="/getTravelInfoList", method=RequestMethod.POST)
	public String getTravelInfoList(TravelInfoVO vo) {
		return "travel/getTravelBoardList";
	}
	
// Modal travelinfot list Ajax
	@RequestMapping(value="/getTravelInfoListModalData", method=RequestMethod.POST)
	@ResponseBody
	public List<TravelBoardVO> getTravelInfoListModalData(TravelInfoVO vo) {
		return travelBoardService.getTravelInfoListModal(vo);
	}

	@RequestMapping(value="/getTravelInfoListModal", method=RequestMethod.POST)
	public String getTravelInfoListModal(TravelInfoVO vo) {
		return "travel/getTravelBoardList";
	}

}
