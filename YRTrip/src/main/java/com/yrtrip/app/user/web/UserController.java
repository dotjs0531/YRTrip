package com.yrtrip.app.user.web;

import javax.servlet.http.HttpServletRequest;
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
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletRequest request) { //model.addAttribute("user", vo)
		//id 단건 조회
		UserVO uservo = userservice.getUser(vo);

		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		//해당 id가 있으면 패스워드 비교
		if(uservo == null) { //id가 없는경우
			return "main";
		} else if(!vo.getUserPw().equals(uservo.getUserPw())) { //id와 패스워드 일치하지 않는경우
			return "main";
		} else {
			session.setAttribute("login", uservo);
			if(referer != null && !referer.equals("")) 
				return "redirect:"+url;
			
			
			//if referer이 null이 아니고 이전페이지가 회원가입페이지, 로그아웃페이지, 로그인페이지인 경우엔 다른 페이지 호출
			
			
			return "redirect:"+url; //로그인 성공 후 원래 페이지 호출
		}
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		
		session.invalidate(); //세션 무효화
		return "redirect:"+url;
	}
	
}
