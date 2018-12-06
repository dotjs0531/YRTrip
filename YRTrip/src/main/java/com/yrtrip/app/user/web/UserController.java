package com.yrtrip.app.user.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Controller
public class UserController {

	@Autowired UserService userservice;

	//로그인 폼
	@RequestMapping("loginForm")
	public String loginForm() {
		return "user/login";
	}
	
	
	//로그인 처리
	@RequestMapping("login") //login.jsp의 form action id값과 동일
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session) { //model.addAttribute("user", vo)
		//id 단건 조회
		UserVO uservo = userservice.getUser(vo);
		
		//해당 id가 있으면 패스워드 비교
		if(uservo == null) { //id가 없는경우
			return "main";
		} else if(!vo.getUserPw().equals(uservo.getUserPw())) { //id와 패스워드 일치하지 않는경우
			return "main";
		} else {
			session.setAttribute("login", uservo);
			return "user/login"; //로그인 성공 후 원래 페이지 호출
		}
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 무효화
		return "user/login"; //로그인 페이지로 돌아감
	}
	
}
