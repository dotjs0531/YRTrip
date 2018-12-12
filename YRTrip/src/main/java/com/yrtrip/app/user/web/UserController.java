package com.yrtrip.app.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Controller
public class UserController {

	@Autowired UserService userService;

	//�α��� ó��
	@RequestMapping("login") //login.jsp�� form action id���� ����
	public String login(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletRequest request) { //model.addAttribute("user", vo)
		//id �ܰ� ��ȸ
		UserVO uservo = userService.getUser(vo);

		//���� ������ �ּҰ� ����
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		
		//�ش� id�� ������ �н����� ��
		if(uservo == null) { //id�� ���°��
			return "redirect:"+url;
		} else if(!vo.getUserPw().equals(uservo.getUserPw())) { //id�� �н����� ��ġ���� �ʴ°��
			return "redirect:"+url;
		} else {
			session.setAttribute("login", uservo);
			if(referer != null && !referer.equals("")) 
				return "redirect:"+url;
			
			//if referer�� null�� �ƴϰ� ������������ ȸ������������, �α׾ƿ�������, �α����������� ��쿣 �ٸ� ������ ȣ��
			
			return "redirect:"+url; //�α��� ���� �� ���� ������ ȣ��
		}
	}
	//�α׾ƿ�
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		
		session.invalidate(); //���� ��ȿȭ
		return "redirect:"+url;
	}
	
	//ȸ������ ��
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupForm() {
		return "user/signup";
	}
	//ȸ������ ó��
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(UserVO vo, HttpServletRequest request) {
		userService.insertUser(vo);
		return "main";
	}
	
	//����������
	@RequestMapping("/getMyInfo")
	public String mypage(Model model, UserVO vo, HttpSession session) {
		model.addAttribute("user", userService.getUser(vo));
		return "user/getMyInfo";
	}
	//���������� ����
	@RequestMapping("updateMyInfo")
	public String updateMyInfo(UserVO vo) {
		userService.updateUser(vo);
		return "redirect:getMyInfo";
	}
	
	//Ż��ó��
	@RequestMapping("/deleteMyInfo")
	public String deleteMyInfo(HttpSession session, UserVO vo) {
		session.invalidate(); //���� ��ȿȭ
		userService.deleteUser(vo);
		
		return "main";
	}
}
