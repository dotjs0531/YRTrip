package com.yrtrip.app.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.admin.AdminService;
import com.yrtrip.app.admin.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired AdminDAOMybatis dao;
	
	@Override
	public List<AdminVO> getTinfoChart(AdminVO vo) {
		return dao.getTinfoChart(vo);
	}
	
}
