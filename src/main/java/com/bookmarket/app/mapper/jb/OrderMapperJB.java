package com.bookmarket.app.mapper.jb;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;

import com.bookmarket.app.dto.jb.OrderJB;

@Mapper
public interface OrderMapperJB {

	OrderJB getOrder(String userId);
	void payComp(@Param("orderId") int orderId, @Param("paymentKey") String paymentKey);
	void updateOrder(int orderId, String status);
	List<OrderJB> getAllOrders();
	void updateOrder(Map<String, Object> paramMap);
	int getUserOrderCount(String userId);
	List<OrderJB> getUserOrders(Map<String, Object> paramMap);
	OrderJB getOrderById(int orderId);
	void cancelOrder(int orderId);
	List<OrderJB> getAllOrders(Map<String, Object> paramMap);
	Integer getOrderCount(Map<String, Object> paramMap);
	

}
