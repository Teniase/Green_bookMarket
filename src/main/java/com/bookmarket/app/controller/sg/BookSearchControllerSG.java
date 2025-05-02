package com.bookmarket.app.controller.sg;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.service.sg.BookSearchServiceSG;

@Controller
public class BookSearchControllerSG {
	@Autowired
	private BookSearchServiceSG bookSearchService;

	@GetMapping("/search/books")
	public String getBooksByKeyWord(@RequestParam("keyword") String keyword, @RequestParam("page") int page, Model model) {
		List<BookSG> bookList = new ArrayList<>();
		int byKwOnSaleTaggedBookTotal = bookSearchService.getByKwOnSaleTaggedBookTotal(keyword);
		PagingData pgData = new PagingData(byKwOnSaleTaggedBookTotal, 15, 10, page);

		bookList = bookSearchService.getByKwOnSaleTaggedBooks(pgData, keyword);

		model.addAttribute("keyword", keyword);
		model.addAttribute("bookList", bookList);
		model.addAttribute("pgData", pgData);
		return "/booksearch/bookSearchList";
	}
}
