package com.bookmarket.app.controller.sw;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookmarket.app.dto.sg.BookSG;
import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSmallCaregorySW;
import com.bookmarket.app.dto.sw.UserSW;
import com.bookmarket.app.service.sg.BookRestServiceSG;
import com.bookmarket.app.service.sw.BookServiceSW;
import com.bookmarket.app.service.sw.BookSmallCaregoryServiceSW;

import jakarta.servlet.http.HttpSession;

@Controller

public class AdminBookContollerSW {

	@Autowired
	private BookServiceSW bs;
	
	@Autowired
	private BookRestServiceSG brs;
	
    @Autowired
    private BookSmallCaregoryServiceSW bsc;  

	@GetMapping("/admin/bookStock")
	public String BookStock(
		    @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "keyword", required = false) String keyword,
			Model model)
	
		{
		
		 int pageSize = 10;
	      int offset = (page - 1) * pageSize;

	        // 검색 및 페이징된 도서 리스트
	        List<BookSW> bookList = bs.getBookStockList(keyword, offset, pageSize);
	        int totalBooks = bs.getBookCount(keyword);
	        int totalPages = (int) Math.ceil((double) totalBooks / pageSize);

	        model.addAttribute("bookList", bookList);
	        model.addAttribute("currentPage", page);
	        model.addAttribute("totalPages", totalPages);
	        model.addAttribute("keyword", keyword);

	        return "/admin/bookStock";
	}
	
	@GetMapping("/bookdetail/bookDetailUpdateForm")
	public String bookDetailUpdateForm(@RequestParam("bookId") int bookId, Model model) {
	    BookSG book = brs.select(bookId); // bookId로 책 하나 가져오기
	    List<BookSmallCaregorySW> smallCategoryList = bsc.select();
	    // 돌아가기 URL 설정
	    String backUrl = "/detail/books?id=" + bookId; // or 다른 네가 원하는 목록 페이지 주소
	    model.addAttribute("backUrl", backUrl);
	    model.addAttribute("book", book);
	    model.addAttribute("smallCategoryList", smallCategoryList);
	    return "/bookdetail/bookDetailUpdateForm";
	}
	
	
	@PostMapping("/bookdetail/bookDetailUpdate")
	public void userUpdate(BookSW book, Model model, 
	                       @RequestParam("uploadImg") MultipartFile uploadImg,
	                       @RequestParam("originImg") String originImg,
	                       HttpSession session) {
	    if (!uploadImg.isEmpty()) {
	        try {
	        	String uploadDir = "C:\\spring\\sts4Src\\bookmarket\\uploads\\bookImage";
	            String originalName = uploadImg.getOriginalFilename();
	            String safeName = originalName.replaceAll("\\s+", "_"); // 공백 제거
	            String uuid = UUID.randomUUID().toString();
	            String newFileName = uuid + "_" + safeName;

	            File saveFile = new File(uploadDir, newFileName);
	            uploadImg.transferTo(saveFile);

	            book.setBookImg("/uploads/bookimage/" + newFileName);
	        } catch (IOException e) {
	            e.printStackTrace();
	            model.addAttribute("result", 0);
	        }
	    } else {
	        // 파일 업로드 안 했으면 기존 이미지 유지
	        book.setBookImg(originImg);
	    }
	    
	    int result = bs.update(book);
	    model.addAttribute("bookId", book.getBookId());
	    model.addAttribute("result", result);
	}
	
	@GetMapping("/bookdetail/bookDelete") 
	public void userDelete(@RequestParam("bookId") int bookId, Model model, HttpSession session ) {
		int result = 0;
		result = bs.delete(bookId);
		if (result > 0) {
		}
			
		model.addAttribute("result", result);
	}
	
	
	
}
