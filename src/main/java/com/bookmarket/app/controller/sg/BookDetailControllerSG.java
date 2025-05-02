package com.bookmarket.app.controller.sg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.service.sg.BookDetailServiceSG;

@Controller
public class BookDetailControllerSG {
	@Autowired
	private BookDetailServiceSG bookDetailService;

	  @GetMapping("/detail/books")
	    public String getBookDetailForm(@RequestParam("id") int id,
	                                    @RequestParam(value = "bscId", required = false, defaultValue = "2") int bscId,
	                                    @RequestParam(value = "page", required = false, defaultValue = "1") int page,
	                                    Model model) {
	        // 도서 정보 조회
	        BookSG book = bookDetailService.getOnSaleTaggedBook(id);

	        // 이전 페이지로 돌아갈 URL 구성
	        String backUrl = "/book/category?bscId=" + bscId + "&page=" + page;

	        model.addAttribute("book", book);
	        model.addAttribute("backUrl", backUrl);

	        return "bookdetail/bookDetail";
	    }
}