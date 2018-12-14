package com.yrtrip.app.joiner.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.joiner.JoinerService;
import com.yrtrip.app.joiner.JoinerVO;

@Controller
public class JoinerController {

	@Autowired
	JoinerService joinerService;
	
	// 신청 처리
	@RequestMapping("insertJoiner")
	public JoinerVO insertJoiner(JoinerVO vo) { // 커맨드 객체
		joinerService.insertJoiner(vo); // 등록 처리
		return joinerService.getJoiner(vo); // 목록요청
	}

	// 삭제처리
	@RequestMapping("deleteJoiner")
	@ResponseBody
	public JoinerVO deleteJoiner(JoinerVO vo) {
		joinerService.deleteJoiner(vo);	// 삭제처리
		return vo;
	}
	
	// 신청 리스트 출력
	@RequestMapping("getJoinerList")
	@ResponseBody
	public List<JoinerVO> getJoinerList(JoinerVO vo){
		vo.setPageUnit(10);
		return joinerService.getJoinerList(vo);
	}
	
}
