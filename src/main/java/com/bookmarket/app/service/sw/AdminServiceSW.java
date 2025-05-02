package com.bookmarket.app.service.sw;

import java.util.List;
import java.util.Map;

import com.bookmarket.app.dto.sw.BookSW;

public interface AdminServiceSW {

	List<BookSW> getList(int offset, int pageSize);
	int approveBook(int bsrId);
	int rejectBook(Map<String, Object> param);
	int getPendingBookCount();
	

}
