package com.yrtrip.app.chat;

import java.util.ArrayList;

public interface ChatService {

	public ArrayList<ChatVO> getChatListByID(String fromID, String toID, String chatID);
	public ArrayList<ChatVO> getChatListByRecent(String fromID, String toID, int number);
	public int submit(String fromID, String toID, String chatContent);
	public int readChat(String fromID,String toID);
	public int getUnreadChat(String userID);
	public ArrayList<ChatVO> getMessageBox(String userID);
	
	
	
	
}
