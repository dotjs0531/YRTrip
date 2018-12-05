package com.yrtrip.app.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.notice.NoticeService;
import com.yrtrip.app.notice.NoticeVO;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;

	//전체 조회
	@RequestMapping("/getNoticeList")
	public String getNoticeList(Model model, NoticeVO vo) {
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "notice/getNoticeList";
	}
	//단건 조회
	@RequestMapping("/getNotice")
	public String getNotice(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "notice/getNotice";
	}
	
	//등록폼
	@RequestMapping(value = "/insertNotice", method = RequestMethod.GET)
	public String insertNoticeForm() {
		return "notice/insertNotice";
	}
	//등록처리
	@RequestMapping(value = "/insertNotice", method = RequestMethod.POST)
	public String insertNotice(NoticeVO vo) {
		noticeService.insertNotice(vo);
		return "redirect:getNoticeList";
	}
	
	//수정폼
	@RequestMapping("/updateNoticeForm")
	public String updateNoticeForm(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "notice/updateNotice";
	}
	//수정처리
	@RequestMapping("updateNotice")
	public String updateNotice(NoticeVO vo) {
		noticeService.updateNotice(vo);
		return "redirect:getNoticeList";
	}
	
	//삭제처리
	@RequestMapping("/deleteNotice")
	public String deleteNotice(NoticeVO vo) {
		noticeService.deleteNotice(vo);
		return "redirect:getNoticeList";
	}
	
}
