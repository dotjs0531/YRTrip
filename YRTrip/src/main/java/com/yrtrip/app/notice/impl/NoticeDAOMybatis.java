package com.yrtrip.app.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.notice.NoticeVO;

@Repository
public class NoticeDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	//등록
	public void insertNotice(NoticeVO vo) {
		mybatis.update("notice.insertNotice", vo);
	}
	//수정
	public void updateNotice(NoticeVO vo) {
		mybatis.update("notice.updateNotice", vo);
	}
	//삭제
	public void deleteNotice(NoticeVO vo) {
		mybatis.update("notice.deleteNotice", vo.getNoticeId());
	}
	
	//단건조회
	public NoticeVO getNotice(NoticeVO vo) {
		mybatis.update("notice.updateViewCnt", vo);	//조회수 증가
		return mybatis.selectOne("notice.getNotice", vo);
	}
	//전체조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return mybatis.selectList("notice.getNoticeList", vo);
	}
	//건수 조회
	public int getCount(NoticeVO vo) {
		return mybatis.selectOne("notice.getCount", vo);
	}
}
