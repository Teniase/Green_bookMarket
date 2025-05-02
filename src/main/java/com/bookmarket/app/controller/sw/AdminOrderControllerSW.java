package com.bookmarket.app.controller.sw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookmarket.app.dto.jb.OrderDetailJB;
import com.bookmarket.app.dto.jb.OrderJB;
import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.service.jb.OrderDetailServiceJB;
import com.bookmarket.app.service.jb.OrderServiceJB;

@Controller
public class AdminOrderControllerSW {
	@Autowired
	private OrderServiceJB osj;

	@Autowired
	private OrderDetailServiceJB ods;

	@GetMapping("/admin/orderList")
	public String getOrderListForAdmin(
	        @RequestParam(name = "page", defaultValue = "1") int page,
	        @RequestParam(name = "keyword", required = false) Integer keyword,
	        Model model) {

	    int pageSize = 10;
	    int offset = (page - 1) * pageSize;
	    int safeKeyword = (keyword == null) ? 0 : keyword;

	    int totalOrders = osj.getOrderCount(safeKeyword);
	    int totalPages = (int) Math.ceil((double) totalOrders / pageSize);

	    List<OrderJB> orderList = osj.getAllOrders(safeKeyword, offset, pageSize);

	    model.addAttribute("orderList", orderList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("keyword", keyword); // 검색어 유지용

	    return "admin/orderList";
	}


	@PostMapping("/admin/approveOrder")
	@ResponseBody
	public ResponseEntity<?> approveOrder(@RequestParam("orderId") int orderId) {
		osj.updateOrder(orderId, "배송중");
		return ResponseEntity.ok().body("승인 완료");
	}

	@GetMapping("/admin/orderDetail")
	@ResponseBody
	public Map<String, Object> getOrderDetail(@RequestParam("orderId") int orderId) {
		OrderJB order = osj.getOrderById(orderId);
		List<OrderDetailJB> details = ods.getOrderdetails(orderId);

		String orderName = "";
		int totalPrice = 0;
		int totalBookCnt = 0;

		if (details.size() == 1) {
			OrderDetailJB d = details.get(0);
			orderName = d.getBookName() + " " + d.getOdrCnt() + "권";
			totalPrice = d.getBookPrice() * d.getOdrCnt();
		} else if (details.size() > 1) {
			for (OrderDetailJB d : details) {
				totalPrice += d.getBookPrice() * d.getOdrCnt();
				totalBookCnt += d.getOdrCnt();
			}
			orderName = details.get(0).getBookName() + " 외 " + (totalBookCnt - 1) + "권";
		}

		Map<String, Object> result = new HashMap<>();
		result.put("orderId", order.getOrderId());
		result.put("userId", order.getUserId());
		result.put("orderDate", order.getOrderDate());
		result.put("orderName", orderName);
		result.put("totalPrice", totalPrice);

		return result;
	}

}
