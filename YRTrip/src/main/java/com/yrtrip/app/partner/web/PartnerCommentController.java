package com.yrtrip.app.partner.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.partner.PartnerCommentService;
import com.yrtrip.app.partner.PartnerCommentVO;

@Controller
public class PartnerCommentController {
	
	@Autowired
	PartnerCommentService partnerCommentService;
	
	//댓글 등록
	@RequestMapping("insertPartnerComment")
	@ResponseBody
	public PartnerCommentVO insertPartnerComment(PartnerCommentVO vo) {
		partnerCommentService.insertPartnerComment(vo);
		return partnerCommentService.getPartnerComment(vo);
	}
	//댓글 삭제
	@RequestMapping("deletePartnerComment")
	@ResponseBody
	public PartnerCommentVO deletePartnerComment(PartnerCommentVO vo) {
		partnerCommentService.deletePartnerComment(vo);
		return vo;
	}

	//댓글 목록
	@RequestMapping("getPartnerCommentList")
	@ResponseBody
	public List<PartnerCommentVO> getPartnerCommentList(PartnerCommentVO vo) {
		return partnerCommentService.getPartnerCommentList(vo);
	}
}
