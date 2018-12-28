/*package com.yrtrip.app.chat.web;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yrtrip.app.chat.ChatService;
import com.yrtrip.app.chat.ChatVO;
import com.yrtrip.app.chat.impl.ChatDAO;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;

	// 전체조회
	@RequestMapping("/ChatListServlet")
	protected void ChatList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String fromID = request.getParameter("fromID");
		String toID = request.getParameter("toID");
		String listType = request.getParameter("listType");

		if (fromID == null || fromID.equals("") || toID == null || toID.equals("") || listType == null
				|| listType.equals("")) {
			response.getWriter().write(""); // 값을 입력하지 않았을시 공백문자로 처리
		} else if (listType.equals("ten"))
			response.getWriter().write(getTen(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"))); // 값이
																														// 비어있지않았을때
																														// getTen실행
																														// 결과출력
		else {
			try {
				response.getWriter()
						.write(getID(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"), listType)); // 특정한
																														// 아이디값
																														// 있을시
																														// 리스트
																														// 출력
			} catch (Exception e) {
				response.getWriter().write(""); // 공백 문자 출력
			}
		}
	}

	public String getTen(String fromId, String toId) {
		System.out.println("첫번째 일루와");
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":["); // JSON 배열 호출
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatVO> chatList = chatDAO.getChatListByRecent(fromId, toId, 100);
		if (chatList.size() == 0)
			return "";

		for (int i = 0; i < chatList.size(); i++) {

			result.append("[{fromId\": \"" + chatList.get(i).getFromId() + "\",");
			result.append("toId\": \"" + chatList.get(i).getToId() + "\",");
			result.append("content\": \"" + chatList.get(i).getChatContent() + "\",");
			result.append("chatTime\": \"" + chatList.get(i).getChatTime() + "\"}");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		return result.toString();
	}

	public String getID(String fromId, String toId, String chatId) {
		System.out.println("두번째 일루와");
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatVO> chatList = chatDAO.getChatListByID(fromId, toId, chatId);
		if (chatList.size() == 0)
			return "";

		for (int i = 0; i < chatList.size(); i++) {
			result.append("{\"fromID\": \"" + chatList.get(i).getFromId() + "\",");
			result.append("\"toID\": \"" + chatList.get(i).getToId() + "\",");
			result.append("\"content\": \"" + chatList.get(i).getChatContent() + "\",");
			result.append("\"chatTime\": \"" + chatList.get(i).getChatTime() + "\"}");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("]}");
		return result.toString();
	}

	@RequestMapping("/ChatMessageBox")
	protected void ChatMessageBox(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String userID = request.getParameter("userID");

		if (userID == null || userID.equals("userID")) {
			response.getWriter().write("");

			System.out.println("11111");
		} else {
			try {
				userID = URLDecoder.decode(userID, "UTF-8");
				response.getWriter().write(getMessageBox(userID));
			} catch (Exception e) {

				System.out.println("흠냐 이거 오류인가");
				response.getWriter().write("");
			}
		}
	}

	public String getMessageBox(String userId) {
		StringBuffer result = new StringBuffer("");
		System.out.println("여기까지오냐?");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatVO> chatList = chatDAO.getMessageBox(userId);
		if (chatList.size() == 0)
			return "";

		for (int i = 0; i < chatList.size(); i++) {
			System.out.println(chatList.get(i));
			result.append("[{\"보낸사람\": \"" + chatList.get(i).getFromId() + "\"},");
			result.append("{\"받은사람\": \"" + chatList.get(i).getToId() + "\"},");
			result.append("{\"내용\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"시간\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if (i != chatList.size() - 1)
				result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatId() + "\"}");
		System.out.println(result.toString());
		return result.toString();
	}

	@RequestMapping("/ChatSubmitServlet")
	protected void ChatSubmit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String fromId = request.getParameter("fromId");
		String toId = request.getParameter("toId");
		String chatContent = request.getParameter("chatContent");

		if (fromId == null || fromId.equals("") || toId == null || toId.equals("") || chatContent == null
				|| chatContent.equals("")) {
			response.getWriter().write("0");
		} else if (fromId.equals(toId)) { // 본인이 본인한테 메세지를 보낼경우 예외처리
			response.getWriter().write("-1"); // -1 값을 리턴하여 실제 예외처리 시킴
		} else {
			fromId = URLDecoder.decode(fromId, "UTF-8");
			toId = URLDecoder.decode(toId, "UTF-8");
			chatContent = URLDecoder.decode(chatContent, "UTF-8");
			response.getWriter().write(new ChatDAO().submit(fromId, toId, chatContent) + "");
		}
	}

	@RequestMapping("/ChatUnRead")
	protected void ChatUnRead(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String userID = request.getParameter("userID");

		if (userID == null || userID.equals("userID")) {
			response.getWriter().write("0");
		} else {
			userID = URLDecoder.decode(userID, "UTF-8");
			response.getWriter().write(new ChatDAO().getUnreadChat(userID) + "");
		}
	}

}
*/