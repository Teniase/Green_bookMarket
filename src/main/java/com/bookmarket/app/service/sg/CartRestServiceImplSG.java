package com.bookmarket.app.service.sg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.CartSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.mapper.sg.CartMapperSG;

@Service("CartRestServiceImplSG")
public class CartRestServiceImplSG implements CartRestServiceSG {
	@Autowired
	private CartMapperSG cartMapper;

	@Override
	public Boolean isNotDelBookDupExist(int bookId, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("bookId", bookId);
		map.put("userId", userId);
		CartSG cart = cartMapper.selectNotDelByBookIdAndUserId(map);
		
		if (cart != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int insert(CartSG cart) {
		return cartMapper.insert(cart);
	}

	@Override
	public int getTotal() {
		return cartMapper.getTotal();
	}

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
	public CartSG select(int id) {
		return cartMapper.select(id);
	}

	@Override
	public int update(CartSG cart) {
		return cartMapper.update(cart);
	}

	@Override
	public int getNotDelTotalOrderPriceByUserId(String userId) {
		return cartMapper.getNotDelTotalOrderPriceByUserId(userId);
	}

	@Override
	public int getNotDelTotalByUserId(String userId) {
		return cartMapper.getNotDelTotalByUserId(userId);
	}
}
