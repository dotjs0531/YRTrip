package com.yrtrip.app.product;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int itemId;
	private String itemName;
	private int itemPrice;
	private int itemEa;
	private String itemContent;
	private String itemMethod;
	private String itemCategory;
	private String sellerId;
	private String itemAvailable;
	private float itemStar;
	private String itemPic;
//	private MultipartFile productImgFile;
	private String itemDate;
	private String itemCondition;
	private int itemLike;
	
	//페이징 처리 
	private int first;
	private int last; 
	
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
	public String getItemAvailable() {
		return itemAvailable;
	}
	public void setItemAvailable(String itemAvailable) {
		this.itemAvailable = itemAvailable;
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
//	public MultipartFile getProductImgFile() {
//		return productImgFile;
//	}
//	public void setProductImgFile(MultipartFile productImgFile) {
//		this.productImgFile = productImgFile;
//	}
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
				+ itemCategory + ", sellerId=" + sellerId + ", itemAvailable=" + itemAvailable + ", itemStar="
				+ itemStar + ", itemPic=" + itemPic + ", itemDate=" + itemDate + ", itemCondition=" + itemCondition
				+ ", itemLike=" + itemLike + "]";
	}
}
