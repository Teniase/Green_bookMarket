package com.bookmarket.app.restcontroller.sg;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.service.sg.BookRestServiceSG;

import jakarta.servlet.http.HttpSession;

@RestController
public class BookRestControllerSG {
	@Autowired
	private BookRestServiceSG bookRestService;
	
	@PostMapping("/book/incBookRcdCnt")
	public Map<String, Object> incBookRcdCnt(@RequestBody BookSG reqBook, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Map<String, Object> map = new HashMap<>();
		   System.out.println("userId in session = " + userId);  
		if (userId.equals("admin")) {
			map.put("isSuccess", false);
			map.put("bookRcdCnt", -1);
		} else {
			Boolean isSuccess = bookRestService.incBookRcdCnt(reqBook.getBookId());
			BookSG book = bookRestService.select(reqBook.getBookId());
			map.put("isSuccess", isSuccess);
			map.put("bookRcdCnt", book.getBookRcdCnt());
		}
		return map;
	}
}
