package com.bookmarket.app.controller.sg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.CartSG;
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.service.sg.CartServiceSG;
import com.bookmarket.app.service.sg.OrderDetailServiceSG;
import com.bookmarket.app.service.sg.OrderServiceSG;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class CartControllerSG {
	@Autowired
	private CartServiceSG cartService;
	
	@Autowired
	private OrderServiceSG orderService;
	
	@Autowired
	private OrderDetailServiceSG orderDetailService;
	
	@GetMapping("/cart/cartForm")
	public String getCartForm() {
		return "cart/cartForm";
	}
	
	@PostMapping("/cart/orderBooks")
	public String orderBooks(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		
		List<BookSG> bookList = new ArrayList<>();
		bookList = cartService.getOverOrZeroStockCartBooksByUserId(userId);
		BookSG notPassedBook = null;
		int result = 0;
		
		if (bookList.isEmpty()) {
			List<BookSG> allBookList = new ArrayList<>();
			allBookList = cartService.getNotDelAllCartBooksByUserId(userId);
			
			Map<String, Object> map = new HashMap<>();
			map.put("allBookList", allBookList);
			map.put("userId", userId);
			int orderDetailResult = orderDetailService.insertBooks(map);
			
			result = orderDetailResult;
		} else {
			notPassedBook = bookList.get(0);
			if (notPassedBook.getBookStock() == 0) {
				result = 0;
			}
			else {
				result = -1;
			}
		}
		
		model.addAttribute("notPassedBook", notPassedBook);
		model.addAttribute("result", result);
		return "order/orderResult";
	}
}