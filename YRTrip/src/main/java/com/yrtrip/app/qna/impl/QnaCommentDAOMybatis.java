package com.yrtrip.app.qna.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.qna.QnaCommentVO;

@Repository
public class QnaCommentDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertQnaComment(QnaCommentVO vo) {
		sqlSession.insert("qnaComment.insertQnaComment", vo);
	}
	
	public void updateQnaComment(QnaCommentVO vo) {
		sqlSession.update("qnaComment.updateQnaComment", vo);
	}
	
	public void deleteQnaComment(QnaCommentVO vo) {
		sqlSession.delete("qnaComment.deleteQnaComment", vo);
	}

	public List<QnaCommentVO> getQnaCommentList(QnaCommentVO vo) {
		return sqlSession.selectList("qnaComment.getQnaCommentList", vo);
	}
	
	public QnaCommentVO getQnaComment(QnaCommentVO vo) {
		return sqlSession.selectOne("qnaComment.getQnaComment", vo);
	}
	
}
