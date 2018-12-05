package com.yrtrip.app.partner.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.partner.PartnerBoardService;
import com.yrtrip.app.partner.PartnerVO;

@Controller
public class PartnerController {

	@Autowired
	PartnerBoardService partnerBoardService;

	// 전체조회
	@RequestMapping(value = { "/getPartnerList"}, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
	public String getPartnerBoardList(Model model, PartnerVO vo) {
		model.addAttribute("partnerboardList", partnerBoardService.getPartnerBoardList(vo));
		return "board/getPartnerBoardList";
	}

	// 단건조회
	@RequestMapping("/getPartner") // http://localhost:8081/app/getPartner
	public String getBoard(Model model, PartnerVO vo) {
		model.addAttribute("board", partnerBoardService.getPartnerBoard(vo)); // vo : 조회할 게시글 번호 넘어가는 것
		return "board/getPartnerBoard";
	}

	// 등록폼
	@RequestMapping(value = { "/insertPartnerform" }, method = RequestMethod.GET)
	public String insertPartnerBoardform() {
		return "board/insertBoard";
	}

	// 등록처리
	@RequestMapping(value = { "insertPartner" }, method = RequestMethod.POST)
	public String insertPartnerBoard(PartnerVO vo) { // 커맨드 객체
		partnerBoardService.insertPartnerBoard(vo); // 등록처
		return "redirect:getBoardList"; // 목록요청
	}

	// 수정폼
	@RequestMapping("/updatePartnerform")
	public String updateBoardform(Model model, PartnerVO vo) {
		model.addAttribute("board", partnerBoardService.getPartnerBoard(vo));
		return "board/updatePartnerBoard";
	}

	// 수정처리
	@RequestMapping("updatePartner")
	public String updateBoard(PartnerVO vo) {
		partnerBoardService.updatePartnerBoard(vo); // 수정처리
		return "redirect:getBoardList"; // 목록요청
	}

	// 삭제처리
	@RequestMapping("deletePartner")
	public String deleteBoard(PartnerVO vo) {
		partnerBoardService.deletePartnerBoard(vo); // 삭제처리
		return "redirect:getBoardList"; // 목록요청
	}

	// 선택삭제처리
	@RequestMapping("deletePartnerList")
	public String deleteBoardList(PartnerVO vo) {
		partnerBoardService.deletePartnerBoardList(vo); // 삭제처리
		return "redirect:getBoardList"; // 목록요청
	}
}
