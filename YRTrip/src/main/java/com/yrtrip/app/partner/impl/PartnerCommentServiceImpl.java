package com.yrtrip.app.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.partner.PartnerCommentService;
import com.yrtrip.app.partner.PartnerCommentVO;

@Service("PartnerCommentService")
public class PartnerCommentServiceImpl implements PartnerCommentService {
	
	@Autowired
	PartnerCommentDAOMybatis dao;

	public void insertPartnerComment(PartnerCommentVO vo) {
		dao.insertPartnerComment(vo);
	}

	public void deletePartnerComment(PartnerCommentVO vo) {
		dao.deletePartnerComment(vo);
	}

	public List<PartnerCommentVO> getPartnerCommentList(PartnerCommentVO vo) {
		return dao.getPartnerCommentList(vo);
	}

	public PartnerCommentVO getPartnerComment(PartnerCommentVO vo) {
		return dao.getPartnerComment(vo);
	}

}
