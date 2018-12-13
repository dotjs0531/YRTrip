package com.yrtrip.app.chat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.chat.ChatService;
import com.yrtrip.app.chat.ChatVO;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired ChatDAOMybatis dao;
	
	public List<ChatVO> getChatList(ChatVO vo){
		return dao.getChatList(vo);
	}
}
