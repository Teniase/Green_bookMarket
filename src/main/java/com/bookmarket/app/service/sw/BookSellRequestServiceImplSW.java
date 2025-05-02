package com.bookmarket.app.service.sw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.mapper.sw.BookSellRequestMapperSW;

@Service
public class BookSellRequestServiceImplSW implements BookSellRequestServiceSW {

	@Autowired
	BookSellRequestMapperSW bms;
	
	@Override
	public List<Map<String, Object>> myRequests(Integer pubId, int offset, int pageSize) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("pubId", pubId);
		paramMap.put("offset", offset);  // (page - 1) * pageSize
		paramMap.put("limit", pageSize);
		return bms.myRequests(paramMap);
	}

	@Override
	public int getRequsetBookCount(Integer pubId) {
		
		return bms.getRequsetBookCount(pubId);
	}

}
