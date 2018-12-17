package com.yrtrip.app.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.qna.QnaCommentService;
import com.yrtrip.app.qna.QnaCommentVO;

@Service("QnaCommentService")
public class QnaCommentServiceImpl implements QnaCommentService {

	@Autowired
	QnaCommentDAOMybatis dao;
	
	public void insertQnaComment(QnaCommentVO vo) {
		dao.insertQnaComment(vo);
	}

	public void updateQnaComment(QnaCommentVO vo) {
		dao.updateQnaComment(vo);
	}

	public void deleteQnaComment(QnaCommentVO vo) {
		dao.deleteQnaComment(vo);
	}

	public List<QnaCommentVO> getQnaCommentList(QnaCommentVO vo) {
		return dao.getQnaCommentList(vo);
	}

	public QnaCommentVO getComment(QnaCommentVO vo) {
		return dao.getQnaComment(vo);
	}

	public void updateQnaAnswer(QnaCommentVO vo) {
		dao.updateQnaAnswer(vo);
	}

}
