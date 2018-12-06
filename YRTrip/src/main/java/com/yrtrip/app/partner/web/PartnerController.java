package com.yrtrip.app.partner.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.partner.PartnerService;
import com.yrtrip.app.partner.PartnerVO;

@Controller
public class PartnerController {

	@Autowired
	PartnerService partnerService;

	// 전체조회
	@RequestMapping(value = { "/getPartnerList"}, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
	public String getPartnerList(Model model, PartnerVO vo) {
		model.addAttribute("partnerList", partnerService.getPartnerList(vo));
		return "partner/getPartnerList";
	}
	
	// 단건조회
	@RequestMapping("/getPartner") // http://localhost:8081/app/getPartner
	public String getPartner(Model model, PartnerVO vo) {
		model.addAttribute("partner", partnerService.getPartner(vo)); // vo : 조회할 게시글 번호 넘어가는 것
		return "partner/getPartner";
	}
	
	// 등록폼
	@RequestMapping(value = "/insertPartner", method = RequestMethod.GET)
	public String insertPartnerform() {
		return "partner/insertPartner";
	}

	// 등록처리
	@RequestMapping(value = { "insertPartner" }, method = RequestMethod.POST)
	public String insertPartner(PartnerVO vo) { // 커맨드 객체
		partnerService.insertPartner(vo); // 등록처
		return "redirect:getPartnerList"; // 목록요청
	}

	// 수정폼
	@RequestMapping("/updatePartnerform")
	public String updatePartnerform(Model model, PartnerVO vo) {
		model.addAttribute("partner", partnerService.getPartner(vo));
		return "partner/updatePartnerForm";
	}

	// 수정처리
	@RequestMapping("updatePartner")
	public String updatePartner(PartnerVO vo) {
		partnerService.updatePartner(vo); // 수정처리
		return "redirect:getPartnerList"; // 목록요청
	}

	// 삭제처리
	@RequestMapping("deletePartner")
	public String deletePartner(PartnerVO vo) {
		partnerService.deletePartner(vo); // 삭제처리
		return "redirect:getPartnerList"; // 목록요청
	}

	// 선택삭제처리
	@RequestMapping("deletePartnerList")
	public String deletePartnerList(PartnerVO vo) {
		partnerService.deletePartnerList(vo); // 삭제처리
		return "redirect:getPartnerList"; // 목록요청
	}
}
