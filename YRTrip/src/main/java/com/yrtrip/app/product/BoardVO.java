package com.yrtrip.app.product;

public class BoardVO {
	private int item_id;
	private String item_name;
	private int item_price;
	private int item_ea;
	private String item_content;
	private String item_method;
	private String item_category;
	private String seller_id;
	private String item_orderdetail;
	private int item_star;
	private String item_pic;
	private String item_date;
	private String item_condition;
	private int item_like;
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_ea() {
		return item_ea;
	}
	public void setItem_ea(int item_ea) {
		this.item_ea = item_ea;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public String getItem_method() {
		return item_method;
	}
	public void setItem_method(String item_method) {
		this.item_method = item_method;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getItem_orderdetail() {
		return item_orderdetail;
	}
	public void setItem_orderdetail(String item_orderdetail) {
		this.item_orderdetail = item_orderdetail;
	}
	public int getItem_star() {
		return item_star;
	}
	public void setItem_star(int item_star) {
		this.item_star = item_star;
	}
	public String getItem_pic() {
		return item_pic;
	}
	public void setItem_pic(String item_pic) {
		this.item_pic = item_pic;
	}
	public String getItem_date() {
		return item_date;
	}
	public void setItem_date(String item_date) {
		this.item_date = item_date; 
	}
	public String getItem_condition() {
		return item_condition;
	}
	public void setItem_condition(String item_condition) {
		this.item_condition = item_condition;
	}
	public int getItem_like() {
		return item_like;
	}
	public void setItem_like(int item_like) {
		this.item_like = item_like;
	}
	
	@Override
	public String toString() {
		return "BoardVO [item_id=" + item_id + ", item_name=" + item_name + ", item_price=" + item_price + ", item_ea="
				+ item_ea + ", item_content=" + item_content + ", item_method=" + item_method + ", item_category="
				+ item_category + ", seller_id=" + seller_id + ", item_orderdetail=" + item_orderdetail + ", item_star="
				+ item_star + ", item_pic=" + item_pic + ", item_date=" + item_date + ", item_condition="
				+ item_condition + ", item_like=" + item_like + "]";
	}	
}
