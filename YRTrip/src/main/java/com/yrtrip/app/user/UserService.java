package com.yrtrip.app.user;

import java.util.List;

public interface UserService {
	public void insertUser(UserVO vo);
	public void updateUser(UserVO vo);
	public void deleteUser(UserVO vo);
	public UserVO getUser(UserVO vo);
	public List<UserVO> getUserList(UserVO vo);
	
	public UserVO findUserPw(UserVO vo);
	public void updateUserPw(UserVO vo);
	public void send(EmailVO vo);
	public void sendAttatch(EmailVO vo);
}
