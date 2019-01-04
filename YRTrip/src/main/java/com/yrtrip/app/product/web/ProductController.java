package com.yrtrip.app.product.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yrtrip.app.Paging;
import com.yrtrip.app.order.OrderService;
import com.yrtrip.app.order.OrderVO;
import com.yrtrip.app.product.CartService;
import com.yrtrip.app.product.CartVO;
import com.yrtrip.app.product.ProductService;
import com.yrtrip.app.product.ProductVO;
import com.yrtrip.app.user.MyPageService;
import com.yrtrip.app.user.UserService;
import com.yrtrip.app.user.UserVO;

@Controller
public class ProductController {
	
	@Autowired ProductService productService;
	@Autowired CartService cartService;
	@Autowired OrderService orderService;
	@Autowired UserService userService;
	@Autowired MyPageService mypageService;
	//전체조회(폼)
	@RequestMapping("/getProductList")
	public ModelAndView getProductList(Paging paging, ProductVO vo) {
		ModelAndView mv = new ModelAndView();
		// 페이징 처리
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(9);
		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		// 전체 건수
		paging.setTotalRecord(productService.getCount(vo));

		mv.addObject("paging", paging);
		mv.addObject("productList", productService.getProductList(vo));
		mv.setViewName("product/getProductList");
		return mv;
	}
	//퀵뷰
	@RequestMapping("getProductAjax")
	@ResponseBody
	public ProductVO getProduct(ProductVO vo) {
		return productService.getProduct(vo);
	}
	
	//상세조회(폼)
	@RequestMapping("/getProduct")
	public String getProduct(Model model, ProductVO vop, OrderVO voo) {
		ProductVO vo = new ProductVO();
		vo.setSellerId(vop.getSellerId());
		System.out.println(vo.getSellerId());

		model.addAttribute("product", productService.getProduct(vop));
		//model.addAttribute("getSellerList", mypageService.getMyProductList(vo));
		model.addAttribute("order", orderService.getOrder(voo));
		return "product/getProduct";
	}
	@RequestMapping("infofordelete")
	@ResponseBody
	public int inforForDelete(ProductVO vo) {
		return productService.getOrderConditionforDelete(vo);
	}
	//제품등록폼
	@RequestMapping(value="/insertProduct", method=RequestMethod.GET)
	public String insertProductForm() {
		return "product/insertProduct";
	}
	
	//제품등록처리
	@RequestMapping(value="/insertProduct", method=RequestMethod.POST)
	public String insertProduct(Model model, ProductVO vo, HttpServletRequest request, MultipartFile[] productPicFile) throws IllegalStateException, IOException{
		
		String path = request.getSession().getServletContext().getRealPath("/images/product");
		
		String fileOriginName = "";
		String fileMultiName = "";
		
		for(int i=0; i<productPicFile.length; i++) {
			fileOriginName = productPicFile[i].getOriginalFilename();
			System.out.println("기존 파일명 : " + fileOriginName);
			SimpleDateFormat formatter = new SimpleDateFormat("YYMMDD_"+i);
			Calendar now = Calendar.getInstance();
			
			String extension = fileOriginName.split("\\.")[1];
			
			fileOriginName = formatter.format(now.getTime())+"."+extension;
			System.out.println("변경된 파일명 : "+fileOriginName);
			
			File f = new File(path+"\\"+fileOriginName);
			productPicFile[i].transferTo(f);
			if(i==0) {fileMultiName += fileOriginName;}
			else {fileMultiName += "," +fileOriginName;}
			
		}
		System.out.println(fileMultiName);
		vo.setItemPic(fileMultiName);

		productService.insertProduct(vo);
		return "redirect:getProductList";
	}
	
	//제품수정 폼
	@RequestMapping(value="/updateProduct", method=RequestMethod.GET)
	public String updateProductForm(Model model, ProductVO vo) {
		model.addAttribute("product", productService.getProduct(vo));
		return "product/updateProduct";
		
	}
	//제품수정처리
	@RequestMapping(value="/updateProduct", method = RequestMethod.POST)
	public String updateProduct(ProductVO vo){
		productService.updateProduct(vo);
		return "redirect:getProductList"; 
		//자기 상품페이지 화면으로 가기~
		//자기가 올린 상품페이지 바로 보여주는게 좋을까
	}
	
	//제품 단건 삭제
	@RequestMapping("deleteProduct")
	public String deleteProduct(ProductVO vo) {
		productService.deleteProduct(vo);
		return "redirect:getProductList";
	}
	/*//주문서 뷰(purchasingProduct.jsp)
	@RequestMapping("/purchasingProductView")
	public String purchasingProductForm(ProductVO vo) {
		return "product/purchasingProduct";
	}*/
	//주문서 폼 : 회원정보 select, 아이템정보 select, cart select
	@RequestMapping("/purchasingProduct")
	public String purchasingProductForm(Model model, CartVO voc, UserVO vou, HttpSession session) {		
		
		vou.setUserId(((UserVO)session.getAttribute("login")).getUserId());
		UserVO uservo = userService.getUser(vou);
		
		voc.getCartId();
		System.out.println(voc.getCartId());
		
		model.addAttribute("cart", cartService.getCart(voc));
		model.addAttribute("userPur", uservo);
		return "product/purchasingProduct";
	}
		//주문서 수정(은 안되게 하는 걸로...)
		
		//주문서 삭제(는 따로 필요없을듯 뒤로가기나 취소 누르면 작성내용 다 사라지는걸루)
		
		//주문서 조회(는 주문서 완료후 myPage에서 주문내역에서 볼수 있도록)
	
		
	//장바구니 폼(조회, 찜 목록 이랑 비슷)
	@RequestMapping("/getCartList")
	public String getCartListForm(Model model, CartVO vo, ProductVO vop, HttpSession session) {		
		System.out.println(vo.getCartId());
		System.out.println(vo.getItemId());
		vo.setMyId(((UserVO)session.getAttribute("login")).getUserId());
		model.addAttribute("cartList", cartService.getCartList(vo));
		
	/*	//vop.setItemId(vo.getItemId());
		//System.out.println(vop.getItemId());
		model.addAttribute("product", productService.getProduct(vop));*/
		
		return "product/getCartList";
	}
	
	/*@RequestMapping(value="/getCartList", method=RequestMethod.POST)
	public String getCartListForm(Model model, CartVO vo, @RequestParam String myId) {
		model.addAttribute("myId", myId);
		return "redirect:getCartList";
	}*/
	
	//뷰안에 넣을 컬럼값들이 없으면 뷰에 redirect해도 안나오나...? 그래서 그런건가...
	//장바구니 insert 처리
	@RequestMapping("/insertCart")
	public String insertCart(CartVO vo) {
		cartService.insertCart(vo);
		return "redirect:getCartList";
	}
	//장바구니 수정 처리 : itemEa, cartid,
	@RequestMapping("/updateCart")
	public String updateCart(CartVO vo) {
		cartService.updateCart(vo);
		return "redirect:getCartList";
	}
	//장바구니 삭제 처리 : cartid
	@RequestMapping("/deleteCart")
	public String deleteCart(CartVO vo) {
		cartService.deleteCart(vo);
		return "redirect:getCartList";
	}
	
	
  
}
