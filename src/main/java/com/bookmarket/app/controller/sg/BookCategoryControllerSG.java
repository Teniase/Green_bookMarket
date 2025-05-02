package com.bookmarket.app.controller.sg;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sg.BookSmallCaregorySG;
import com.bookmarket.app.dto.sg.PagingData;
import com.bookmarket.app.service.sg.BookCategoryServiceSG;

@Controller
public class BookCategoryControllerSG {
	@Autowired
	private BookCategoryServiceSG bookCategoryService;
	
	@GetMapping("/book/category")
	public String getCategoryBooks(@ModelAttribute BookSmallCaregorySG reqBSC, @RequestParam("page") int page, Model model) {
		List<BookSG> categoryBookList = new ArrayList<>();
		
		int total = bookCategoryService.getCategoryBookTotal(reqBSC.getBscId());
		PagingData pgData = new PagingData(total, 15, 10, page);
		categoryBookList = bookCategoryService.getCategoryBookList(pgData, reqBSC.getBscId());
		
		model.addAttribute("pgData", pgData);
		model.addAttribute("categoryBookList", categoryBookList);
		model.addAttribute("bscId", reqBSC.getBscId());
		return "bookcategory/categoryBookList";
	}
}