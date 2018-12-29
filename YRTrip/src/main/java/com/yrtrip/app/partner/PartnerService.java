package com.yrtrip.app.partner;

import java.util.List;

import com.yrtrip.app.joiner.JoinerVO;

public interface PartnerService {

	public void insertPartner(PartnerVO vo);
	public void updatePartner(PartnerVO vo);
	public void deletePartner(PartnerVO vo);
	public void deletePartnerList(PartnerVO vo);
	public PartnerVO getPartner(PartnerVO vo);
	public List<PartnerVO> getPartnerList(PartnerVO vo);
	
	public int getCount(PartnerVO vo);
	public void closePartner(PartnerVO vo);
	public void updateViewCnt(PartnerVO vo);
	
	public int getJoinerCount(JoinerVO vo);
}
