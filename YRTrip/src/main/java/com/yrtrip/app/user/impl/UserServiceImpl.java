package com.yrtrip.app.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired UserDAOMybatis dao;
	
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}

	public void updateUser(UserVO vo) {
		dao.updateUser(vo);
	}

	public void deleteUser(UserVO vo) {
		dao.deleteUser(vo);
	}

	public UserVO getUser(UserVO vo) {
		return dao.getUser(vo);
	}

	public List<UserVO> getUserList(UserVO vo) {
		return dao.getUserList(vo);
	}

}
