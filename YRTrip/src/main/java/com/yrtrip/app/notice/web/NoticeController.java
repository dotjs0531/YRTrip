package com.yrtrip.app.notice.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.notice.NoticeService;
import com.yrtrip.app.notice.NoticeVO;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;

	//전체 조회
	@RequestMapping("/getNoticeList")
	public ModelAndView getNoticeList(NoticeVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체 건수
		paging.setTotalRecord(noticeService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("noticeList", noticeService.getNoticeList(vo));
		mv.setViewName("notice/getNoticeList");
		return mv;
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
	public String insertNotice(NoticeVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/images/notice");

		MultipartFile noticeImgFile = vo.getNoticeImgFile();
		if (!noticeImgFile.isEmpty() && noticeImgFile.getSize() > 0) {
			String filename = noticeImgFile.getOriginalFilename();
			noticeImgFile.transferTo(new File(path, filename));

			vo.setNoticeImg(filename);
		}
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
	public String updateNotice(NoticeVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/images/notice");

		MultipartFile noticeImgFile = vo.getNoticeImgFile();
		if (!noticeImgFile.isEmpty() && noticeImgFile.getSize() > 0) {
			String filename = noticeImgFile.getOriginalFilename();
			noticeImgFile.transferTo(new File(path, filename));

		vo.setNoticeImg(filename);
	}
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
