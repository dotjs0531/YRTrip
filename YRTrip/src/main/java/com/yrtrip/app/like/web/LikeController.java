package com.yrtrip.app.like.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrtrip.app.like.LikeService;
import com.yrtrip.app.like.LikeVO;

@Controller
public class LikeController {

	@Autowired LikeService likeService;
	
	//전체 조회
	@RequestMapping(value = "/getLikeList", method = RequestMethod.GET)
	public String getLikeList(Model model, LikeVO vo) {
		model.addAttribute("likeList", likeService.getLikeList(vo));
		return "like/getLikeList";
	}
	//단건 조회
	@RequestMapping("/getLike")
	public String getLike(Model model, LikeVO vo) {
		model.addAttribute("like", likeService.getLike(vo));
		return "like/getLike";
	}
	
	//등록처리
	@RequestMapping(value = "/insertLike", method = RequestMethod.POST)
	public String insertLike(LikeVO vo, HttpServletRequest request) {

		//이전 페이지 주소값 저장
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		
		likeService.insertLike(vo);
		return "redirect:"+url;
	}
	
	//삭제처리
	@RequestMapping("/deleteLike")
	public String deleteLike(LikeVO vo, HttpServletRequest request) {
		
		//이전 페이지 주소값 저장
		String context = request.getContextPath();
		String referer = request.getHeader("Referer");
		String url = referer.substring(referer.indexOf(context)+context.length()+1);
		
		likeService.deleteLike(vo);
		return "redirect:"+url;
	}
}
