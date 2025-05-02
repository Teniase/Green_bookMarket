package com.bookmarket.app.service.sg;

import java.util.List;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;

public interface BookCategoryServiceSG {
	int getCategoryBookTotal(int bscId);
	List<BookSG> getCategoryBookList(PagingData pgData, int bscId);
}
