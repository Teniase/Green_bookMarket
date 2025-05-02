package com.bookmarket.app.service.sg;

import com.bookmarket.app.dto.sg.BookSG;

public interface BookDetailServiceSG {
	BookSG getOnSaleTaggedBook(int bookId);
}
