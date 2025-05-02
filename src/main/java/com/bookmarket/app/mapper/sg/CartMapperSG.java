package com.bookmarket.app.mapper.sg;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.CartSG;

@Mapper
public interface CartMapperSG {
	CartSG selectNotDelByBookIdAndUserId(Map<String, Object> map);
	int insert(CartSG cart);
	int getTotal();
	int getNotDelTotalByUserId(String userId);
	List<BookSG> getNotDelCartBooksByUserId(Map<String, Object> map);
	CartSG select(int id);
	int update(CartSG cart);
	int getNotDelTotalOrderPriceByUserId(String userId);
	List<BookSG> getOverOrZeroStockCartBooksByUserId(String userId);
	List<BookSG> getNotDelAllCartBooksByUserId(String userId);
	void clearCart(String userId);
}
