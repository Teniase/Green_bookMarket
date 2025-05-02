package com.bookmarket.app.service.sg;

import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;

public interface CartServiceSG {
	int getNotDelBookTotalByUserId(String userId);
	List<BookSG> getNotDelCartBookListByUserId(PagingData pgData, String userId);
	List<BookSG> getOverOrZeroStockCartBooksByUserId(String userId);
	List<BookSG> getNotDelAllCartBooksByUserId(String userId);
	void clearCart(String userId);
}