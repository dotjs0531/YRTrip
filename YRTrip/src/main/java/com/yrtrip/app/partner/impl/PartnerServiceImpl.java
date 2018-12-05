package com.yrtrip.app.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.partner.PartnerBoardService;
import com.yrtrip.app.partner.PartnerVO;

@Service
public class PartnerServiceImpl implements PartnerBoardService {

	@Autowired PartnerBoardDAOMybatis dao;
	
	@Override
	public void insertPartnerBoard(PartnerVO vo) {
		dao.insertPartnerBoard(vo);
	}

	@Override
	public void updatePartnerBoard(PartnerVO vo) {
		dao.updatePartnerBoard(vo);
	}

	@Override
	public void deletePartnerBoard(PartnerVO vo) {
		dao.deletePartnerBoard(vo);
	}

	@Override
	public void deletePartnerBoardList(PartnerVO vo) {
		dao.deletePartnerBoardList(vo);
	}

	@Override
	public PartnerVO getPartnerBoard(PartnerVO vo) {
		return dao.getPartnerBoard(vo);
	}

	@Override
	public List<PartnerVO> getPartnerBoardList(PartnerVO vo) {
		return dao.getPartnerBoardList(vo);
	}

}
