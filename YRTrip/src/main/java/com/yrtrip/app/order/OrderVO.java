package com.yrtrip.app.order;

import org.springframework.web.multipart.MultipartFile;

import com.yrtrip.app.product.ProductVO;

public class OrderVO extends ProductVO {
	//거래내역 테이블
	private String orderId;			//거래번호(201812**-0001)
	private String orderDate;		//거래일자
	private String orderCondition;	//거래상태(결제완료/거래완료/거래취소)
	private String orderDelivery;	//배송상태(배송준비중,배송중,배송완료)
	private int orderPrice;			//구매금액
	private int orderEa;			//구매수량
	private int itemId;				//상품ID
	private String buyerId;			//구매자ID
	private String itemDeliveryno;	//송장번호(생략가능-배송중일 경우 입력)
	private String orderPost; 		//우편번호
	private String orderAddress;	//주소

	private String[] orderNoList;	//거래내역 선택삭제
	
	//리뷰 테이블
	private float reviewStar;				//리뷰 별점
	private String reviewContent;			//리뷰 내용
	private String reviewDate;				//리뷰 등록일
	private String reviewPic;				//리뷰 사진
	private MultipartFile[] reviewPicFile;	//실제 이미지 파일(다중파일 업로드)
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderCondition() {
		return orderCondition;
	}
	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}
	public String getOrderDelivery() {
		return orderDelivery;
	}
	public void setOrderDelivery(String orderDelivery) {
		this.orderDelivery = orderDelivery;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getOrderEa() {
		return orderEa;
	}
	public void setOrderEa(int orderEa) {
		this.orderEa = orderEa;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getItemDeliveryno() {
		return itemDeliveryno;
	}
	public void setItemDeliveryno(String itemDeliveryno) {
		this.itemDeliveryno = itemDeliveryno;
	}	
	public String getOrderPost() {
		return orderPost;
	}
	public void setOrderPost(String orderPost) {
		this.orderPost = orderPost;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress2(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String[] getOrderNoList() {
		return orderNoList;
	}
	public void setOrderNoList(String[] orderNoList) {
		this.orderNoList = orderNoList;
	}
	
	public float getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(float reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewPic() {
		return reviewPic;
	}
	public void setReviewPic(String reviewPic) {
		this.reviewPic = reviewPic;
	}
	public MultipartFile[] getReviewPicFile() {
		return reviewPicFile;
	}
	public void setReviewPicFile(MultipartFile[] reviewPicFile) {
		this.reviewPicFile = reviewPicFile;
	}
	
}
