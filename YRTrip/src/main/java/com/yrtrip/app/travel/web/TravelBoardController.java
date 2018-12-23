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

@Controller
public class TravelBoardController {

	@Autowired
	TravelBoardService travelBoardService;
	
//�쟾泥댁“�쉶
	@RequestMapping(value = { "/getTravelBoardList"}, method = RequestMethod.GET)
	public ModelAndView getTravelBoardList(TravelBoardVO vo, Paging paging) {
		
		ModelAndView mv = new ModelAndView();
		//�럹�씠吏� 泥섎━
				//�럹�씠吏�踰덊샇 �뙆�씪誘명꽣
				if( paging.getPage() == null) {
					paging.setPage(1); 
				}
				
				//�븳�럹�씠吏��뿉 異쒕젰�븷 �젅肄붾뱶 嫄댁닔
				paging.setPageUnit(12);
				
				//first, last 怨꾩궛
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				//�쟾泥� �젅肄붾뱶 嫄댁닔
				paging.setTotalRecord(travelBoardService.getCount(vo));
				
				mv.addObject("paging", paging);
				
				mv.addObject("travelBoardList", travelBoardService.getTravelBoardList(vo));
				
				mv.setViewName("travel/getTravelBoardList");
				return mv;
			}

//�떒嫄댁“�쉶
	@RequestMapping("/getTravelBoard")
	public String getTravelBoard(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/getTravelBoard";
	}

//紐⑤떖 �벑濡앹쿂由�
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

//�닔�젙�뤌
	@RequestMapping("/updateTravelBoardform")
	public String updateTravelBoardform(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/updateTravelBoard";
	}

//�닔�젙泥섎━
	@RequestMapping("updateTravelBoard")
	public String updateTravelBoard(TravelBoardVO vo) {
		travelBoardService.updateTravelBoard(vo); // �닔�젙泥섎━
		return "redirect:getTravelBoardList"; // 紐⑸줉�슂泥�
	}

//�닔�젙�뤌
		@RequestMapping("/updateTravelBoardTwoform")
		public String updateTravelBoardTwoform(Model model, TravelBoardVO vo) {
			model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
			return "travel/updateTravelBoardTwo";
		}

//�닔�젙泥섎━
		@RequestMapping("updateTravelBoardTwo")
		public String updateTravelBoardTwo(TravelBoardVO vo) {
			travelBoardService.updateTravelBoardTwo(vo); // �닔�젙泥섎━
			return "redirect:getTravelBoardList"; // 紐⑸줉�슂泥�
		}

//�궘�젣泥섎━
	@RequestMapping("deleteTravelBoard")
	public String deleteTravelBoard(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoard(vo); // �궘�젣泥섎━
		return "redirect:getTravelBoardList"; // 紐⑸줉�슂泥�
	}

//�꽑�깮�궘�젣泥섎━
	@RequestMapping("deleteTravelBoardList")
	public String deleteTravelBoardList(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoardList(vo); // �궘�젣泥섎━
		return "redirect:getTravelBoardList"; // 紐⑸줉�슂泥�
	}
	
// list 議고쉶 Ajax
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
	
// Modal�뿉�꽌 list 議고쉶 Ajax
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
