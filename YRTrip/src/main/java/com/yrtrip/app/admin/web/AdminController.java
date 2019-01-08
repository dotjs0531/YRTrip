package com.yrtrip.app.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yrtrip.app.Paging;
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
	@RequestMapping("/deleteUserAjax")
	@ResponseBody
	public UserVO deleteUserAjax(UserVO vo) { //회원 삭제Ajax
		userService.deleteUser(vo);
		return vo;
	}
	@RequestMapping("/getUserListAjax")
	@ResponseBody
	public List<UserVO> getUserList(UserVO vo) { //회원 조회Ajax
		return userService.getUserList(vo);
	}
	@RequestMapping(value="/getUserListPaging", method = RequestMethod.POST)
	@ResponseBody
	public Map getUserListPaging(UserVO vo, Paging paging) { //거래관리 페이징처리
		HashMap map = new HashMap();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
      
		paging.setPageUnit(10);
      
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
      
		paging.setTotalRecord(userService.getUserCount(vo));

		map.put("paging", paging);
		map.put("muserList", userService.getUserList(vo));

		return map;
	}
		
	//거래관리
	@RequestMapping(value = "/manageProduct", method = RequestMethod.GET)
	public String manageProduct(Model model) {
		return "admin/manageProduct";
	}
	@RequestMapping("/getManageProductListAjax")
	@ResponseBody
	public List<ProductVO> getManageProductListAjax(ProductVO vo) { //거래관리 - 상품관리 조회Ajax
		vo.setFirst(1);
		vo.setLast(10);
		return adminService.getManageProductList(vo);
	}
	@RequestMapping("/deleteProductAjax")
	@ResponseBody
	public ProductVO deleteProductAjax(ProductVO vo) { //거래관리 - 상품관리 삭제Ajax
		productService.deleteProduct(vo);
		return vo;
	}
	@RequestMapping(value="/getManageProductListPaging", method = RequestMethod.POST)
	@ResponseBody
	public Map getManageProductListPaging(ProductVO vo, Paging paging) { //거래관리 - 상품관리 페이징처리
		HashMap map = new HashMap();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
      
		paging.setPageUnit(10);
      
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
      
		paging.setTotalRecord(adminService.getManageProductCount(vo));

		map.put("paging", paging);
		map.put("mproductList", adminService.getManageProductList(vo));

		return map;
	}
	
	@RequestMapping(value = "/manageOrder", method = RequestMethod.GET)
	public String manageOrder(Model model, OrderVO vo) { //거래관리 - 주문내역관리
		model.addAttribute("manageOrder", orderService.getOrderList(vo));
		return "admin/manageOrder";
	}
	@RequestMapping("/getManageOrderListAjax")
	@ResponseBody
	public List<OrderVO> getManageOrderListAjax(OrderVO vo) { //거래관리 - 주문내역관리 조회Ajax
		return adminService.getManageOrderList(vo);
	}
	@RequestMapping("getManageOrder")
	@ResponseBody
	public OrderVO getManageOrder(OrderVO vo) { //거래관리 - 주문내역 상세보기
		return adminService.getManageOrder(vo);
	}
	@RequestMapping(value="/getManageOrderListPaging", method = RequestMethod.POST)
	@ResponseBody
	public Map getManageOrderListPaging(OrderVO vo, Paging paging) { //거래관리 페이징처리
		HashMap map = new HashMap();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
      
		paging.setPageUnit(10);
      
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
      
		paging.setTotalRecord(adminService.getManageOrderCount(vo));

		map.put("paging", paging);
		map.put("morderList", adminService.getManageOrderList(vo));

		return map;
	}
	
	//동행관리
	@RequestMapping(value = "/managePartner", method = RequestMethod.GET)
	public String managePartner(Model model) {
		return "admin/managePartner";
	}
	@RequestMapping("/getManagePartnerListAjax")
	@ResponseBody
	public List<PartnerVO> getManagePartnerListAjax(PartnerVO vo) { //동행관리  조회Ajax
		return adminService.getManagePartnerList(vo);
	}
	@RequestMapping("/deletePartnerAjax")
	@ResponseBody
	public PartnerVO deletePartnerAjax(PartnerVO vo) { //동행관리 삭제Ajax
		partnerService.deletePartner(vo);
		return vo;
	}
	@RequestMapping(value="/getManagePartnerListPaging", method = RequestMethod.POST)
	@ResponseBody
	public Map getManagePartnerListPaging(PartnerVO vo, Paging paging) { //동행관리 페이징처리
		HashMap map = new HashMap();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
      
		paging.setPageUnit(10);
      
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
      
		paging.setTotalRecord(adminService.getManagePartnerCount(vo));

		map.put("paging", paging);
		map.put("mpartnerList", adminService.getManagePartnerList(vo));

		return map;
	}
	
	//여행관리
	@RequestMapping(value = "/manageTravel", method = RequestMethod.GET)
	public String manageTravel(Model model) {
		return "admin/manageTravel";
	}
	@RequestMapping("/getManageTravelListAjax")
	@ResponseBody
	public List<TravelBoardVO> getManageTravelListAjax(TravelBoardVO vo) { //여행관리  조회Ajax
		return adminService.getManageTravelList(vo);
	}
	@RequestMapping("/deleteTravelAjax")
	@ResponseBody
	public TravelBoardVO deleteTravelAjax(TravelBoardVO vo) { //여행관리 삭제Ajax
		travelBoardService.deleteTravelBoard(vo);
		return vo;
	}
	@RequestMapping(value="/getManageTravelListPaging", method = RequestMethod.POST)
	@ResponseBody
	public Map getManageTravelListPaging(TravelBoardVO vo, Paging paging) { //여행관리 페이징처리
		HashMap map = new HashMap();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
      
		paging.setPageUnit(10);
      
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
      
		paging.setTotalRecord(adminService.getManageTravelCount(vo));

		map.put("paging", paging);
		map.put("mtravelList", adminService.getManageTravelList(vo));

		return map;
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
	@RequestMapping(value = "/manageChart2", method = RequestMethod.GET)
	public String manageChart2(Model model) {
		return "admin/chart2";
	}
	@RequestMapping(value = "/getSellerChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getSellerChart(@RequestParam String day) {
		return adminService.getSellerChart(day);
	}
	@RequestMapping(value = "/manageChart3", method = RequestMethod.GET)
	public String manageChart3(Model model) {
		return "admin/chart3";
	}
	@RequestMapping(value = "/getDayChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getDayChart(@RequestParam String day) {
		return adminService.getDayChart(day);
	}
	@RequestMapping(value = "/manageChart4", method = RequestMethod.GET)
	public String manageChart4(Model model) {
		return "admin/chart4";
	}
	@RequestMapping(value = "/getTimeChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getTimeChart(@RequestParam String day) {
		return adminService.getTimeChart(day);
	}
	@RequestMapping(value = "/manageChart5", method = RequestMethod.GET)
	public String manageChart5(Model model) {
		return "admin/chart5";
	}
	@RequestMapping(value = "/getOrderPriceChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Map> getOrderPriceChart(@RequestParam String day) {
		return adminService.getOrderPriceChart(day);
	}
	@RequestMapping(value = "/manageChart6", method = RequestMethod.GET)
	public String manageChart6(Model model) {
		return "admin/chart6";
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
	@RequestMapping("/getManageNoticeListAjax")
	@ResponseBody
	public List<NoticeVO> getManageNoticeListAjax(NoticeVO vo) { //공지사항관리  조회Ajax
		return adminService.getManageNoticeList(vo);
	}
	@RequestMapping("/deleteNoticeAjax")
	@ResponseBody
	public NoticeVO deleteNoticeAjax(NoticeVO vo) { //공지사항관리 삭제Ajax
		noticeService.deleteNotice(vo);
		return vo;
	}
	@RequestMapping(value="/getManageNoticeListPaging", method = RequestMethod.POST)
	@ResponseBody
	public Map getManageNoticeListPaging(NoticeVO vo, Paging paging) { //공지사항관리 페이징처리
		HashMap map = new HashMap();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
      
		paging.setPageUnit(10);
      
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
      
		paging.setTotalRecord(adminService.getManageNoticeCount(vo));

		map.put("paging", paging);
		map.put("mnoticeList", adminService.getManageNoticeList(vo));

		return map;
	}
	
	//1:1문의글 관리
	@RequestMapping(value = "/manageQna", method = RequestMethod.GET)
	public String manageQna(Model model) {
		return "admin/manageQna";
	}
	@RequestMapping("/getManageQnaListAjax")
	@ResponseBody
	public List<QnaVO> getManageQnaListAjax(QnaVO vo) { //1:1문의글 관리  조회Ajax
		return adminService.getManageQnaList(vo);
	}
	@RequestMapping("/deleteQnaAjax")
	@ResponseBody
	public QnaVO deleteQnaAjax(QnaVO vo) { //1:1문의글 관리 삭제Ajax
		qnaService.deleteQna(vo);
		return vo;
	}
	@RequestMapping(value="/getManageQnaListPaging", method = RequestMethod.POST)
	@ResponseBody
	public Map getManageQnaListPaging(QnaVO vo, Paging paging) { //1:1문의글 관리 페이징처리
		HashMap map = new HashMap();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
      
		paging.setPageUnit(10);
      
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
      
		paging.setTotalRecord(adminService.getManageQnaCount(vo));

		map.put("paging", paging);
		map.put("mqnaList", adminService.getManageQnaList(vo));

		return map;
	}

}
