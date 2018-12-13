package com.yrtrip.app.chat.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.chat.ChatVO;

@Repository
public class ChatDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//전체조회
	public List<ChatVO> getChatList(ChatVO vo) {
		System.out.println("mybatis 채팅리스트 전체조회 기능 처리");
		return mybatis.selectList("chat.getChatList", vo);
	}
}

