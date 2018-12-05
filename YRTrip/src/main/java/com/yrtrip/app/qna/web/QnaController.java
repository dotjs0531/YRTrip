package com.yrtrip.app.qna.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.qna.QnaService;
import com.yrtrip.app.qna.QnaVO;

@Controller
public class QnaController {
	
	@Autowired QnaService qnaService;
	
	//전체 조회
	@RequestMapping("/getQnaList")
	public String getQnaList(Model model, QnaVO vo) {
		model.addAttribute("qnaList", qnaService.getQnaList(vo));
		return "qna/getQnaList";
	}
	//단건 조회
	@RequestMapping("/getQna")
	public String getQna(Model model, QnaVO vo) {
		model.addAttribute("qna", qnaService.getQna(vo));
		return "qna/getQna";
	}
	
	//등록폼
	@RequestMapping(value = "/insertQna", method = RequestMethod.GET)
	public String insertQnaForm() {
		return "qna/insertQna";
	}
	//등록처리
	@RequestMapping(value = "/insertQna", method = RequestMethod.POST)
	public String insertQna(QnaVO vo) {
		qnaService.insertQna(vo);
		return "redirect:getQnaList";
	}
	
	//수정폼
	@RequestMapping("/updateQnaForm")
	public String updateQnaForm(Model model, QnaVO vo) {
		model.addAttribute("qna", qnaService.getQna(vo));
		return "qna/updateQna";
	}
	//수정처리
	@RequestMapping("updateQna")
	public String updateQna(QnaVO vo) {
		qnaService.updateQna(vo);
		return "redirect:getQnaList";
	}
	
	//삭제처리
	@RequestMapping("/deleteQna")
	public String deleteQna(QnaVO vo) {
		qnaService.deleteQna(vo);
		return "redirect:getQnaList";
	}
	

}
