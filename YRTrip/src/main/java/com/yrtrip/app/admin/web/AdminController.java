package com.yrtrip.app.admin.web;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.admin.AdminService;
import com.yrtrip.app.notice.NoticeService;
import com.yrtrip.app.notice.NoticeVO;
import com.yrtrip.app.order.OrderService;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerService;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.qna.QnaService;
import com.yrtrip.app.qna.QnaVO;
import com.yrtrip.app.travel.TravelBoardService;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Controller
public class AdminController {
	
	@Autowired AdminService adminService;
	@Autowired UserService userService;
	@Autowired ProductService productService;
	@Autowired OrderService orderService;
	@Autowired PartnerService partnerService;
	@Autowired TravelBoardService travelBoardService;
	@Autowired NoticeService noticeService;
	@Autowired QnaService qnaService;
	
	//관리자 첫화면
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String getLikeList(Model model, OrderVO ovo, TravelBoardVO tvo, UserVO uvo) {
		model.addAttribute("totalOrderPrice", adminService.totalOrderPrice(ovo));
		model.addAttribute("countOrderAmount", adminService.countOrderAmount(ovo));
		model.addAttribute("countTravelAmount", adminService.countTravelAmount(tvo));
		model.addAttribute("countUserAmount", adminService.countUserAmount(uvo));
		return "admin/admin";
	}
	
	//회원관리
	@RequestMapping(value = "/manageUser", method = RequestMethod.GET)
	public String manageUser(Model model) {
		return "admin/manageUser";
	}
	//회원 삭제Ajax
	@RequestMapping("/deleteUserAjax")
	@ResponseBody
	public UserVO deleteUserAjax(UserVO vo) {
		userService.deleteUser(vo);
		return vo;
	}
	//회원 조회Ajax
		@RequestMapping("/getUserListAjax")
		@ResponseBody
		public List<UserVO> getUserList(UserVO vo) {
			return userService.getUserList(vo);
		}
		
	//거래관리
		@RequestMapping(value = "/manageProduct", method = RequestMethod.GET)
		public String manageProduct(Model model) {
			return "admin/manageProduct";
		}
	//거래관리 - 상품관리 조회Ajax
		@RequestMapping("/getManageProductListAjax")
		@ResponseBody
		public List<ProductVO> getManageProductListAjax(ProductVO vo) {
			vo.setFirst(1);
			vo.setLast(10);
			return adminService.getManageProductList(vo);
		}
		
		//거래관리 - 상품관리 삭제Ajax
		@RequestMapping("/deleteProductAjax")
		@ResponseBody
		public ProductVO deleteProductAjax(ProductVO vo) {
			productService.deleteProduct(vo);
			return vo;
		}
		
	//거래관리 - 주문내역관리
	@RequestMapping(value = "/manageOrder", method = RequestMethod.GET)
	public String manageOrder(Model model, OrderVO vo) {
		model.addAttribute("manageOrder", orderService.getOrderList(vo));
		return "admin/manageOrder";
	}
	//거래관리 - 주문내역관리 조회Ajax
			@RequestMapping("/getManageOrderListAjax")
			@ResponseBody
			public List<OrderVO> getManageOrderListAjax(OrderVO vo) {
				return adminService.getManageOrderList(vo);
			}
	//거래관리 - 주문내역 상세보기
			@RequestMapping("getManageOrder")
			@ResponseBody
			public OrderVO getManageOrder(OrderVO vo) {
				return adminService.getManageOrder(vo);
			}
	
	//동행관리
	@RequestMapping(value = "/managePartner", method = RequestMethod.GET)
	public String managePartner(Model model) {
		return "admin/managePartner";
	}
	//동행관리  조회Ajax
	@RequestMapping("/getManagePartnerListAjax")
	@ResponseBody
	public List<PartnerVO> getManagePartnerListAjax(PartnerVO vo) {
		return adminService.getManagePartnerList(vo);
	}
	//동행관리 삭제Ajax
	@RequestMapping("/deletePartnerAjax")
	@ResponseBody
	public PartnerVO deletePartnerAjax(PartnerVO vo) {
		partnerService.deletePartner(vo);
		return vo;
	}
	
	//여행관리
	@RequestMapping(value = "/manageTravel", method = RequestMethod.GET)
	public String manageTravel(Model model) {
		return "admin/manageTravel";
	}
	//여행관리  조회Ajax
	@RequestMapping("/getManageTravelListAjax")
	@ResponseBody
	public List<TravelBoardVO> getManageTravelListAjax(TravelBoardVO vo) {
		return adminService.getManageTravelList(vo);
	}
	//여행관리 삭제Ajax
	@RequestMapping("/deleteTravelAjax")
	@ResponseBody
	public TravelBoardVO deleteTravelAjax(TravelBoardVO vo) {
		travelBoardService.deleteTravelBoard(vo);
		return vo;
	}
	
	//통계관리
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(Model model) {
		return "admin/chart";
	}
	@RequestMapping(value = "/getTinfoChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getTinfoChart(@RequestParam String day) {
		return adminService.getTinfoChart(day);
	}
	@RequestMapping(value = "/getSellerChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getSellerChart(@RequestParam String day) {
		return adminService.getSellerChart(day);
	}
	@RequestMapping(value = "/getDayChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getDayChart(@RequestParam String day) {
		return adminService.getDayChart(day);
	}
	@RequestMapping(value = "/getTimeChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getTimeChart(@RequestParam String day) {
		return adminService.getTimeChart(day);
	}
	@RequestMapping(value = "/getOrderPriceChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getOrderPriceChart(@RequestParam String day) {
		return adminService.getOrderPriceChart(day);
	}
	@RequestMapping(value = "/getOrderIdChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getOrderIdChart(@RequestParam String day) {
		return adminService.getOrderIdChart(day);
	}
	
	//공지사항 관리
	@RequestMapping(value = "/manageNotice", method = RequestMethod.GET)
	public String manageNotice(Model model) {
		return "admin/manageNotice";
	}
	//공지사항관리  조회Ajax
	@RequestMapping("/getManageNoticeListAjax")
	@ResponseBody
	public List<NoticeVO> getManageNoticeListAjax(NoticeVO vo) {
		return adminService.getManageNoticeList(vo);
	}
	//공지사항관리 삭제Ajax
	@RequestMapping("/deleteNoticeAjax")
	@ResponseBody
	public NoticeVO deleteNoticeAjax(NoticeVO vo) {
		noticeService.deleteNotice(vo);
		return vo;
	}
	
	//1:1문의글 관리
	@RequestMapping(value = "/manageQna", method = RequestMethod.GET)
	public String manageQna(Model model) {
		return "admin/manageQna";
	}
	//공지사항관리  조회Ajax
	@RequestMapping("/getManageQnaListAjax")
	@ResponseBody
	public List<QnaVO> getManageQnaListAjax(QnaVO vo) {
		return adminService.getManageQnaList(vo);
	}
	//공지사항관리 삭제Ajax
	@RequestMapping("/deleteQnaAjax")
	@ResponseBody
	public QnaVO deleteQnaAjax(QnaVO vo) {
		qnaService.deleteQna(vo);
		return vo;
	}

}
