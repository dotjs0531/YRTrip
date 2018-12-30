package com.yrtrip.app.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.admin.AdminService;
import com.yrtrip.app.admin.AdminVO;

@Controller
public class AdminController {
	
	@Autowired AdminService adminService;
	
	//관리자 첫화면
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String getLikeList(Model model) {
		return "admin/admin";
	}
	
	//Input Form
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form(Model model) {
		return "admin/basic_elements";
	}
	
	//Chart
	@RequestMapping(value = "/getTinfoChart", method = RequestMethod.GET)
	@ResponseBody
	public List<AdminVO> selectTravelPlaceList(AdminVO vo) {
		return adminService.getTinfoChart(vo);
	}
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(Model model) {
		return "admin/chartjs";
	}
	
	//Table
	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String table(Model model) {
		return "admin/basic-table";
	}
}
