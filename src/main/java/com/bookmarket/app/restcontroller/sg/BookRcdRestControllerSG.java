package com.bookmarket.app.restcontroller.sg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.service.sg.BookRcdRestServiceSG;

import jakarta.servlet.http.HttpSession;

@RestController
public class BookRcdRestControllerSG {
	@Autowired
	private BookRcdRestServiceSG bookRcdRestService;

	@PostMapping("/bookRcd/chkIsRcdExist")
	public Boolean chkIsRcdExist(@RequestBody BookSG reqBook, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		return bookRcdRestService.isDupRcdExistByDay(reqBook, userId);
	}
	
	@PostMapping("/bookRcd/insert")
	public int insert(@RequestBody BookSG reqBook, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		
		if (userId.equals("admin")) {
			return -1;
		}
		
		return bookRcdRestService.insert(reqBook.getBookId(), userId);
	}
}