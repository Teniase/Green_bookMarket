package com.bookmarket.app.service.sg;

import com.bookmarket.app.dto.sg.BookSG;

public interface BookRestServiceSG {
	Boolean incBookRcdCnt(int bookId);
	BookSG select(int bookId);
}
