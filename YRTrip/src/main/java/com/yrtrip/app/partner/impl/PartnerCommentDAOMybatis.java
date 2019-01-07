package com.yrtrip.app.partner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.partner.PartnerCommentVO;

@Repository
public class PartnerCommentDAOMybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertPartnerComment(PartnerCommentVO vo) {
		sqlSession.insert("partnerComment.insertPartnerComment", vo);
	}

	public void deletePartnerComment(PartnerCommentVO vo) {
		sqlSession.delete("partnerComment.deletePartnerComment", vo);
	}

	public List<PartnerCommentVO> getPartnerCommentList(PartnerCommentVO vo) {
		return sqlSession.selectList("partnerComment.getPartnerCommentList", vo);
	}

	public PartnerCommentVO getPartnerComment(PartnerCommentVO vo) {
		return sqlSession.selectOne("partnerComment.getPartnerComment", vo);
	}
}
