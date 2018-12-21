package com.yrtrip.app.travel.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.travel.TravelBoardService;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.travel.TravelInfoVO;

@Controller
public class TravelBoardController {

	@Autowired
	TravelBoardService travelBoardService;
	
//전체조회
	@RequestMapping(value = { "/getTravelBoardList"}, method = RequestMethod.GET)
	public ModelAndView getTravelBoardList(TravelBoardVO vo, Paging paging) {
		
		ModelAndView mv = new ModelAndView();
		//페이징 처리
				//페이지번호 파라미터
				if( paging.getPage() == null) {
					paging.setPage(1); 
				}
				
				//한페이지에 출력할 레코드 건수
				paging.setPageUnit(12);
				
				//first, last 계산
				vo.setFirst(paging.getFirst());
				vo.setLast(paging.getLast());
				//전체 레코드 건수
				paging.setTotalRecord(travelBoardService.getCount(vo));
				
				mv.addObject("paging", paging);
				
				mv.addObject("travelBoardList", travelBoardService.getTravelBoardList(vo));
				
				mv.setViewName("travel/getTravelBoardList");
				return mv;
			}

//단건조회
	@RequestMapping("/getTravelBoard")
	public String getTravelBoard(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/getTravelBoard";
	}

//모달 등록폼
	@RequestMapping(value = { "/insertTravelBoardform" }, method = RequestMethod.GET)
	public String insertTravelBoardform() {
		System.out.println("--------------------------sdgkljgfkljsdgkljdslgkj");
		return "travel/insertTravelBoard";
	}

//모달 등록처리 
	@RequestMapping(value = { "insertTravelBoard" }, method = RequestMethod.POST)
	public String insertTravelBoard(TravelBoardVO vo) { // 커맨드 객체
		travelBoardService.insertTravelBoard(vo); // 등록처리
		System.out.println("--------------------------22222222222222222222222222222");
		return "redirect:insertTravelBoard"; // insertTravelBoard.jsp로 이동
	}

//수정폼
	@RequestMapping("/updateTravelBoardform")
	public String updateTravelBoardform(Model model, TravelBoardVO vo) {
		model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
		return "travel/updateTravelBoard";
	}

//수정처리
	@RequestMapping("updateTravelBoard")
	public String updateTravelBoard(TravelBoardVO vo) {
		travelBoardService.updateTravelBoard(vo); // 수정처리
		return "redirect:getTravelBoardList"; // 목록요청
	}

//수정폼
		@RequestMapping("/updateTravelBoardTwoform")
		public String updateTravelBoardTwoform(Model model, TravelBoardVO vo) {
			model.addAttribute("travelBoard", travelBoardService.getTravelBoard(vo));
			return "travel/updateTravelBoardTwo";
		}

//수정처리
		@RequestMapping("updateTravelBoardTwo")
		public String updateTravelBoardTwo(TravelBoardVO vo) {
			travelBoardService.updateTravelBoardTwo(vo); // 수정처리
			return "redirect:getTravelBoardList"; // 목록요청
		}

//삭제처리
	@RequestMapping("deleteTravelBoard")
	public String deleteTravelBoard(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoard(vo); // 삭제처리
		return "redirect:getTravelBoardList"; // 목록요청
	}

//선택삭제처리
	@RequestMapping("deleteTravelBoardList")
	public String deleteTravelBoardList(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoardList(vo); // 삭제처리
		return "redirect:getTravelBoardList"; // 목록요청
	}
	
// list 조회 Ajax
	@RequestMapping(value="/getTravelInfoListData", method=RequestMethod.POST)
	@ResponseBody
	public List<TravelBoardVO> getTravelInfoListData(TravelInfoVO vo) {
		System.out.println("--------------------------");
		System.out.println(vo);
		return travelBoardService.getTravelInfoList(vo);
	}

	@RequestMapping(value="/getTravelInfoList", method=RequestMethod.POST)
	public String getTravelInfoList(TravelInfoVO vo) {
		return "travel/getTravelBoardList";
	}
	
// Modal에서 list 조회 Ajax
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
