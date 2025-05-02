package com.bookmarket.app.service.sw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;
import com.bookmarket.app.mapper.sw.BookMapperSW;
import com.bookmarket.app.mapper.sw.BookSellRequestMapperSW;


@Service
public class BookServiceImplSW implements BookServiceSW {

	@Autowired
	private BookMapperSW bms;

	@Override
	public int insertBook(Map<String, Object> map) {
		
		return bms.insertBook(map);
	}

	@Override
	public BookSW selectIsbn(String bookIsbn) {
		// TODO Auto-generated method stub
		return bms.selectIsbn(bookIsbn);
	}

	@Override
	public int getBookCount(String keyword) {
		
		return bms.getBookCount(keyword);
	}

	@Override
	public List<BookSW> getBookStockList(String keyword, int offset, int pageSize) {
		 Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("keyword", keyword);
		paramMap.put("offset", offset);
		paramMap.put("limit", pageSize);
		return bms.getBookStockList(paramMap);
	}

	@Override
	public void increaseStock(int bookId, int odrCnt) {
		
		bms.increaseStock(bookId, odrCnt);
	}

	@Override
	public int update(BookSW book) {
	
		return bms.update(book);
	}

	@Override
	public int delete(int bookId) {
	
		return bms.delete(bookId);
	}



}
