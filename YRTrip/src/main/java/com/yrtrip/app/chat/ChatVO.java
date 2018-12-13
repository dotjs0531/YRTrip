package com.yrtrip.app.chat;

import org.springframework.stereotype.Repository;

@Repository
public class ChatVO {

	private Integer	chatid;
	private String	fromid;
	private String	toid;
	private String chatcontent;
	private String Chattime;
	
	public Integer getChatid() {
		return chatid;
	}
	public void setChatid(Integer chatid) {
		this.chatid = chatid;
	}
	public String getFromid() {
		return fromid;
	}
	public void setFromid(String fromid) {
		this.fromid = fromid;
	}
	public String getToid() {
		return toid;
	}
	public void setToid(String toid) {
		this.toid = toid;
	}
	public String getChatcontent() {
		return chatcontent;
	}
	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}
	public String getChattime() {
		return Chattime;
	}
	public void setChattime(String chattime) {
		Chattime = chattime;
	}
	@Override
	public String toString() {
		return "ChatVO [chatid=" + chatid + ", fromid=" + fromid + ", toid=" + toid + ", chatcontent=" + chatcontent
				+ ", Chattime=" + Chattime + "]";
	}
	
	
}
