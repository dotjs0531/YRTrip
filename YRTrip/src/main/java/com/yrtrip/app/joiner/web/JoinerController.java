package com.yrtrip.app.joiner.web;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping("insertJoiner")
	public JoinerVO insertJoiner(JoinerVO vo) { // 커맨드 객체
		joinerService.insertJoiner(vo); // 등록 처리
		return joinerService.getJoiner(vo); // 목록요청
	}

	// 삭제처리
	@RequestMapping("deleteJoiner")
	@ResponseBody
	public JoinerVO deleteJoiner(JoinerVO vo) {
		joinerService.deleteJoiner(vo); // 삭제처리
		return vo;
	}

	// 동행 신청자 리스트 전체조회
	@RequestMapping(value = { "/getJoinerList" }, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
	public String getjoinerList(Model model, JoinerVO vo) {
		model.addAttribute("joinerList", joinerService.getJoinerList(vo));
		return "joiner/getjoinerList";
	}
	
	@RequestMapping(value = { "/ajax/getJoinerList" }, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
	public String getajaxjoinerList(Model model, JoinerVO vo, HttpServletRequest request) {
		
		System.out.println("listin");
		
		List<JoinerVO> li =  joinerService.getJoinerList(vo);
		
	
		for(JoinerVO v : li) {
			System.out.println(v.getJoinercondition());
		}
		
		vo.setPartnerid(request.getParameter("partnerid"));
		
		model.addAttribute("joinerList", joinerService.getJoinerList(vo));
		
		
		return "ajax/partner/testpage";
	}

}
