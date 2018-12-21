package com.yrtrip.app.order.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.order.OrderService;
import com.yrtrip.app.order.OrderVO;

@Controller
public class OrderController {

	@Autowired OrderService orderService;

	//전체 조회
	@RequestMapping(value = "/getOrderList", method = RequestMethod.GET)
	public ModelAndView getOrderList(OrderVO vo, Paging paging) {
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체 건수
		paging.setTotalRecord(orderService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("orderList", orderService.getOrderList(vo));
		mv.setViewName("mypage/getMyOrderList");
		return mv;
	}
	//단건 조회
	@RequestMapping("/getOrder")
	public String getOrder(Model model, OrderVO vo) {
		model.addAttribute("order", orderService.getOrder(vo));
		return "order/getOrder";
	}
	
	//등록폼
	@RequestMapping(value = "/insertOrder", method = RequestMethod.GET)
	public String insertOrderForm() {
		return "order/insertOrder";
	}
	//등록처리
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String insertOrder(OrderVO vo) {
		orderService.insertOrder(vo);
		return "redirect:getOrderList";
	}
	
	//수정폼
	@RequestMapping("/updateOrderForm")
	public String updateNoticeForm(Model model, OrderVO vo) {
		model.addAttribute("order", orderService.getOrder(vo));
		return "order/updateOrder";
	}
	//수정처리
	@RequestMapping("updateOrder")
	public String updateOrder(OrderVO vo) {
		orderService.updateOrder(vo);
		return "redirect:getOrderList";
	}
	
	//삭제처리
	@RequestMapping("/deleteOrder")
	public String deleteOrder(OrderVO vo) {
		orderService.deleteOrder(vo);
		return "redirect:getOrderList";
	}
	
}
