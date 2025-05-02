package com.bookmarket.app.controller.sg;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.service.sg.MainServiceSG;

@Controller
public class MainControllerSG {
	@Autowired
	private MainServiceSG mainService;
	
	@GetMapping("/")
	public String getMain(Model model) {
		Date todayDate = mainService.getTodayDate();
		Date prevWeekDate = mainService.getPrevWeekDate();
		List<BookSG> todayBestBookList = mainService.getTodayBestBooks(5);
		List<BookSG> weeklyBestBookList = mainService.getWeeklyBestBooks(5);
		
		model.addAttribute("todayDate", todayDate);
		model.addAttribute("prevWeekDate", prevWeekDate);
		model.addAttribute("todayBestBookList", todayBestBookList);
		model.addAttribute("weeklyBestBookList", weeklyBestBookList);
		return "main/main";
	}
}
