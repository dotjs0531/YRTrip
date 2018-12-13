package com.yrtrip.app.chat.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.chat.ChatService;
import com.yrtrip.app.chat.ChatVO;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;
	
	// 전체조회
		@RequestMapping(value = { "/getChatList"}, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
		public String getPartnerList(Model model, ChatVO vo) {
			model.addAttribute("chatList", chatService.getChatList(vo));
			return "partner/getPartnerList";
		}
}
