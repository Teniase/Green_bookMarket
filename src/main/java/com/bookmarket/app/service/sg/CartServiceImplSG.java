package com.bookmarket.app.service.sg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.mapper.sg.CartMapperSG;

@Service("CartServiceImplSG")
public class CartServiceImplSG implements CartServiceSG {
	@Autowired
	private CartMapperSG cartMapper;

	@Override
	public int getNotDelBookTotalByUserId(String userId) {
		return cartMapper.getNotDelTotalByUserId(userId);
	}

	@Override
	public List<BookSG> getNotDelCartBookListByUserId(PagingData pgData, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		map.put("userId", userId);
		return cartMapper.getNotDelCartBooksByUserId(map);
	}

	@Override
	public List<BookSG> getOverOrZeroStockCartBooksByUserId(String userId) {
		return cartMapper.getOverOrZeroStockCartBooksByUserId(userId);
	}

	@Override
	public List<BookSG> getNotDelAllCartBooksByUserId(String userId) {
		return cartMapper.getNotDelAllCartBooksByUserId(userId);
	}

	@Override
	public void clearCart(String userId) {
		cartMapper.clearCart(userId);
		
	}
}