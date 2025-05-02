package com.bookmarket.app.service.jb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bookmarket.app.dto.jb.OrderJB;
import com.bookmarket.app.mapper.jb.OrderMapperJB;

@Service("OrderServiceImplJB")
public class OrderServiceImplJB implements OrderServiceJB {
	@Autowired
	private OrderMapperJB odrMapper;

	@Override
	public OrderJB getOrder(String userId) {
		return odrMapper.getOrder(userId);
	}

	@Override
	public void payComp(int orderId, String paymentKey) {
		odrMapper.payComp(orderId, paymentKey);
		
	}

	@Override
	public void updateOrder(int orderId, String confirm) {
		 Map<String, Object> paramMap = new HashMap<>();
		 paramMap.put("orderId",  orderId);
		 paramMap.put("confirm", confirm);
		 odrMapper.updateOrder(paramMap);
	}

	@Override
	public List<OrderJB> getAllOrders(int keyword, int offset, int pageSize) {
		   Map<String, Object> paramMap = new HashMap<>();
		    paramMap.put("offset", offset);
		    paramMap.put("pageSize", pageSize);
		    if (keyword != 0) {
		        paramMap.put("keyword", keyword);
		    }

		return odrMapper.getAllOrders(paramMap);
	}

	@Override
	public List<OrderJB> getUserOrders(String userId, int offset, int pageSize) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("userId", userId);
	    paramMap.put("offset", offset);
	    paramMap.put("pageSize", pageSize); 

	    return odrMapper.getUserOrders(paramMap);
	   
	}
	@Override
	public int countUserOrders(String userId) {
	    return odrMapper.getUserOrderCount(userId);
	}

	@Override
	public OrderJB getOrderById(int orderId) {
		// TODO Auto-generated method stub
		return odrMapper.getOrderById(orderId);
	}

	@Override
	public void cancelOrder(int orderId) {
	
	   odrMapper.cancelOrder(orderId);	
	}

	@Override
	public int getOrderCount(int keyword) {
	    Map<String, Object> paramMap = new HashMap<>();
	    if (keyword != 0) {
	        paramMap.put("keyword", keyword);
	    }

	    // null 반환 시 0으로 처리
	    Integer result = odrMapper.getOrderCount(paramMap);
	    return (result != null) ? result : 0;
	}

}
