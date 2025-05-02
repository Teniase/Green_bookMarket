package com.bookmarket.app.service.sg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.mapper.sg.BookMapperSG;

@Service("BookCategoryServiceImplSG")
public class BookCategoryServiceImplSG implements BookCategoryServiceSG {
	@Autowired
	private BookMapperSG bookMapper;
	
	@Override
	public int getCategoryBookTotal(int bscId) {
		return bookMapper.getCategoryBookTotal(bscId);
	}

	@Override
	public List<BookSG> getCategoryBookList(PagingData pgData, int bscId) {
		Map<String, Object> map = new HashMap<>();
		map.put("startIdx", pgData.getStartIdx() + 1);
		map.put("endIdx", pgData.getEndIdx() + 1);
		map.put("bscId", bscId);
		
		return bookMapper.getCategoryBookList(map);
	}
}
