package com.bookmarket.app.service.sg;

import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.OrderSG;
import com.bookmarket.app.dto.sg.PagingData;

public interface OrderServiceSG {
	int insert(OrderSG order);
	OrderSG select(int id);
	int getOrderTotal();
	int getReqOdrTotalByUserId(String userId);
	List<BookSG> getReqOrderBookList(PagingData pgData, String userId);
	List<OrderSG> getReqOrderList(PagingData pgData, String userId);
	int getAcptedOdrTotalByUserId(String userId);
	List<BookSG> getAcptedOrderBookList(PagingData pgData, String userId);
	List<OrderSG> getAcptedOrderList(PagingData pgData, String userId);
	int updateByUserId(OrderSG order, String userId);
}
