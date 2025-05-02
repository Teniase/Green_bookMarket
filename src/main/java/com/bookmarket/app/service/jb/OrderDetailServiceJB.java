package com.bookmarket.app.service.jb;

import java.util.List;

import com.bookmarket.app.dto.jb.OrderDetailJB;

public interface OrderDetailServiceJB {

	List<OrderDetailJB> getOrderdetails(int orderId);
	
	void bookStock(OrderDetailJB detail);

	int getOrderDetailCount(int orderId);
	List<OrderDetailJB> getPagedOrderDetails(int orderId, int startRow, int endRow);
}
