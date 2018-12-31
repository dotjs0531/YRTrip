package com.yrtrip.app.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yrtrip.app.admin.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired AdminDAOMybatis dao;
	
	@Override
	public List<Map> getTinfoChart(String day) {
		return dao.getTinfoChart(day);
	}
	
}
