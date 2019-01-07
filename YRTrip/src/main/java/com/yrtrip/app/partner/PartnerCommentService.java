package com.yrtrip.app.partner;

import java.util.List;

public interface PartnerCommentService {
	public void insertPartnerComment(PartnerCommentVO vo);
	public void deletePartnerComment(PartnerCommentVO vo);
	public List<PartnerCommentVO> getPartnerCommentList(PartnerCommentVO vo);
	public PartnerCommentVO getPartnerComment(PartnerCommentVO vo);
}
