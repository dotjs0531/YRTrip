package com.yrtrip.app.partner.impl;

import org.springframework.stereotype.Repository;

@Repository
public class PartnerDAO {
//
//	private Connection conn = null;
//	private PreparedStatement pstmt;
//	private ResultSet rs;
//
//	// SQL 명령어
//	private final String PARTNER_INSERT = "insert into board(seq, title, writer, content, regdate, cnt) "
//			+ "values( (select nvl(max(seq),0)+1 from board), ?, ?, ?, sysdate, 0)";
//	private final String PARTNER_UPDATE = "update board set title=?, content=? where seq =?";
//	private final String PARTNER_DELETE = "delete from board where seq=?";
//	private final String PARTNER_SELECT = "select seq, title, writer, content, regdate, cnt from partnert where seq = ?";
//	private final String PARTNER_LIST = "select seq, title, writer, content, regdate, cnt from partnert order by seq desc";

//	// 등록
//	public void insertBoard(BoardVO vo) {
//		System.out.println("BoardDAO insertBoard");
//		try {
//			// 1. DB 연결
//			conn = JDBCUtil.getConnection();
//			// conn.setAutoCommit(false); //트랜젝션 처리
//			// 2. 구문
//			stmt = conn.prepareStatement(BOARD_INSERT);
//			// 3. 결과 처리
//			stmt.setString(1, vo.getTitle());
//			stmt.setString(2, vo.getWriter());
//			stmt.setString(3, vo.getContent());
//			int r = stmt.executeUpdate();
//			// conn.commit();
//			System.out.println(r + "건 등록됨");
//		} catch (Exception e) {
//			/*
//			 * try { conn.rollback(); } catch (SQLException e1) { e1.printStackTrace(); }
//			 */
//			e.printStackTrace();
//		} finally {
//			// 4. 연결 해제
//			JDBCUtil.close(rs, stmt, conn);
//		}
//
//	}
//
//	// 수정
//	public void updateBoard(BoardVO vo) {
//		System.out.println("BoardDAO updateBoard");
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(BOARD_UPDATE);
//			stmt.setString(1, vo.getTitle());
//			stmt.setString(2, vo.getContent());
//			stmt.setInt(3, vo.getSeq());
//			stmt.executeUpdate();
//			System.out.println("수정됨");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//	}
//
//	// 삭제
//	public void deleteBoard(BoardVO vo) {
//		System.out.println("BoardDAO deleteBoard");
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(BOARD_DELETE);
//			stmt.setInt(1, vo.getSeq());
//			int r = stmt.executeUpdate();
//			System.out.println(r + "건 삭제됨");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//	}
//
//	// 단건조회
//	public BoardVO getBoard(BoardVO vo) {
//		System.out.println("BoardDAO getBoard");
//		BoardVO boardVO = new BoardVO();
//		try {
//			// 1. 연결
//			conn = JDBCUtil.getConnection();
//			// 2. 구문
//			stmt = conn.prepareStatement(BOARD_GET);
//			// 3. 결과처리
//			stmt.setInt(1, vo.getSeq());
//			rs = stmt.executeQuery();
//			if (rs.next()) {
//				boardVO.setSeq(rs.getInt("SEQ"));
//				boardVO.setTitle(rs.getString("TITLE"));
//				boardVO.setWriter(rs.getString("WRITER"));
//				boardVO.setContent(rs.getString("CONTENT"));
//				boardVO.setRegdate(rs.getString("REGDATE"));
//				boardVO.setCnt(rs.getInt("CNT"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return boardVO;
//	}
//
//	// 전체조회
//	public List<BoardVO> getBoardList() {
//		System.out.println("BoardDAO getBoardList");
//		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(BOARD_LIST);
//			rs = stmt.executeQuery();
//			while (rs.next()) {
//				BoardVO boardVO = new BoardVO();
//				boardVO.setSeq(rs.getInt("SEQ"));
//				boardVO.setTitle(rs.getString("Title"));
//				boardVO.setWriter(rs.getString("WRITER"));
//				boardVO.setContent(rs.getString("CONTENT"));
//				boardVO.setRegdate(rs.getString("REGDATE"));
//				boardVO.setCnt(rs.getInt("CNT"));
//				list.add(boardVO); // 리스트에 한 건씩 추가
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return list;
//	}

}
