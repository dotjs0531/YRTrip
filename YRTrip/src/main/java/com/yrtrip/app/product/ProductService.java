package com.yrtrip.app.product;

import java.util.List;

public interface ProductService {
	public void insertProduct(ProductVO vo);
	public void updateProduct(ProductVO vo);
	public int getOrderConditionforDelete(ProductVO vo);
	public void deleteProduct(ProductVO vo);
	public ProductVO getProduct(ProductVO vo);
	public List<ProductVO> getProductList(ProductVO vo);
	public int getCount(ProductVO vo);
}
