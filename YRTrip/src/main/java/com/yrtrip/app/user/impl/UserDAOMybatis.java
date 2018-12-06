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
	
	//단건 조회
	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("user.getUser", vo);
	}
	//전체 조회
	public List<UserVO> getUserList(UserVO vo)  {
		return mybatis.selectList("user.getUserList", vo);
	}
}
