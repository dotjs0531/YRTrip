package com.yrtrip.app.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.notice.NoticeService;
import com.yrtrip.app.notice.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeDAOMybatis dao;
	
	public void insertNotice(NoticeVO vo) {
		dao.insertNotice(vo);
	}

	public void updateNotice(NoticeVO vo) {
		dao.updateNotice(vo);
	}

	public void deleteNotice(NoticeVO vo) {
		dao.deleteNotice(vo);
	}

	public NoticeVO getNotice(NoticeVO vo) {
		return dao.getNotice(vo);
	}

	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return dao.getNoticeList(vo);
	}
}
