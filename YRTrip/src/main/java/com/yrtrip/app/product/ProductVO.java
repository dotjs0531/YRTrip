package com.yrtrip.app.product;

import org.springframework.web.multipart.MultipartFile;

import com.yrtrip.app.like.LikeVO;

public class ProductVO extends LikeVO{
	private int itemId;
	private String itemName;
	private int itemPrice;
	private int itemEa;
	private String itemContent;
	private String itemMethod;
	private String itemCategory;
	private String sellerId;
	private String itemOrderdetail;
	private float itemStar;
	private String itemPic;
	private MultipartFile[] productPicFile;
	private String itemDate;
	private String itemCondition;
	private int itemLike;
	
	//private String sortCol; // 정렬

	private String searchCondition; //
	private String searchClass;
	private String searchKeyword; // 검색키워드
	
	//선택삭제
	private String[] itemNoList;
	
	//페이징 처리 
	private int first;
	private int last; 
	//deleteinfo 삭제를 위해가져오는 정보들이 몇개있는지 넣는 주머니
	private int deleteinfo;
		
	public int getDeleteinfo() {
		return deleteinfo;
	}
	public void setDeleteinfo(int deleteinfo) {
		this.deleteinfo = deleteinfo;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchClass() {
		return searchClass;
	}
	public void setSearchClass(String searchClass) {
		this.searchClass = searchClass;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemEa() {
		return itemEa;
	}
	public void setItemEa(int itemEa) {
		this.itemEa = itemEa;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	public String getItemMethod() {
		return itemMethod;
	}
	public void setItemMethod(String itemMethod) {
		this.itemMethod = itemMethod;
	}
	public String getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}	
	public String getItemOrderdetail() {
		return itemOrderdetail;
	}
	public void setItemOrderdetail(String itemOrderdetail) {
		this.itemOrderdetail = itemOrderdetail;
	}
	public float getItemStar() {
		return itemStar;
	}
	public void setItemStar(float itemStar) {
		this.itemStar = itemStar;
	}
	public String getItemPic() {
		return itemPic;
	}
	public void setItemPic(String itemPic) {
		this.itemPic = itemPic;
	}
	
	public MultipartFile[] getProductPicFile() {
		return productPicFile;
	}
	public void setProductPicFile(MultipartFile[] productPicFile) {
		this.productPicFile = productPicFile;
	}
	public String getItemDate() {
		return itemDate;
	}
	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
	}
	public String getItemCondition() {
		return itemCondition;
	}
	public void setItemCondition(String itemCondition) {
		this.itemCondition = itemCondition;
	}
	public int getItemLike() {
		return itemLike;
	}
	public void setItemLike(int itemLike) {
		this.itemLike = itemLike;
	}	
	
	public String[] getItemNoList() {
		return itemNoList;
	}
	public void setItemNoList(String[] itemNoList) {
		this.itemNoList = itemNoList;
	}
	
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "ProductVO [itemId=" + itemId + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", itemEa="
				+ itemEa + ", itemContent=" + itemContent + ", itemMethod=" + itemMethod + ", itemCategory="
				+ itemCategory + ", sellerId=" + sellerId + ", itemAvailable=" + itemOrderdetail + ", itemStar="
				+ itemStar + ", itemPic=" + itemPic + ", itemDate=" + itemDate + ", itemCondition=" + itemCondition
				+ ", itemLike=" + itemLike + "]";
	}
}
