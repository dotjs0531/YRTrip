package com.yrtrip.app.qna.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.qna.QnaService;
import com.yrtrip.app.qna.QnaVO;

@Controller
public class QnaController {
	
	@Autowired QnaService qnaService;
	
	//전체 조회
	@RequestMapping(value = "/getQnaList", method = RequestMethod.GET)
	public ModelAndView getQnaList(QnaVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		paging.setPageUnit(10);
		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체 건수
		paging.setTotalRecord(qnaService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("qnaList", qnaService.getQnaList(vo));
		mv.setViewName("qna/getQnaList");
		return mv;
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
