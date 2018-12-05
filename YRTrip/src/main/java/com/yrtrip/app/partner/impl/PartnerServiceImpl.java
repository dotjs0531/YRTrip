package com.yrtrip.app.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.partner.PartnerBoardService;
import com.yrtrip.app.partner.PartnerBoardVO;

@Service
public class PartnerServiceImpl implements PartnerBoardService {

	@Autowired PartnerBoardDAOMybatis dao;
	
	@Override
	public void insertPartnerBoard(PartnerBoardVO vo) {
		dao.insertPartnerBoard(vo);
	}

	@Override
	public void updatePartnerBoard(PartnerBoardVO vo) {
		dao.updatePartnerBoard(vo);
	}

	@Override
	public void deletePartnerBoard(PartnerBoardVO vo) {
		dao.deletePartnerBoard(vo);
	}

	@Override
	public void deletePartnerBoardList(PartnerBoardVO vo) {
		dao.deletePartnerBoardList(vo);
	}

	@Override
	public PartnerBoardVO getPartnerBoard(PartnerBoardVO vo) {
		return dao.getPartnerBoard(vo);
	}

	@Override
	public List<PartnerBoardVO> getPartnerBoardList(PartnerBoardVO vo) {
		return dao.getPartnerBoardList(vo);
	}

}
