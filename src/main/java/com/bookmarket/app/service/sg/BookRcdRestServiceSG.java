package com.bookmarket.app.service.sg;

import com.bookmarket.app.dto.sg.BookSG;

public interface BookRcdRestServiceSG {
	Boolean isDupRcdExistByDay(BookSG book, String userId);
	int insert(int bookId, String userId);
}
