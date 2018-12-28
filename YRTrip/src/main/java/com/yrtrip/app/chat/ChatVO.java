package com.yrtrip.app.chat;

import org.springframework.stereotype.Repository;

@Repository
public class ChatVO {

	private String chatId;
	private String fromId;
	private String toId;
	private String chatContent;
	private String chatTime;
	
	public String getChatId() {
		return chatId;
	}
	public void setChatId(String chatId) {
		this.chatId = chatId;
	}
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	
	@Override
	public String toString() {
		return "ChatVO [chatId=" + chatId + ", fromId=" + fromId + ", toId=" + toId + ", chatContent=" + chatContent
				+ ", chatTime=" + chatTime + "]";
	}
	
	
	
}
