package com.yrtrip.app.joiner.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.joiner.JoinerService;
import com.yrtrip.app.joiner.JoinerVO;

@Controller
public class JoinerController {

	@Autowired
	JoinerService joinerService;

	// 전체조회
		@RequestMapping(value = { "/getJoinerList"}, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
		public String getJoinerList(Model model, JoinerVO vo) {
			model.addAttribute("joinerList", joinerService.getJoinerList(vo));
			return "redirect:getPartnerList";
		}

	// 신청 처리
	@RequestMapping(value = { "/insertJoiner" }, method = RequestMethod.POST)
	public String insertJoiner(JoinerVO vo) { // 커맨드 객체
		joinerService.insertJoiner(vo); // 등록 처리
		return "redirect:getPartnerList"; // 목록요청
	}

	// 삭제처리
	@RequestMapping("deleteJoiner")
	public String deleteJoiner(JoinerVO vo) {
		joinerService.deleteJoiner(vo);	// 삭제처리
		return "redirect:getPartnerList"; // 목록요청
	}
	
	
}
