package com.bookmarket.app.controller.jb;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.jb.OrderDetailJB;
import com.bookmarket.app.dto.jb.OrderJB;
import com.bookmarket.app.dto.jb.UserJB;
import com.bookmarket.app.service.jb.OrderDetailServiceJB;
import com.bookmarket.app.service.jb.OrderServiceJB;
import com.bookmarket.app.service.jb.UserServiceImplJB;
import com.bookmarket.app.service.sg.CartServiceSG;
import com.bookmarket.app.service.sw.BookServiceSW;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ControllerJB {
	@Autowired
	private OrderDetailServiceJB odrDetailService;

	@Autowired
	private OrderServiceJB orderService;

	@Autowired
	private UserServiceImplJB userService;
	
	@Autowired
	private CartServiceSG css;
	
	@Autowired
	private BookServiceSW bss;

	@GetMapping("/payment/checkout")
	public String payment(Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		String widgetClientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";

		UserJB user = userService.getUser(userId);
		String tel = user.getUserTel().replaceAll("-", "");
		user.setUserTel(tel);
		OrderJB order = orderService.getOrder(userId);
		List<OrderDetailJB> details = odrDetailService.getOrderdetails(order.getOrderId());

		int totalPrice = 0, totalBookCnt = 0;
		String orderName = "";

		if (details.size() == 1) {
			orderName = details.get(0).getBookName() + " " + details.get(0).getOdrCnt() + "권";
			totalPrice += details.get(0).getBookPrice() * details.get(0).getOdrCnt();
			totalBookCnt += details.get(0).getOdrCnt();
		} else {
			for (int i = 0; i < details.size(); i++) {
				totalPrice += details.get(i).getBookPrice() * details.get(i).getOdrCnt();
				totalBookCnt += details.get(i).getOdrCnt();
			}
			orderName = details.get(0).getBookName() + " 외 " + (totalBookCnt - 1) + "권";
		}

		// ✅ Toss용 고유 주문 ID 생성
		String payOrderId = "ORD-" + UUID.randomUUID().toString().substring(0, 8);

		model.addAttribute("totalBookCnt", totalBookCnt);
		model.addAttribute("payOrderId", payOrderId);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("order", order);
		model.addAttribute("details", details);
		model.addAttribute("user", user);
		model.addAttribute("orderName", orderName);
		model.addAttribute("widgetClientKey", widgetClientKey);

		return "/payment/checkout";
	}


	@GetMapping("/payment/success")
	public String success(Model model, HttpSession session, HttpServletRequest request) {
		String userId = (String) session.getAttribute("userId");
		UserJB user = userService.getUser(userId);

		OrderJB order = orderService.getOrder(userId);

		List<OrderDetailJB> details = odrDetailService.getOrderdetails(order.getOrderId());

		int totalBookCnt = 0;
		String orderName = "";
		for (OrderDetailJB detail :details  ) {
			odrDetailService.bookStock(detail); 
		}

		if (details.size() == 1) {
			orderName = details.get(0).getBookName() + " " + details.get(0).getOdrCnt() + "권";
		} else {
			for (int i = 0; i < details.size(); i++) {
				totalBookCnt += details.get(i).getOdrCnt();
				orderName = details.get(0).getBookName() + " 외 " + (totalBookCnt - 1) + "권";
			}
		}
		String paymentKey = request.getParameter("paymentKey");
		
		css.clearCart(userId); 
		
		
		model.addAttribute("orderName", orderName);
		model.addAttribute("order", order);
		model.addAttribute("user", user);

		// 결제 성공 저장
		orderService.payComp(order.getOrderId(), paymentKey);
		return "/payment/success";
	}

	@GetMapping("/payment/fail")
	public String fail() {
		return "/payment/fail";
	}

	@GetMapping("/admin/orderConfirmList")
	public String orderConfirmList(@RequestParam("page") int page, Model model, HttpSession session) {
		/*
		 * String userId = (String)session.getAttribute("userId"); if (userId == null ||
		 * userId.equals("")) { return "redirect:/login/selectLoginForm"; }
		 * 
		 * List<BookJB> reqOrderBookList = new ArrayList<>(); List<OrderJB> reqOrderList
		 * = new ArrayList<>();
		 * 
		 * int total = orderService.getReqOdrTotalByUserId(); // 갯수 채로 가져오기?
		 * 
		 * PagingData pgData = new PagingData(total, 5, 5, page);
		 * 
		 * reqOrderBookList = orderService.getReqOrderBookList(pgData, userId);
		 * reqOrderList = orderService.getReqOrderList(pgData, userId); //Nevertheless
		 * the server can handle this process, for server performance, hand over to the
		 * client. model.addAttribute("pgData", pgData);
		 * model.addAttribute("reqOrderList", reqOrderList);
		 * model.addAttribute("reqOrderBookList", reqOrderBookList);
		 */
		return "/admin/orderConfirmList";
	}

	
	@PostMapping("/order/cancelOrder")
	public String cancelOrder(
	    @RequestParam("orderId") int orderId,
	    @RequestParam("page") int page) {

	    // 1. 주문 상세 조회
	    List<OrderDetailJB> detailList = odrDetailService.getOrderdetails(orderId);

	    // 2. 주문에 포함된 도서 수량만큼 재고 복구
	    for (OrderDetailJB d : detailList) {
	        bss.increaseStock(d.getBookId(), d.getOdrCnt());
	    }

	    // 3. 주문 상태를 "취소"로 변경 or 삭제
	    orderService.cancelOrder(orderId);  

	    // 4. 다시 목록으로 리다이렉트
	    return "redirect:/order/requestOrders?page=" + page;
	}
}