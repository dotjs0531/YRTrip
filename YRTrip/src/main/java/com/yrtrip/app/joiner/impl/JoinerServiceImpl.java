package com.yrtrip.app.joiner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.joiner.JoinerService;
import com.yrtrip.app.joiner.JoinerVO;

@Service("joinerService")
public class JoinerServiceImpl implements JoinerService {

   @Autowired JoinerDAOMybatis dao;
   
   public void insertJoiner(JoinerVO vo) {
      dao.insertJoiner(vo);
   }
   public void deleteJoiner(JoinerVO vo) {
      dao.deleteJoiner(vo);
   }
   
   public List<JoinerVO> getJoinerList(JoinerVO vo) {
      return dao.getJoinerList(vo);
   }
   public JoinerVO getJoiner(JoinerVO vo) {
      return dao.getJoiner(vo);
   }
   
   public void acceptJoiner(JoinerVO vo) {
	   dao.acceptJoiner(vo);
   }
   public void cancleJoiner(JoinerVO vo) {
	   dao.cancleJoiner(vo);
   }
   
}