package com.yrtrip.app.partner.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.partner.PartnerService;
import com.yrtrip.app.partner.PartnerVO;

@Controller
public class PartnerController {

	@Autowired
	PartnerService partnerService;
	
	// 전체조회
	@RequestMapping(value = { "/getPartnerList"}, method = RequestMethod.GET) // http://localhost:8081/app/getPartnerList
	public ModelAndView getPartnerList(Paging paging, PartnerVO vo) {
		ModelAndView mv = new ModelAndView();
		// 페이징
		if (paging.getPage()==null) {
			paging.setPage(1);
		}
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		paging.setTotalRecord(partnerService.getCount(vo));
		
		mv.addObject("paging", paging);
		mv.addObject("partnerList", partnerService.getPartnerList(vo));
		mv.setViewName("partner/getPartnerList");
		return mv;
	}
	
	// 단건조회
	@RequestMapping("/getPartner") // http://localhost:8081/app/getPartner
	public String getPartner(Model model, PartnerVO vo, HttpServletRequest req, HttpServletResponse res) {
		int countCheck = 0;
		
		//저장된 쿠키 불러오기
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("partnerId"+vo.getPartnerId())){
					countCheck = 0;
					break;
				}else{
					Cookie cookie = new Cookie("partnerId"+vo.getPartnerId(), String.valueOf(vo.getPartnerId()));
					cookie.setMaxAge(60*60*24);	//하루동안 조회수 중복 증가 방지
					cookie.setPath("/");
					res.addCookie(cookie);
					countCheck += 1;
				}
			}
		}
		//상세정보 조회시 카운트 증가
		if(countCheck > 0){
			partnerService.updateViewCnt(vo);
		}
		
		model.addAttribute("partner", partnerService.getPartner(vo));	// vo : 조회할 게시글 번호 넘어가는 것		
		return "partner/getPartner";
	}
	
	// 등록폼
	@RequestMapping(value = "/insertPartnerForm", method = RequestMethod.GET)
	public String insertPartnerform() {
		return "partner/insertPartner";
	}
	// 등록처리
	@RequestMapping(value = { "/insertPartner" }, method = RequestMethod.POST)
	public String insertPartner(PartnerVO vo) { // 커맨드 객체
		partnerService.insertPartner(vo); // 등록처
		return "redirect:getPartnerList"; // 목록요청
	}

	// 수정폼
	@RequestMapping("/updatePartnerForm")
	public String updatePartnerForm(Model model, PartnerVO vo) {
		model.addAttribute("partner", partnerService.getPartner(vo));
		return "partner/updatePartner";
	}
	// 수정처리
	@RequestMapping("updatePartner")
	public String updatePartner(PartnerVO vo) {
		partnerService.updatePartner(vo); // 수정처리
		return "redirect:getPartnerList"; // 목록요청
	}

	// 삭제처리
	@RequestMapping("deletePartner")
	public String deletePartner(PartnerVO vo) {
		partnerService.deletePartner(vo); // 삭제처리
		return "redirect:getPartnerList"; // 목록요청
	}
	
	// 마감처리
	@RequestMapping("/closePartner")
	public String closePartner(PartnerVO vo) {
		partnerService.closePartner(vo);
		return "redirect:getPartnerList";
	}
}
