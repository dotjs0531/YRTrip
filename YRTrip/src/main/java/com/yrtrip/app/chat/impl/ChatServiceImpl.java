package com.yrtrip.app.chat.impl;

import java.util.ArrayList;
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

	@Override
	public ArrayList<ChatVO> getChatListByID(String fromID, String toID, String chatID) {
		return null;
	}

	@Override
	public ArrayList<ChatVO> getChatListByRecent(String fromID, String toID, int number) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int submit(String fromID, String toID, String chatContent) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int readChat(String fromID, String toID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getUnreadChat(String userID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ChatVO> getMessageBox(String userID) {
		// TODO Auto-generated method stub
		return null;
	}
}
