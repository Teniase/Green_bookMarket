package com.bookmarket.app.service.sg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.mapper.sg.BookMapperSG;

@Service("BookDetailServiceImplSG")
public class BookDetailServiceImplSG implements BookDetailServiceSG {
	@Autowired
	private BookMapperSG bookMapper;

	@Override
	public BookSG getOnSaleTaggedBook(int bookId) {
		return bookMapper.selectByOnSaleTagged(bookId);
	}
}
