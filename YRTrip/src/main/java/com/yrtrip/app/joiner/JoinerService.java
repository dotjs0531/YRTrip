package com.yrtrip.app.joiner;

import java.util.List;

public interface JoinerService {

	public void insertJoiner(JoinerVO vo);
	public void deleteJoiner(JoinerVO vo);
	public List<JoinerVO> getJoinerList(JoinerVO vo);
	public JoinerVO getJoiner(JoinerVO vo);
	
	public void acceptJoiner(JoinerVO vo);
	public void cancleJoiner(JoinerVO vo);
	
	public int getJoinerUser(JoinerVO vo);
}
