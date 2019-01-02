package com.yrtrip.app.admin;

import java.util.List;
import java.util.Map;

import com.yrtrip.app.notice.NoticeVO;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.partner.PartnerVO;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.qna.QnaVO;
import com.yrtrip.app.travel.TravelBoardVO;

public interface AdminService {
	
	public List<Map> getTinfoChart(String day);	
	public List<ProductVO> getManageProductList(ProductVO vo);
	public List<OrderVO> getManageOrderList(OrderVO vo);
	public List<PartnerVO> getManagePartnerList(PartnerVO vo);
	public List<TravelBoardVO> getManageTravelList(TravelBoardVO vo);
	public List<NoticeVO> getManageNoticeList(NoticeVO vo);
	public List<QnaVO> getManageQnaList(QnaVO vo);
}
