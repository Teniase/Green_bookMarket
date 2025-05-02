package com.bookmarket.app.restcontroller.sg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.CartSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.service.sg.CartRestServiceSG;

import jakarta.servlet.http.HttpSession;

@RestController
public class CartRestControllerSG {
	private final static int LIMIT_CART_NUM = 15;
	
	@Autowired
	private CartRestServiceSG cartRestService;

	@PostMapping("/cart/deleteBook")
	public Boolean deleteBook(@RequestBody CartSG reqCart) {
		Boolean result = null;

		CartSG cart = cartRestService.select(reqCart.getCartId());
		cart.setCartDel("y");
		int updateResult = cartRestService.update(cart);

		if (updateResult > 0) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}

	@GetMapping("/cart/totalOrderPrice")
	public int getMethodName(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		return cartRestService.getNotDelTotalOrderPriceByUserId(userId);
	}

	@PostMapping("/cart/updateCartBookCnt")
	public Map<String, Object> updateCartBookCnt(@RequestBody CartSG reqCart, HttpSession session) {
		Map<String, Object> map = new HashMap<>();

		String userId = (String) session.getAttribute("userId");

		CartSG cart = cartRestService.select(reqCart.getCartId());
		cart.setBookCnt(reqCart.getBookCnt());

		int updateResult = 0;
		updateResult = cartRestService.update(cart);

		int totalOrderPrice = cartRestService.getNotDelTotalOrderPriceByUserId(userId);

		map.put("totalOrderPrice", totalOrderPrice);
		map.put("bookCnt", reqCart.getBookCnt());
		return map;
	}

	@PostMapping("/cart/cartData")
	public Map<String, Object> getCartData(@RequestBody PagingData reqPgData, HttpSession session) {
		Map<String, Object> map = new HashMap<>();

		String userId = (String) session.getAttribute("userId");
		int total = cartRestService.getNotDelBookTotalByUserId(userId);
		PagingData pgData = new PagingData(total, 5, 5, reqPgData.getPage());

		List<BookSG> bookList = new ArrayList<>();
		bookList = cartRestService.getNotDelCartBookListByUserId(pgData, userId);

		map.put("bookList", bookList);
		map.put("pgData", pgData);
		map.put("isSuccess", true);
		return map;
	}

	@PostMapping("/cart/addBook")
	public int addBook(@RequestBody CartSG reqCart, HttpSession session) {
		int result = 0;
		String userId = (String) session.getAttribute("userId");

		Boolean isDupBookExist = cartRestService.isNotDelBookDupExist(reqCart.getBookId(), userId);

		if (isDupBookExist) {
			result = 0;
		} else {
			int total = cartRestService.getNotDelTotalByUserId(userId);
			if (total >= LIMIT_CART_NUM) {
				return -1;
			} 
			else if (userId.equals("admin")) {
				return -2;
			}
			else {
				reqCart.setUserId(userId);
				int insertResult = cartRestService.insert(reqCart);
				
				if (insertResult > 0) {
					result = 1;
				} else {
					result = -3;
				}
			}
		}

		return result;
	}
}