package com.yrtrip.app.user.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.user.EmailVO;
import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Controller
public class UserController {

	@Autowired UserService userService;
	
	//전체 조회
	@RequestMapping(value = "/getUserList", method = RequestMethod.GET)
	public String getUserList(Model model, UserVO vo) {
		model.addAttribute("userList", userService.getUserList(vo));
		return "user/getUserList";
	}
	//로그인 처리
	@RequestMapping("login") //login.jsp의 form action id값과 동일
	public void login(@ModelAttribute("user") UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException { //model.addAttribute("user", vo)
		//id 단건 조회
		UserVO uservo = userService.getUser(vo);

		//이전 페이지 주소값 저장
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
		//해당 id가 있으면 패스워드 비교
		if(uservo == null) { //id가 없는경우
			//url = "redirect:"+url;
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1); </script>");
            
		} else if(!vo.getUserPw().equals(uservo.getUserPw())) { //id와 패스워드 일치하지 않는경우
			//url = "redirect:"+url;
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1); </script>");
		} else {
			session.setAttribute("login", uservo);
			if(referer != null && !referer.equals("")) {
				
				//if referer이 null이 아니고 이전페이지가 회원가입페이지, 로그아웃페이지, 로그인페이지인 경우엔 다른 페이지 호출
				if(url.equals("signup") || url.equals("logout")) {
					url = "main";
				} 
			} 
			out.println("<script>location.href='"+url+"'; </script>");
		}
		out.flush();
	}
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		
		/*if(url.equals("getMyInfo?userId="+"회원아이디")) {
			session.invalidate(); //세션 무효화
			return "main";
		}
		else {
			session.invalidate(); //세션 무효화
			return "redirect:"+url;
		}*/
		
		session.invalidate(); //세션 무효화
		
		return "main";
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
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/checkEmail")
	public int checkEmail(ModelAndView mv, UserVO vo) {
		int result = 0;
		UserVO user = userService.getUserEmail(vo);
		if(user != null) result = 1;
		return result;
	}
	
	
	//마이페이지
	@RequestMapping("/getMyInfo")
	public String getMyInfo(Model model, UserVO vo, HttpSession session) {
		model.addAttribute("user", userService.getUser(vo));
		return "mypage/getMyInfo";
	}
	//마이페이지 수정
	@RequestMapping("updateMyInfo")
	public String updateMyInfo(Model model,UserVO vo, HttpSession session) {
		userService.updateUser(vo);
		model.addAttribute("user", userService.getUser(vo));
		return "mypage/getMyInfo";
	}
	
	//탈퇴처리
	@RequestMapping("/deleteMyInfo")
	public String deleteMyInfo(HttpSession session, UserVO vo) {
		userService.deleteUser(vo);
		session.invalidate(); //세션 무효화
		
		return "main";
	}
	
	//비밀번호 재설정 - 메일발송처리
	@RequestMapping("pwFind")
	public void mailSend(EmailVO vo, UserVO uvo,
			        HttpServletResponse response) throws IOException {
		UserVO nvo = new UserVO();	//입력받은 이메일로 회원 정보 가져옴
		nvo = userService.findUserPw(uvo);
		
		//재설정할 비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		String email = nvo.getUserEmail();
		
		uvo.setUserPw(pw);
		uvo.setUserEmail(email);
		userService.updateUserPw(uvo);
		
		vo.setFrom("dotjs0531@gmail.com");
		vo.setTo(uvo.getUserEmail());
		vo.setSubject("[Your Real Trip] 재설정된 비밀번호를 확인하세요.");
		vo.setContent(uvo.getUserPw());
		
		userService.send(vo);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('해당 메일로 재설정된 비밀번호가 전송되었습니다.'); history.go(-1);");
		out.println("</script>");
	}
}
