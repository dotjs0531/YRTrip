package com.yrtrip.app.admin;

import java.util.List;
import java.util.Map;

import com.yrtrip.app.notice.NoticeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.qna.QnaVO;
import com.yrtrip.app.travel.TravelBoardVO;
import com.yrtrip.app.user.UserVO;

public interface AdminService {
	
	public int totalOrderPrice(OrderVO vo);
	public int countOrderAmount(OrderVO vo);
	public int countTravelAmount(TravelBoardVO vo);
	public int countUserAmount(UserVO vo);
	public List<Map> getTinfoChart(String day);	
	public List<Map> getSellerChart(String day);	
	public List<Map> getDayChart(String day);	
	public List<Map> getTimeChart(String day);	
	public List<Map> getOrderPriceChart(String day);	
	public List<Map> getOrderIdChart(String day);	
	
	public List<ProductVO> getManageProductList(ProductVO vo);
	public int getManageProductCount(ProductVO vo);
	
	public List<OrderVO> getManageOrderList(OrderVO vo);
	public OrderVO getManageOrder(OrderVO vo);
	public int getManageOrderCount(OrderVO vo);
	
	public List<PartnerVO> getManagePartnerList(PartnerVO vo);
	public int getManagePartnerCount(PartnerVO vo);
	
	public List<TravelBoardVO> getManageTravelList(TravelBoardVO vo);
	public int getManageTravelCount(TravelBoardVO vo);
	
	public List<NoticeVO> getManageNoticeList(NoticeVO vo);
	public int getManageNoticeCount(NoticeVO vo);
	
	public List<QnaVO> getManageQnaList(QnaVO vo);
	public int getManageQnaCount(QnaVO vo);
}
