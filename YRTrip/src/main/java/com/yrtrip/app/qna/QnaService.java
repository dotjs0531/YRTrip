package com.yrtrip.app.qna;

import java.util.List;

public interface QnaService {
	public void insertQna(QnaVO vo);
	public void updateQna(QnaVO vo);
	public void deleteQna(QnaVO vo);
	public QnaVO getQna(QnaVO vo);
	public List<QnaVO> getQnaList(QnaVO vo);
}
