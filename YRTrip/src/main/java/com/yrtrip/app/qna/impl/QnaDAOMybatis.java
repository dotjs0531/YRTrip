package com.yrtrip.app.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.qna.QnaVO;

@Repository
public class QnaDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	//등록
	public void insertQna(QnaVO vo) {
		mybatis.update("qna.insertQna", vo);
	}
	
	//수정
	public void updateQna(QnaVO vo) {
		mybatis.update("qna.updateQna", vo);
	}
	
	//삭제
	public void deleteQna(QnaVO vo) {
		mybatis.update("qna.deleteQna", vo.getQnaId());
	}
	
	//단건조회
	public QnaVO getQna(QnaVO vo) {
		return mybatis.selectOne("qna.getQna", vo);
	}
	
	//전체조회
	public List<QnaVO> getQnaList(QnaVO vo) {
		return mybatis.selectList("qna.getQnaList", vo);
	}
	//건수 조회
	public int getCount(QnaVO vo) {
		return mybatis.selectOne("qna.getCount", vo);
	}

}
