package com.yrtrip.app.chat.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yrtrip.app.chat.ChatVO;

public class ChatDAO {

	DataSource dataSource;
	
	public ChatDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/myoracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ChatVO> getChatListByID(String fromId, String toId, String chatId){
		ArrayList<ChatVO> chatList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "SELECT * FROM CHATT WHERE ((from_Id = ? AND to_Id = ?) OR (from_Id= ? AND to_Id=?)) AND chat_Id > ? ORDER BY chat_Time";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, toId);
			pstmt.setString(4, fromId);
			pstmt.setInt(5, Integer.parseInt(chatId));
			rs = pstmt.executeQuery();
			
			chatList = new ArrayList<ChatVO>();
			
			while (rs.next()) {
				ChatVO chat = new ChatVO();
				chat.setChatId(rs.getString("chat_Id"));
				chat.setFromId(rs.getString("from_Id"));
				chat.setToId(rs.getString("to_Id"));
				chat.setChatContent(rs.getString("chat_Content"));
				int chatTime = Integer.parseInt(rs.getString("chat_Time").substring(11, 13));
				String timeType = "오전";
				if(chatTime > 12) {
					timeType = "오후";
					chatTime -= 12;
				}
				chat.setChatTime(rs.getString("chat_Time").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("chat_Time").substring(14, 16) + "");
				chatList.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatList; // 챗 리스트 그릇 담아주기
	}
	
	public ArrayList<ChatVO> getChatListByRecent(String fromId, String toId, int number){
		ArrayList<ChatVO> chatList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 현재 DB에서 가장 최근 메세지 가져오기
		String SQL = "SELECT * FROM CHATT WHERE ((from_Id = ? AND to_Id = ?) OR (from_Id= ? AND to_Id = ?)) AND chat_Id > (SELECT MAX(chat_Id) - ? FROM CHATT WHERE (from_Id = ? AND to_Id =?) OR (from_Id =? AND to_Id = ?)) ORDER BY chat_Time";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, toId);
			pstmt.setString(4, fromId);
			pstmt.setInt(5, number);
			pstmt.setString(6, fromId);
			pstmt.setString(7, toId);
			pstmt.setString(8, toId);
			pstmt.setString(9, fromId);
			rs = pstmt.executeQuery();
			
			chatList = new ArrayList<ChatVO>();
			
			while (rs.next()) {
				ChatVO chat = new ChatVO();
				chat.setChatId(rs.getString("chat_Id"));
				chat.setFromId(rs.getString("from_Id"));
				chat.setToId(rs.getString("to_Id"));
				chat.setChatContent(rs.getString("chat_Content"));
				int chatTime = Integer.parseInt(rs.getString("chat_Time").substring(11, 13));
				String timeType = "오전";
				if(chatTime > 12) {
					timeType = "오후";
					chatTime -= 12;
				}
				chat.setChatTime(rs.getString("chat_Time").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("chat_Time").substring(14, 16) + "");
				chatList.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatList; // 챗 리스트 그릇 담아주기
	}
	
	public int submit(String fromId, String toId, String chatContent){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("여기까지 와야됨.");
		
		String SQL = "INSERT INTO CHATT VALUES(chat_seq.nextval, ?, ?, ?, sysdate, 0)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, chatContent);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // DB오류 체크 -1반환 
	}
	
	//메세지 읽음 처리
	public int readChat(String fromId,String toId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "UPDATE CHATT SET chatRead = 1 WHERE (from_Id = ? AND to_Id = ?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, toId);
			pstmt.setString(2, fromId);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	
	}
	
	public int getUnreadChat(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String SQL = "SELECT COUNT(chat_Id) FROM CHATT WHERE to_Id = ? AND chat_Read = 0";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("COUNT(chat_Id)");
			}
			return 0;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	
	}
	
	public ArrayList<ChatVO> getMessageBox(String userId){
		ArrayList<ChatVO> chatList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 현재 DB에서 가장 최근 메세지 가져오기
		String SQL = "SELECT * FROM CHATT WHERE chat_Id IN (SELECT MAX(chat_Id) FROM CHATT WHERE to_Id = ? OR from_Id = ? GROUP BY from_Id, to_Id)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			
			rs = pstmt.executeQuery();
			
			chatList = new ArrayList<ChatVO>();
			
			while (rs.next()) {
				ChatVO chat = new ChatVO();
				chat.setChatId(rs.getString("chat_Id"));
				chat.setFromId(rs.getString("from_Id"));
				chat.setToId(rs.getString("toId"));
				chat.setChatContent(rs.getString("chat_Content"));
				int chatTime = Integer.parseInt(rs.getString("chat_Time").substring(11, 13));
				String timeType = "오전";
				if(chatTime > 12) {
					timeType = "오후";
					chatTime -= 12;
				}
				chat.setChatTime(rs.getString("chat_Time").substring(0, 11) + " " + timeType + " " + chatTime + ":" + rs.getString("chat_Time").substring(14, 16) + "");
				chatList.add(chat);
			}
			// 결과로 모든 채팅 리스트를 x라는 리스트와 y라는 리스트를 생성하여,
			for(int i=0; i< chatList.size(); i++) {
				ChatVO x = chatList.get(i);
				for(int j = 0; j< chatList.size(); j++) {
					ChatVO y = chatList.get(j);
					//x라는 메세지를 보내는 사람과 y라는 메세지를 받는사람과 동일할뿐만 아니라 x라는 받는사람과 y라는 보내는사람과 동일한 경우 까지 비교연산하여 가장 최신 데이터만 남기기.
					if(x.getFromId().equals(y.getToId()) && x.getToId().equals(y.getFromId())) {
						if(x.getChatId().compareTo(y.getChatId())<0) {
							chatList.remove(x);
							i--;
							break;
						} else {
							chatList.remove(y);
							j--;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatList; // 챗 리스트 그릇 담아주기
	}
}
