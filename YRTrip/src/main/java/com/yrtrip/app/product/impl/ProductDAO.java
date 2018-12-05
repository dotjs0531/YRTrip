package com.yrtrip.app.product.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private final String PRODUCT_INSERT = "insert into itemt(item_id, item_name, item_price, item_price, "
															+ "item_ea, item_content, item_method, "
															+ "item_category, seller_id, item_oderdetail, item_star, "
															+ "item_pic, item_date, item_condition, item_like) "
															+ "values()";
	private final String PRODUCT_LIST = "select ";
}
