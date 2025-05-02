package com.bookmarket.app.service.sg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.mapper.sg.BookMapperSG;

@Service("BookRestServiceImplSG")
public class BookRestServiceImplSG implements BookRestServiceSG {
	@Autowired
	private BookMapperSG bookMapper;

	@Override
	public Boolean incBookRcdCnt(int bookId) {
		BookSG book = bookMapper.select(bookId);
		book.setBookRcdCnt(book.getBookRcdCnt() + 1);
		
		int result = 0;
		result = bookMapper.update(book);
		
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public BookSG select(int bookId) {
		return bookMapper.select(bookId);
	}
}
