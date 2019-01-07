package com.yrtrip.app.joiner.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.joiner.JoinerVO;

@Repository
public class JoinerDAOMybatis {

   @Autowired
   private SqlSessionTemplate mybatis;

   //동행 신청(신청자)
   public void insertJoiner(JoinerVO vo) {
      mybatis.insert("joiner.insertJoiner", vo);
   }
   // 동행 신청 취소(신청자)
   public void deleteJoiner(JoinerVO vo) {
      mybatis.delete("joiner.deleteJoiner", vo.getJoinerId());
   }
   
   // 전체조회
   public List<JoinerVO> getJoinerList(JoinerVO vo) {
      return mybatis.selectList("joiner.getJoinerList", vo);
   }
   // 단건조회
   public JoinerVO getJoiner(JoinerVO vo) {
      return mybatis.selectOne("joiner.getJoiner", vo);
   }
   
   // 수락하기(작성자)
   public void acceptJoiner(JoinerVO vo) {
	   mybatis.update("joiner.acceptJoiner", vo);
   }
   // 수락취소(작성자)
   public void cancleJoiner(JoinerVO vo) {
	   mybatis.update("joiner.cancleJoiner", vo);
   }
   
	//동행 수락 여부 판단
	public int getJoinerUser(JoinerVO vo) {
		return mybatis.selectOne("joiner.getJoinerUser", vo);
	}
}