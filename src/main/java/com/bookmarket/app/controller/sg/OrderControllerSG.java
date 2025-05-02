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
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.service.sg.OrderServiceSG;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderControllerSG {
	@Autowired
	private OrderServiceSG orderService;
	
	@GetMapping("/order/requestOrders")
	public String getRequestOrdersForm(@RequestParam("page") int page, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		if (userId == null || userId.equals("")) {
			return "redirect:/login/selectLoginForm";
		}
		
		List<BookSG> reqOrderBookList = new ArrayList<>();
		List<OrderSG> reqOrderList = new ArrayList<>();
		
		int total = orderService.getReqOdrTotalByUserId(userId);
		PagingData pgData = new PagingData(total, 5, 5, page);
		
		reqOrderBookList = orderService.getReqOrderBookList(pgData, userId);
		reqOrderList = orderService.getReqOrderList(pgData, userId);
		//Nevertheless the server can handle this process, for server performance, hand over to the client.
		model.addAttribute("pgData", pgData);
		model.addAttribute("reqOrderList", reqOrderList);
		model.addAttribute("reqOrderBookList", reqOrderBookList);
		return "order/requestOrders";
	}
	
	@GetMapping("/order/acceptedOrders")
	public String getAcceptedOrdersForm(@RequestParam("page") int page, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		if (userId == null || userId.equals("")) {
			return "redirect:/login/selectLoginForm";
		}
		
		List<BookSG> acptedOrderBookList = new ArrayList<>();
		List<OrderSG> acptedOrderList = new ArrayList<>();
		
		int total = orderService.getAcptedOdrTotalByUserId(userId);
		PagingData pgData = new PagingData(total, 5, 5, page);
		
		acptedOrderBookList = orderService.getAcptedOrderBookList(pgData, userId);
		acptedOrderList = orderService.getAcptedOrderList(pgData, userId);
		//Nevertheless the server can handle this process, for server performance, hand over to the client.
		model.addAttribute("pgData", pgData);
		model.addAttribute("acptedOrderBookList", acptedOrderBookList);
		model.addAttribute("acptedOrderList", acptedOrderList);
		return "order/acceptedOrders";
	}
	
/*	@PostMapping("/order/cancelOrder")
	public String cancelOrder(@RequestParam("page") int page, OrderSG reqOrder, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		if (userId == null || userId.equals("")) {
			return "redirect:/login/selectLoginForm";
		}
		
		int result = orderService.updateByUserId(reqOrder, userId);
		
		int total = orderService.getReqOdrTotalByUserId(userId);
		PagingData pgData = new PagingData(total, 5, 5, page);
		
		model.addAttribute("page", pgData.getPage());
		model.addAttribute("result", result);
		return "order/orderCancelResult";
	}*/
	
}