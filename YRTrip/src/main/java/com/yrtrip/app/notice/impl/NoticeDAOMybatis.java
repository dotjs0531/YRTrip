package com.yrtrip.app.notice.impl;

import java.util.List;

//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.notice.NoticeVO;

@Repository
public class NoticeDAOMybatis {
	
	/*@Autowired
	private SqlSessionTemplate mybatis;*/

	//등록
	public void insertNotice(NoticeVO vo) {
		//mybatis.update("notice.insertNotice", vo);
	}
	
	//수정
	public void updateNotice(NoticeVO vo) {
		//mybatis.update("notice.updateNotice", vo);
	}
	
	//삭제
	public void deleteNotice(NoticeVO vo) {
		//mybatis.update("notice.deleteNotice", vo);
	}
	
	//단건조회
	public NoticeVO getNotice(NoticeVO vo) {
		//return mybatis.update("notice.getNotice", vo);
		return null;
	}
	
	//전체조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		//mybatis.update("notice.getNoticeList", vo);
		return null;
	}
}
