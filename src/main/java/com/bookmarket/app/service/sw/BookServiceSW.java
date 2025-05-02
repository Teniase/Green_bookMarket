package com.bookmarket.app.service.sw;

import java.util.List;
import java.util.Map;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;

public interface BookServiceSW {

	int insertBook(Map<String, Object> map);
	BookSW selectIsbn(String bookIsbn);
	int getBookCount(String keyword);
	List<BookSW> getBookStockList(String keyword, int offset, int pageSize);
	void increaseStock(int bookId, int odrCnt);
	int update(BookSW book);
	int delete(int bookId);



}
