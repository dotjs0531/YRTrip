package com.yrtrip.app.travel.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.travel.TravelBoardService;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelInfoVO;
import com.yrtrip.app.travel.TravelPlaceService;
import com.yrtrip.app.travel.TravelPlaceVO;

@Controller
public class TravelBoardController {

	@Autowired
	TravelBoardService travelBoardService;
	TravelPlaceService travelPlaceService;
	
	//전체조회
	@RequestMapping(value = { "/getTravelBoardList"}, method = RequestMethod.GET)
	public ModelAndView getTravelBoardList(TravelBoardVO vo, Paging paging) {
		
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
				// 페이지번호 파라미터
				if( paging.getPage() == null) {
					paging.setPage(1); 
				}

				paging.setPageUnit(12);
				
				// 시작/마지막 레코드 번호
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				// 전체 건수
				paging.setTotalRecord(travelBoardService.getCount(vo));
				
				mv.addObject("paging", paging);
				
				mv.addObject("travelBoardList", travelBoardService.getTravelBoardList(vo));
				
				mv.setViewName("travel/getTravelBoardList");
				return mv;
			}
	
	//베스트여행기 전체조회
	@RequestMapping(value = { "/getBestTravelList"}, method = RequestMethod.GET)
	public ModelAndView getBestTravelList(TravelBoardVO vo, Paging paging) {
		
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
				// 페이지번호 파라미터
				if( paging.getPage() == null) {
					paging.setPage(1); 
				}

				paging.setPageUnit(12);
				
				// 시작/마지막 레코드 번호
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				// 전체 건수
				paging.setTotalRecord(travelBoardService.getCountB(vo));
				
				mv.addObject("paging", paging);
				
				mv.addObject("bestTravelList", travelBoardService.getBestTravelList(vo));
				
				mv.setViewName("travel/getBestTravelList");
				return mv;
			}

	//상세조회
	@RequestMapping("/getTravelBoard")
	public String getTravelBoard(Model model, TravelBoardVO vo, TravelPlaceVO pvo, HttpServletRequest req, HttpServletResponse res) {
	int countCheck = 0;
		
		//저장된 쿠키 불러오기
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("travelNo"+vo.getTravelNo())){
					countCheck = 0;
					break;
				}else{
					Cookie cookie = new Cookie("travelNo"+vo.getTravelNo(), String.valueOf(vo.getTravelNo()));
					cookie.setMaxAge(60*60*24);	//하루동안 조회수 중복 증가 방지
					cookie.setPath("/");
					res.addCookie(cookie);
					countCheck += 1;
				}
			}
		}
		//상세정보 조회시 카운트 증가
		if(countCheck > 0){
			travelBoardService.updateViewCnt(vo);
		}
		
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		model.addAttribute("travelPlace", travelBoardService.getTravelPlaceList(pvo));
		return "travel/getTravelBoard";
	}

	//등록처리
	@RequestMapping(value = { "/insertTravelBoardform" }, method = RequestMethod.POST)
	public String insertTravelBoardform(@ModelAttribute("travelBoard") TravelBoardVO vo, Model model) {
		travelBoardService.insertTravelBoard(vo);
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/insertTravelBoard";
	}


//수정폼
	@RequestMapping("/updateTravelBoardform")
	public String updateTravelBoardform(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/updateTravelBoard";
	}

//수정처리
	@RequestMapping(value = { "updateTravelBoard" }, method = RequestMethod.POST)
	public String updateTravelBoard(TravelBoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/images/travel");

		MultipartFile travelPicFile = vo.getTravelPicFile();
		if (!travelPicFile.isEmpty() && travelPicFile.getSize() > 0) {
			String filename = travelPicFile.getOriginalFilename();
			travelPicFile.transferTo(new File(path, filename));

		vo.setTravelPic(filename);
	}
		travelBoardService.updateTravelBoard(vo);
		return "redirect:getTravelBoardList";
	}
	
//삭제
	@RequestMapping("deleteTravelBoard")
	public String deleteTravelBoard(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoard(vo);
		return "redirect:getTravelBoardList"; 
	}

//선택삭제
	@RequestMapping("deleteTravelBoardList")
	public String deleteTravelBoardList(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoardList(vo);
		return "redirect:getTravelBoardList"; 
	}
	
// travelinfot list Ajax
	@RequestMapping(value="/getTravelInfoListData", method=RequestMethod.POST)
	@ResponseBody
	public List<TravelBoardVO> getTravelInfoListData(TravelInfoVO vo) {
		return travelBoardService.getTravelInfoList(vo);
	}

	@RequestMapping(value="/getTravelInfoList", method=RequestMethod.POST)
	public String getTravelInfoList(TravelInfoVO vo) {
		return "travel/getTravelBoardList";
	}
	
// Modal travelinfot list Ajax
	@RequestMapping(value="/getTravelInfoListModalData", method=RequestMethod.POST)
	@ResponseBody
	public List<TravelBoardVO> getTravelInfoListModalData(TravelInfoVO vo) {
		return travelBoardService.getTravelInfoListModal(vo);
	}

	@RequestMapping(value="/getTravelInfoListModal", method=RequestMethod.POST)
	public String getTravelInfoListModal(TravelInfoVO vo) {
		return "travel/getTravelBoardList";
	}

}
