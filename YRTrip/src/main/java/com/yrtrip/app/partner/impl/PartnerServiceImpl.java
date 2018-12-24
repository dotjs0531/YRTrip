package com.yrtrip.app.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.partner.PartnerService;
import com.yrtrip.app.partner.PartnerVO;

@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired PartnerBoardDAOMybatis dao;
	
	@Override
	public void insertPartner(PartnerVO vo) {
		dao.insertPartner(vo);
	}

	@Override
	public void updatePartner(PartnerVO vo) {
		dao.updatePartner(vo);
	}

	@Override
	public void deletePartner(PartnerVO vo) {
		dao.deletePartner(vo);
	}
	@Override
	public void closePartner(PartnerVO vo) {
		dao.closePartner(vo);
	}

	@Override
	public void deletePartnerList(PartnerVO vo) {
		dao.deletePartnerList(vo);
	}

	@Override
	public PartnerVO getPartner(PartnerVO vo) {
		return dao.getPartner(vo);
	}

	@Override
	public List<PartnerVO> getPartnerList(PartnerVO vo) {
		return dao.getPartnerList(vo);
	}

	@Override
	public int getCount(PartnerVO vo) {
		return dao.getCount(vo);
	}
}
