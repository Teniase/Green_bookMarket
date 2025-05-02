package com.bookmarket.app.service.sg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.mapper.sg.BookMapperSG;

@Service("BookSearchServiceImplSG")
public class BookSearchServiceImplSG implements BookSearchServiceSG {
	@Autowired
	private BookMapperSG bookMapper;
	@Override
	public int getBookTotal() {
		return bookMapper.getTotal();
	}
	@Override
	public int getByKwOnSaleTaggedBookTotal(String keyword) {
		return bookMapper.getByKwOnSaleTaggedTotal(keyword);
	}
	@Override
	public List<BookSG> getByKwOnSaleTaggedBooks(PagingData pgData, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		map.put("keyword", keyword);
		return bookMapper.getByKwOnSaleTaggedList(map);
	}
}
