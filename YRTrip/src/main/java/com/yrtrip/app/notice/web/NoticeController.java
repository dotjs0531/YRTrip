package com.yrtrip.app.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yrtrip.app.notice.NoticeService;
import com.yrtrip.app.notice.NoticeVO;
/*
@Controller*/
public class NoticeController {
/*
	@Autowired NoticeService noticeService;
	
	//전체 조회
	@RequestMapping("")
	public String getNoticeList(Model model, NoticeVO vo) {
		model.addAttribute("", noticeService.getNoticeList(vo));
		return "";
	}
	//단건 조회
	@RequestMapping("")
	public String getNotice(Model model, NoticeVO vo) {
		model.addAttribute("", noticeService.getNotice(vo));
		return "";
	}
	
	//등록폼
	@RequestMapping("")
	public String insertNoticeForm() {
		return "";
	}
	//등록처리
	@RequestMapping("")
	public String insertNotice(NoticeVO vo) {
		noticeService.insertNotice(vo);
		return "";
	}
	
	//수정폼
	@RequestMapping("")
	public String updateNoticeForm(Model model, NoticeVO vo) {
		model.addAttribute("", noticeService.getNotice(vo));
		return "";
	}
	//수정처리
	@RequestMapping("")
	public String updateNotice(NoticeVO vo) {
		noticeService.updateNotice(vo);
		return "";
	}
	
	//삭제처리
	@RequestMapping("")
	public String deleteNotice(NoticeVO vo) {
		noticeService.deleteNotice(vo);
		return "";
	}
	*/
}
