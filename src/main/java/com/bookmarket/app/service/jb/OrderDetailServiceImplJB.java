package com.bookmarket.app.service.jb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.jb.OrderDetailJB;
import com.bookmarket.app.mapper.jb.OrderDetailMapperJB;

@Service("OrderDetailServiceImplJB")
public class OrderDetailServiceImplJB implements OrderDetailServiceJB {

	@Autowired
	private OrderDetailMapperJB odrMapper;
	
	@Override
	public List<OrderDetailJB> getOrderdetails(int orderId) {
		return odrMapper.getOrderdetails(orderId);
	}
	@Override
	public void bookStock(OrderDetailJB detail) {
		odrMapper.bookStock(detail);
		
	}
	@Override
	public int getOrderDetailCount(int orderId) {
	    return odrMapper.getOrderDetailCount(orderId);
	}

	@Override
	public List<OrderDetailJB> getPagedOrderDetails(int orderId, int startRow, int endRow) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("orderId", orderId);
	    params.put("startRow", startRow);
	    params.put("endRow", endRow);
	    return odrMapper.getPagedOrderDetails(params);
	}

}
