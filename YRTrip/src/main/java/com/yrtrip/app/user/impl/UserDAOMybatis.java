package com.yrtrip.app.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yrtrip.app.user.UserVO;

@Repository
public class UserDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	//등록
	public void insertUser(UserVO vo) {
		mybatis.update("user.insertUser", vo);
	}
	
	//수정
	public void updateUser(UserVO vo) {
		mybatis.update("user.updateUser", vo);
	}
	
	//삭제
	public void deleteUser(UserVO vo) {
		mybatis.update("user.deleteUser", vo.getUserId());
	}
	
	//선택 삭제
	public void deleteUserList(UserVO vo) {
		mybatis.update("user.deleteUserList", vo);
	}
	
	//단건 조회
	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("user.getUser", vo);
	}
	public int getUserCount(UserVO vo) {
		return mybatis.selectOne("user.getUserCount", vo);
	}
	
	//이메일 중복 체크
	public UserVO getUserEmail(UserVO vo) {
		return mybatis.selectOne("user.getUserEmail", vo);
	}
	//메일 전체 조회
	public List<String> getUserEmailList(){
		return mybatis.selectList("user.getUserEmailList");
	}
	//전체 조회
	public List<UserVO> getUserList(UserVO vo)  {
		return mybatis.selectList("user.getUserList", vo);
	}

	//비밀번호 찾기
	public UserVO findUserPw(UserVO vo) {
		return mybatis.selectOne("user.findUserPw", vo);
	}
	//비밀번호 재설정
	public void updateUserPw(UserVO vo) {
		mybatis.update("user.updateUserPw", vo);
	}
}
