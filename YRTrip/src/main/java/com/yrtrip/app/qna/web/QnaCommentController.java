package com.yrtrip.app.qna.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.qna.QnaCommentService;
import com.yrtrip.app.qna.QnaCommentVO;

@Controller
public class QnaCommentController {
	
	@Autowired
	QnaCommentService qnaCommentService;
	
	//답변 등록
	@RequestMapping("insertQnaComment")
	@ResponseBody
	public QnaCommentVO insertQnaComment(QnaCommentVO vo) {
		qnaCommentService.insertQnaComment(vo);
		qnaCommentService.updateQnaAnswer(vo);	//답변 완료
		return qnaCommentService.getComment(vo);
	}
	//답변 수정
	@RequestMapping("updateQnaComment")
	@ResponseBody
	public QnaCommentVO updateQnaComment(QnaCommentVO vo) {
		qnaCommentService.updateQnaComment(vo);
		return vo;
	}
	//답변 삭제
	@RequestMapping("deleteQnaComment")
	@ResponseBody
	public QnaCommentVO deleteQnaComment(QnaCommentVO vo) {
		qnaCommentService.deleteQnaComment(vo);
		System.out.println(vo);
		qnaCommentService.updateQnaAnswer(vo);	//답변 미완료
		System.out.println(vo);
		return vo;
	}

	//답변 목록
	@RequestMapping("getQnaCommentList")
	@ResponseBody
	public List<QnaCommentVO> getQnaCommentList(QnaCommentVO vo) {
		return qnaCommentService.getQnaCommentList(vo);
	}

}
