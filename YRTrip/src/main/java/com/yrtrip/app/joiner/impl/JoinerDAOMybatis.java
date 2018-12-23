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

   // 신청
   public void insertJoiner(JoinerVO vo) {
      mybatis.insert("joiner.insertJoiner", vo);
   }

   // 신청 취소
   public void deleteJoiner(JoinerVO vo) {
      mybatis.delete("joiner.deleteJoiner", vo.getJoinerId());
   }

   // 전체조회
   public List<JoinerVO> getJoinerList(JoinerVO vo) {
      return mybatis.selectList("joiner.getJoinerList", vo);
   }

   public JoinerVO getJoiner(JoinerVO vo) {
      return mybatis.selectOne("joiner.getJoiner", vo);
   }

   public int getJoinerId(int prtId) {
	      return mybatis.selectOne("joiner.getJoinerId");
	   }
   
   
   
   
}