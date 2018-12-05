package com.yrtrip.app.partner;

import java.util.List;

public interface PartnerBoardService {

	public void insertPartnerBoard(PartnerBoardVO vo);
	public void updatePartnerBoard(PartnerBoardVO vo);
	public void deletePartnerBoard(PartnerBoardVO vo);
	public void deletePartnerBoardList(PartnerBoardVO vo);
	public PartnerBoardVO getPartnerBoard(PartnerBoardVO vo);
	public List<PartnerBoardVO> getPartnerBoardList(PartnerBoardVO vo);
}
