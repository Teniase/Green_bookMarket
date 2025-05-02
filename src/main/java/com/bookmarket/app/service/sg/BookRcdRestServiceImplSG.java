package com.bookmarket.app.service.sg;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookRecommendationSG;
import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.mapper.sg.BookMapperSG;
import com.bookmarket.app.mapper.sg.BookRecommendationMapperSG;

@Service("BookRcdRestServiceImplSG")
public class BookRcdRestServiceImplSG implements BookRcdRestServiceSG {
	@Autowired
	private BookRecommendationMapperSG bookRcdMapper;

	@Override
	public Boolean isDupRcdExistByDay(BookSG book, String userId) {
		Map<String, Object> map = new HashMap<>();

		LocalDateTime currentDateTime = LocalDateTime.now();
		int curYear = currentDateTime.getYear();
		int curMonth = currentDateTime.getMonthValue();
		int curDay = currentDateTime.getDayOfMonth();
		String curDate = curYear + "-" + curMonth + "-" + curDay;

		map.put("userId", userId);
		map.put("bookId", book.getBookId());
		map.put("curDate", curDate);

		BookRecommendationSG bookRcd = bookRcdMapper.selectByUserIdAndBookIdAndCurDay(map);

		if (bookRcd != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int insert(int bookId, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("bookId", bookId);
		map.put("userId", userId);

		int result = 0;
		result = bookRcdMapper.insert(map);
		return result;
	}
}
