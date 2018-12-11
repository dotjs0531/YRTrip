package com.yrtrip.app.joiner.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.joiner.JoinerService;
import com.yrtrip.app.joiner.JoinerVO;

@Controller
public class JoinerController {

	@Autowired
	JoinerService joinerService;
	
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
	
	@RequestMapping("getJoinerList")
	@ResponseBody
	public List<JoinerVO> getJoinerList(JoinerVO vo){
		vo.setPageUnit(10);
		return joinerService.getJoinerList(vo);
	}
	
}
