package com.yrtrip.app.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Controller
public class UserController {

	@Autowired UserService userService;

	//로그인 처리
	@RequestMapping("login") //login.jsp의 form action id값과 동일
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletRequest request) { //model.addAttribute("user", vo)
		//id 단건 조회
		UserVO uservo = userService.getUser(vo);

		//이전 페이지 주소값 저장
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		
		//해당 id가 있으면 패스워드 비교
		if(uservo == null) { //id가 없는경우
			return "redirect:"+url;
		} else if(!vo.getUserPw().equals(uservo.getUserPw())) { //id와 패스워드 일치하지 않는경우
			return "redirect:"+url;
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
	
	//회원가입 폼
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupForm() {
		return "user/signup";
	}
	//회원가입 처리
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(UserVO vo, HttpServletRequest request) {
		userService.insertUser(vo);
		return "main";
	}
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/checkId")
	public int checkId(ModelAndView mv, UserVO vo) {
		int result = 0;
		UserVO user = userService.getUser(vo);
		if(user != null) result = 1;
		return result;
	}
	
	//마이페이지
	@RequestMapping("/getMyInfo")
	public String getMyInfo(Model model, UserVO vo, HttpSession session) {
		model.addAttribute("user", userService.getUser(vo));
		return "user/getMyInfo";
	}
	//마이페이지 수정
	@RequestMapping("updateMyInfo")
	public String updateMyInfo(Model model,UserVO vo, HttpSession session) {
		userService.updateUser(vo);
		model.addAttribute("user", userService.getUser(vo));
		return "user/getMyInfo";
	}
	
	//탈퇴처리
	@RequestMapping("/deleteMyInfo")
	public String deleteMyInfo(HttpSession session, UserVO vo) {
		session.invalidate(); //세션 무효화
		userService.deleteUser(vo);
		
		return "main";
	}
}
