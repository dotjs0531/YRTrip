package com.yrtrip.app.admin.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired AdminService adminService;
	
	//관리자 첫화면
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String getLikeList(Model model) {
		return "admin/admin";
	}
	
	//회원관리
	@RequestMapping(value = "/manageUser", method = RequestMethod.GET)
	public String manageUser(Model model) {
		return "admin/manageUser";
	}
	
	//거래관리 - 상품관리
	@RequestMapping(value = "/manageProduct", method = RequestMethod.GET)
	public String manageProduct(Model model) {
		return "admin/manageProduct";
	}
	
	//거래관리 - 주문내역관리
	@RequestMapping(value = "/manageOrder", method = RequestMethod.GET)
	public String manageOrder(Model model) {
		return "admin/manageOrder";
	}
	
	//동행관리
	@RequestMapping(value = "/managePartner", method = RequestMethod.GET)
	public String managePartner(Model model) {
		return "admin/managePartner";
	}
	
	//여행관리
	@RequestMapping(value = "/manageTravel", method = RequestMethod.GET)
	public String manageTravel(Model model) {
		return "admin/manageTravel";
	}
	
	//통계관리
	@RequestMapping(value = "/getTinfoChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getTinfoChart(@RequestParam String day) {
		return adminService.getTinfoChart(day);
	}
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(Model model) {
		return "admin/chartjs";
	}
	
	//1:1문의글 관리
	@RequestMapping(value = "/manageNotice", method = RequestMethod.GET)
	public String manageNotice(Model model) {
		return "admin/manageNotice";
	}
	
	//1:1문의글 관리
	@RequestMapping(value = "/manageQna", method = RequestMethod.GET)
	public String manageQna(Model model) {
		return "admin/manageQna";
	}
}
