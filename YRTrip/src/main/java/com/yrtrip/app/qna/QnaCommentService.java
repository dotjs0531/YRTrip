package com.yrtrip.app.qna;

import java.util.List;

public interface QnaCommentService {
	public void insertQnaComment(QnaCommentVO vo);
	public void updateQnaComment(QnaCommentVO vo);
	public void deleteQnaComment(QnaCommentVO vo);
	public List<QnaCommentVO> getQnaCommentList(QnaCommentVO vo);
	public QnaCommentVO getComment(QnaCommentVO vo);
}
