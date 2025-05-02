package com.bookmarket.app.service.jb;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.bookmarket.app.dto.jb.OrderJB;

public interface OrderServiceJB {

	OrderJB getOrder(String userId);

	void payComp(int orderId, String paymentKey);
	void updateOrder(int orderId, String confirm);

	List<OrderJB> getAllOrders(int keyword, int offset, int pageSize);

	List<OrderJB> getUserOrders(String userId, int offset, int pageSize);
	int countUserOrders(String userId);

	OrderJB getOrderById(int orderId);

	void cancelOrder(int orderId);

	int getOrderCount(int keyword);


}
