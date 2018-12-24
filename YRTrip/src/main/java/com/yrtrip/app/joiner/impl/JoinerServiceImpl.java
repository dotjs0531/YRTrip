package com.yrtrip.app.joiner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.joiner.JoinerService;
import com.yrtrip.app.joiner.JoinerVO;

@Service("joinerService")
public class JoinerServiceImpl implements JoinerService {

   @Autowired JoinerDAOMybatis dao;
   
   @Override
   public void insertJoiner(JoinerVO vo) {
      dao.insertJoiner(vo);
   }

   @Override
   public void deleteJoiner(JoinerVO vo) {
      dao.deleteJoiner(vo);
   }
   
   @Override
   public void updateJoiner(JoinerVO vo) {
	   dao.updateJoiner(vo);
   }
   
   @Override
   public List<JoinerVO> getJoinerList(JoinerVO vo) {
      return dao.getJoinerList(vo);
   }
   @Override
   public JoinerVO getJoiner(JoinerVO vo) {
      return dao.getJoiner(vo);
   }   
   
}