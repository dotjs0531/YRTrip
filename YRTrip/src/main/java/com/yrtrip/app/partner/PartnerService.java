package com.yrtrip.app.partner;

import java.util.List;

public interface PartnerService {

	public void insertPartner(PartnerVO vo);
	public void updatePartner(PartnerVO vo);
	public void deletePartner(PartnerVO vo);
	public void deletePartnerList(PartnerVO vo);
	public PartnerVO getPartner(PartnerVO vo);
	public List<PartnerVO> getPartnerList(PartnerVO vo);
}
