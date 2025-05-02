package com.bookmarket.app.service.sg;

import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.CartSG;
import com.bookmarket.app.dto.sg.PagingData;

public interface CartRestServiceSG {
	Boolean isNotDelBookDupExist(int bookId, String userId);
	int insert(CartSG cart);
	int getTotal();
	int getNotDelBookTotalByUserId(String userId);
	List<BookSG> getNotDelCartBookListByUserId(PagingData pgData, String userId);
	CartSG select(int id);
	int update(CartSG cart);
	int getNotDelTotalOrderPriceByUserId(String userId);
	int getNotDelTotalByUserId(String userId);
}
