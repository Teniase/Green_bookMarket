package com.bookmarket.app.service.sw;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookmarket.app.dto.sw.BookPublisherSW;
import com.bookmarket.app.mapper.sw.PubMapperSW;

@Service
public class BookPublisherServiceImplSW implements BookPublisherServiceSW {
	@Autowired 
	private PubMapperSW pms;

	@Override
	public BookPublisherSW select(Integer pubId) {
		// TODO Auto-generated method stub
		return pms.select(pubId);
	}

	@Override
	public BookPublisherSW selectEmail(String pubEmail) {
		
		return pms.selectEmail(pubEmail);
	}

	@Override
	public int insert(BookPublisherSW bookPub) {
	
		return pms.insert(bookPub);
	}

	@Override
	public int update(BookPublisherSW bookPub) {
		
		return pms.update(bookPub);
	}

	@Override
	public int delete(String pubId) {
		// TODO Auto-generated method stub
		return pms.delete(pubId);
	}

	@Override
	public List<BookPublisherSW> selectlist() {
		
		return pms.selectlist();
	}

	@Override
	public List<BookPublisherSW> getPubList(int pubOffset, int pageSize,  boolean hideWithdrawn, String searchType, String keyword) {
		Map<String, Object> paramMap = new HashMap<>();
		  paramMap.put("offset", pubOffset);
		  paramMap.put("limit", pageSize);
		  paramMap.put("hideWithdrawn", hideWithdrawn);
		  paramMap.put("searchType", searchType);
		  paramMap.put("keyword", keyword);
		return  pms.getPubList(paramMap);
	}

	@Override
	public int getPubCount(boolean hideWithdrawn,String searchType, String keyword ) {
		Map<String, Object> paramMap = new HashMap<>();
		  paramMap.put("hideWithdrawn", hideWithdrawn);
		  paramMap.put("searchType", searchType);
		  paramMap.put("keyword", keyword);
		return pms.getPubCount(paramMap);
	}


}
