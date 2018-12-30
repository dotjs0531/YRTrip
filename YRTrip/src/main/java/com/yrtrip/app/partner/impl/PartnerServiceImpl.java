package com.yrtrip.app.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.joiner.JoinerVO;
import com.yrtrip.app.partner.PartnerService;
import com.yrtrip.app.partner.PartnerVO;

@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired PartnerBoardDAOMybatis dao;
	
	public void insertPartner(PartnerVO vo) {
		dao.insertPartner(vo);
	}
	public void updatePartner(PartnerVO vo) {
		dao.updatePartner(vo);
	}
	public void deletePartner(PartnerVO vo) {
		dao.deletePartner(vo);
	}
	
	public PartnerVO getPartner(PartnerVO vo) {
		return dao.getPartner(vo);
	}
	public List<PartnerVO> getPartnerList(PartnerVO vo) {
		return dao.getPartnerList(vo);
	}

	public int getCount(PartnerVO vo) {
		return dao.getCount(vo);
	}
	public void closePartner(PartnerVO vo) {
		dao.closePartner(vo);
	}
	public void updateViewCnt(PartnerVO vo) {
		dao.updateViewCnt(vo);
	}
}
