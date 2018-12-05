package com.yrtrip.app.travel.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.travel.TravelBoardService;
import com.yrtrip.app.travel.TravelBoardVO;

@Controller
public class TravelBoardController {

	@Autowired
	TravelBoardService travelBoardService;

	@RequestMapping(value = { "/getTravelBoardList", "/getListTravelBoard", "/getTravelBoards" }, method = RequestMethod.GET)
	public String getTravelBoardList(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoardList", travelBoardService.getTravelBoardList(vo));
		return "travel/getTravelBoardList";
	}

//단건조회
	@RequestMapping("/getTravelBoard")
	public String getTravelBoard(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/getTravelBoard";
	}

//등록폼
	@RequestMapping(value = { "/insertTravelBoardform" }, method = RequestMethod.GET)
	public String insertTravelBoardform() {
		return "travel/insertTravelBoard";
	}

//등록처리
	@RequestMapping(value = { "/insertTravelBoard" }, method = RequestMethod.POST)
	public String insertTravelBoard(TravelBoardVO vo) { // 커맨드 객체
		travelBoardService.insertTravelBoard(vo); // 등록처리
		return "redirect:getTravelBoardList"; // 목록요청
	}

//수정폼
	@RequestMapping("/updateTravelBoardform")
	public String updateTravelBoardform(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/updateTravelBoard";
	}

//수정처리
	@RequestMapping("updateTravelBoard")
	public String updateTravelBoard(TravelBoardVO vo) {
		travelBoardService.updateTravelBoard(vo); // 수정처리
		return "redirect:getTravelBoardList"; // 목록요청
	}

//삭제처리
	@RequestMapping("deleteTravelBoard")
	public String deleteTravelBoard(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoard(vo); // 삭제처리
		return "redirect:getTravelBoardList"; // 목록요청
	}

//선택삭제처리
	@RequestMapping("deleteTravelBoardList")
	public String deleteTravelBoardList(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoardList(vo); // 삭제처리
		return "redirect:getTravelBoardList"; // 목록요청
	}

}
