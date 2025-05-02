package com.bookmarket.app.controller.sw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookmarket.app.dto.sw.BookPublisherSW;
import com.bookmarket.app.dto.sw.UserSW;
import com.bookmarket.app.service.sw.BookPublisherServiceSW;

import jakarta.servlet.http.HttpSession;

@Controller
public class BookPublisherControllerSW {
	
@Autowired
private BookPublisherServiceSW bss;

@Autowired
private BCryptPasswordEncoder bpe;

@GetMapping("/login/pubLoginForm")
public String pubLoginForm() {
	return "/login/pubLoginForm";
}

@GetMapping("/join/pubJoinForm")
public String pubJoinForm() {
	return "/join/pubJoinForm";
}

@GetMapping("/update/pubUpdateForm")
public String pubUpdateForm(HttpSession session, Model model) {
	int pubId = (Integer) session.getAttribute("pubId");
	BookPublisherSW bookPub = bss.select(pubId);
	model.addAttribute("bookPub", bookPub);
	return "/update/pubUpdateForm";
}



/*
 * @GetMapping("/userlist/pubList") public void pubList(Model model) {
 * List<BookPublisherSW> pubList = bss.selectlist();
 * model.addAttribute("pubList", pubList); }
 */

@GetMapping("/userlist/pubDetail")
public void pubDetail(@RequestParam("pubId") Integer pubId, Model model) 
{
	BookPublisherSW bookPub = bss.select(pubId);
	model.addAttribute("bookPub", bookPub);
}



@PostMapping("/join/pubJoin")
public void pubJoin(BookPublisherSW bookPub, Model model) {
	int result = 0;
	 if(bss.select(bookPub.getPubId()) != null )  {
	    	result  = -1;
	    } else  {
	    	result = bss.insert(bookPub);
	    }
	
    model.addAttribute("result", result);
}

@PostMapping("/update/pubUpdate")
public void pubUpdate(BookPublisherSW bookPub, Model model, HttpSession session) {
    // 세션에서 현재 로그인된 출판사 ID 가져오기
	int pubId = (Integer) session.getAttribute("pubId");

    // 이메일 중복 검사 (본인 이메일 제외)
    BookPublisherSW bookPub2 = bss.selectEmail(bookPub.getPubEmail());
    
    if (bookPub2 != null && bookPub2.getPubId() != pubId) {
        model.addAttribute("result", -1); // 중복 이메일
        return; // 다시 폼으로 이동
    }

    // 업데이트 처리
    int result = bss.update(bookPub);
    model.addAttribute("result", result);
}

@PostMapping("/login/pubLogin")
public void pubLogin(BookPublisherSW bookPub, Model model, HttpSession session) {
	int result=0;
	BookPublisherSW bookPub2 = bss.select(bookPub.getPubId());
	if(bookPub2==null || bookPub2.getPubDel().equals("y")) {
		result = -1;
	} else if(bookPub2!=null)			 {
		 if(bookPub2.getPubPw().equals(bookPub.getPubPw()) || bpe.matches(bookPub.getPubPw(), bookPub2.getPubPw())) {
			 session.setAttribute("pubId", bookPub.getPubId());
			 
			 result = 1;
		 }
		 
		}
	  model.addAttribute("result", result);
	
			
}

@GetMapping("/update/pubDelete") 
public void pubDelete(@RequestParam("pubId") String pubId, Model model, HttpSession session) {
	int result = 0;
	result = bss.delete(pubId);
	if(result > 0) {
		session.invalidate();
	}
	model.addAttribute("result", result);
}

@PostMapping(value = "/pubIdDupChk",produces = "text/html;charset=utf-8" )  // 문자열로 존재 여부 판단
@ResponseBody
public String pubChk(@RequestParam("pubId") Integer pubId) {
	String data = "";
	BookPublisherSW bookPub = bss.select(pubId);
	if (bookPub == null) 
		data = "사용가능한 사업아이디입니다";
	else
		data ="사용중인 사업아이디입니다";
	return 
			data;
}

@PostMapping(value = "/pubEmailDupChk",produces = "text/html;charset=utf-8" )  // 문자열로 존재 여부 판단
@ResponseBody
public String pubChkEmail(@RequestParam("pubEmail") String pubEmail) {
	String data = "";
	BookPublisherSW bookPub = bss.selectEmail(pubEmail);
	if (bookPub == null) 
		data = "사용가능한 사업이메일입니다";
	else
		data ="사용중인 사업이메일입니다";
	return 
			data;
}

}
