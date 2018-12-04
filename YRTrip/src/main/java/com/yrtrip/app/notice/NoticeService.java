package com.yrtrip.app.notice;

import java.util.List;

public interface NoticeService {
	public void insertNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public NoticeVO getNotice(NoticeVO vo);
	public List<NoticeVO> getNoticeList(NoticeVO vo);
}
