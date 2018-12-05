package com.yrtrip.app.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.qna.QnaService;
import com.yrtrip.app.qna.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired QnaDAOMybatis dao;
	
	public void insertQna(QnaVO vo) {
		dao.insertQna(vo);
	}

	public void updateQna(QnaVO vo) {
		dao.updateQna(vo);
	}

	public void deleteQna(QnaVO vo) {
		dao.deleteQna(vo);
	}

	public QnaVO getQna(QnaVO vo) {
		return dao.getQna(vo);
	}

	public List<QnaVO> getQnaList(QnaVO vo) {
		return dao.getQnaList(vo);
	}

}
