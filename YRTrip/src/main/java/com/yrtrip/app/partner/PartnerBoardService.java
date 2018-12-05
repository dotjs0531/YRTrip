package com.yrtrip.app.partner;

import java.util.List;

public interface PartnerBoardService {

	public void insertPartnerBoard(PartnerVO vo);
	public void updatePartnerBoard(PartnerVO vo);
	public void deletePartnerBoard(PartnerVO vo);
	public void deletePartnerBoardList(PartnerVO vo);
	public PartnerVO getPartnerBoard(PartnerVO vo);
	public List<PartnerVO> getPartnerBoardList(PartnerVO vo);
}
