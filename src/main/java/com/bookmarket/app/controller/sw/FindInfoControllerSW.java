package com.bookmarket.app.controller.sw;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.bookmarket.app.dto.sw.BookPublisherSW;
import com.bookmarket.app.dto.sw.UserSW;

import com.bookmarket.app.service.sw.FindInfoServiceSW;
import com.bookmarket.app.service.sw.UserServiceSW;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Controller
public class FindInfoControllerSW {
	    @Autowired
	    private FindInfoServiceSW fis;

	    @Autowired
	    private JavaMailSender jms; // 메일 전송기
	    
	    @Autowired
		private BCryptPasswordEncoder bpe; //암호화

	    @PostMapping("/findInfo/findUserId")
	    @ResponseBody
	    public String findUserId(UserSW user) {
	    
	        // 이름과 이메일로 유저 조회
	        UserSW user2 = fis.selectId(user);

	        if (user2 == null) {
	            return "입력하신 이름과 이메일이 일치하는 계정이 없습니다.";
	        }

	        try {
	            MimeMessage message = jms.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	            helper.setTo(user.getUserEmail()); // 파라미터에서 받은 userEmail 사용
	            helper.setFrom("bookmarket123@naver.com");
	            helper.setSubject("북마켓 아이디 찾기 결과");
	            helper.setText("<h3>요청하신 아이디는 다음과 같습니다:</h3><p><b>"
	                           + user2.getUserId() + "</b></p>", true);

	            jms.send(message);
	            return "입력하신 이메일로 아이디를 전송했습니다.";

	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return "메일 전송 중 오류가 발생했습니다.";
	        }
	    }
	    
	    @PostMapping("/findInfo/findPubId")
	    @ResponseBody
	    public String findPubId(BookPublisherSW bookPub) {
	    
	        // 이름과 이메일로 유저 조회
	    	BookPublisherSW bookPub2 = fis.selectPubId(bookPub);

	        if (bookPub2 == null) {
	            return "입력하신 이름과 이메일이 일치하는 계정이 없습니다.";
	        }

	        try {
	            MimeMessage message = jms.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	            helper.setTo(bookPub.getPubEmail());
	            helper.setFrom("bookmarket123@naver.com");
	            helper.setSubject("북마켓 아이디 찾기 결과");
	            helper.setText("<h3>요청하신 아이디는 다음과 같습니다:</h3><p><b>"
	                           + bookPub2.getPubId() + "</b></p>", true);

	            jms.send(message);
	            return "입력하신 이메일로 아이디를 전송했습니다.";

	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return "메일 전송 중 오류가 발생했습니다.";
	        }
	    }

	    @PostMapping("/findInfo/findUserPw")
	    @ResponseBody
	    public String findUserPW(UserSW user) {

	        UserSW user2 = fis.selectPw(user); // 동일한 메서드 재사용

	        if (user2 == null) {
	            return "입력하신 정보와 일치하는 계정이 없습니다.";
	        }

	        
	        String randomPass = UUID.randomUUID().toString().substring(0,8); //랜덤 8자 패스워드발행
			String setPass = bpe.encode(randomPass); //랜덤8자 패스워드 암호
			user2.setUserPw(setPass); // DTO에 암호화 비번 세팅
			fis.updatePW(user2); // ✅ 실제 DB 반영
	        // 3. 이메일 전송
	        try {
	            MimeMessage message = jms.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	            helper.setTo(user.getUserEmail());
	            helper.setFrom("bookmarket123@naver.com");
	            helper.setSubject("북마켓 임시 비밀번호 안내");
	            helper.setText("<h3>임시 비밀번호가 발급되었습니다.</h3><p><b>"
	                           + randomPass + "</b></p><br/><p>로그인 후 비밀번호를 꼭 변경해주세요.</p>", true);

	            jms.send(message);
	            return "입력하신 이메일로 임시 비밀번호를 전송했습니다.";
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return "메일 전송 중 오류가 발생했습니다.";
	        }
	    	
	    }
  
	    
	    @PostMapping("/findInfo/findPubPw")
	    @ResponseBody
	    public String findPubPW(BookPublisherSW bookPub) {

	    	BookPublisherSW bookPub2 = fis.selectPubPw(bookPub); 
	    	
	        if (bookPub2 == null) {
	            return "입력하신 정보와 일치하는 계정이 없습니다.";
	        }
	 
	        String randomPass = UUID.randomUUID().toString().substring(0,8); //랜덤 8자 패스워드발행
			String setPass = bpe.encode(randomPass); //랜덤8자 패스워드 암호
			bookPub2.setPubPw(setPass); // DTO에 암호화 비번 세팅
			fis.updatePubPW(bookPub2); // ✅ 실제 DB 반영
	        // 3. 이메일 전송
	        try {
	            MimeMessage message = jms.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	            helper.setTo(bookPub.getPubEmail());
	            helper.setFrom("bookmarket123@naver.com");
	            helper.setSubject("북마켓 임시 비밀번호 안내");
	            helper.setText("<h3>임시 비밀번호가 발급되었습니다.</h3><p><b>"
	                           + randomPass + "</b></p><br/><p>로그인 후 비밀번호를 꼭 변경해주세요.</p>", true);

	            jms.send(message);
	            return "입력하신 이메일로 임시 비밀번호를 전송했습니다.";
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return "메일 전송 중 오류가 발생했습니다.";
	        }
	    	
	    }
	    
	  
  
	@GetMapping("/findInfo/findIdForm")
	public String findIdForm() {
		return "/findInfo/findIdForm";
	}
	
	@GetMapping("/findInfo/findPwForm")
	public String findPwForm() {
		return "/findInfo/findPwForm";
	}
	

}
