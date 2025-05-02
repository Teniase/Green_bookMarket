package com.bookmarket.app.controller.sw;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bookmarket.app.dto.jb.OrderDetailJB;
import com.bookmarket.app.dto.jb.OrderJB;
import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.UserSW;
import com.bookmarket.app.service.jb.OrderDetailServiceJB;
import com.bookmarket.app.service.jb.OrderServiceJB;
import com.bookmarket.app.service.sw.UserServiceSW;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserControllerSW {
	@Autowired
	private UserServiceSW uss;
	
	@Autowired
	private OrderDetailServiceJB odrDetailService;

	
	@Autowired
	private BCryptPasswordEncoder bpe;
	
	@Autowired
	 private OrderServiceJB osj;


	@GetMapping("/join/selectJoinForm")
	public String SelectJoinForm() {
		return "/join/selectJoinForm";
	}
	
	@GetMapping("/join/userJoinForm")
	public String userJoinForm() {
		return "/join/userJoinForm";
	}
	

	@GetMapping("/login/selectLoginForm")
	public String SelectLoginForm() {
		return "/login/selectLoginForm";
	}


	@GetMapping("/login/userLoginForm")
	public String userLoginForm() {
		return "/login/userLoginForm";
	}
	
	/*
	 * @GetMapping("/userlist/userList") public void userList(Model model) {
	 * List<UserSW> userList = uss.selectlist(); model.addAttribute("userList",
	 * userList); }
	 */
    
    @GetMapping("/userlist/userDetail") 
    public void userDetail(@RequestParam("userId") String userId, Model model) {
    	UserSW user = uss.select(userId);
    	model.addAttribute("user", user);

    }
    
	@GetMapping("/update/userUpdateForm")
	public String userUpdateForm(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		UserSW user = uss.select(userId);
		if (user.getUserImg()==null || user.getUserImg().equals("")) {
			user.setUserImg("default_profile.JPG");
		}
		model.addAttribute("user", user);
		return "/update/userUpdateForm";
	}
	
	@PostMapping("/update/userUpdate")
	public void userUpdate(UserSW user, Model model,
	                       @RequestParam("userUploadImg") MultipartFile userUploadImg,
	                       @RequestParam(value = "isReset", required = false) String isReset,
	                       HttpSession session) {
	    try {
	        String userId = (String) session.getAttribute("userId");

	        // 1. 기본 프로필로 초기화 요청
	        if ("true".equals(isReset)) {
	            user.setUserImg("default_profile.JPG");

	        // 2. 새 이미지 업로드한 경우
	        } else if (!userUploadImg.isEmpty()) {
	            String uploadDir = "C:\\spring\\sts4Src\\bookmarket\\uploads\\userimage";

	            String originalName = userUploadImg.getOriginalFilename();
	            String uuid = UUID.randomUUID().toString();
	            String newFileName = uuid + "_" + originalName;

	            File saveFile = new File(uploadDir, newFileName);
	            userUploadImg.transferTo(saveFile);

	            user.setUserImg(newFileName);

	        // 3. 아무것도 안 한 경우 (기존 이미지 유지)
	        } else {
	            UserSW existingUser = uss.select(userId);
	            user.setUserImg(existingUser.getUserImg());
	        }

	        // 이메일 중복 검사 (본인 이메일 제외)
	        UserSW user2 = uss.selectEmail(user.getUserEmail());
	        if (user2 != null && !user2.getUserId().equals(userId)) {
	            model.addAttribute("result", -1); // 이메일 중복
	            return;
	        }

	        // DB 업데이트
	        int result = uss.update(user);
	        model.addAttribute("result", result);

	     // 세션 값 갱신
	        if (user.getUserImg() != null && !user.getUserImg().isEmpty()) {
	            session.setAttribute("userImg", user.getUserImg());
	        } else {
	            session.setAttribute("userImg", "default_profile.JPG");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("result", 0);
	    }
	}

	
	
	@PostMapping("/login/userLogin")
	public void userLogin(UserSW user, Model model, HttpSession session) {
		int result = 0;
		UserSW user2 = uss.select(user.getUserId());

		if (user2 == null || "y".equals(user2.getUserDel())) {
			result = -1;
		} 
		// ✅ 암호화된 비밀번호 비교
		else if (
				user.getUserPw().equals(user2.getUserPw()) || bpe.matches(user.getUserPw(), user2.getUserPw()) 
			) {
			result = 1;
			session.setAttribute("userId", user2.getUserId());
			session.setAttribute("userImg", 
			user2.getUserImg() != null ? user2.getUserImg() : "default_profile.JPG");
		} 
		

		model.addAttribute("result", result);
	}
	
	@GetMapping("/login/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/login/logout";
	    
	}
	
	@PostMapping("/join/userJoin")
	public void userJoin(UserSW user, Model model) {
	     int result = 0;
	    if(uss.select(user.getUserId()) != null || uss.selectEmail(user.getUserEmail())!= null )  {
	    	result  = -1;
	    } else  {
	     result = uss.insert(user);
	    }
	     model.addAttribute("result", result);
	}
	
	@GetMapping("/update/userDelete") 
	public void userDelete(@RequestParam("userId") String userId, Model model, HttpSession session ) {
		int result = 0;
		result = uss.delete(userId);
		if (result > 0) {
			session.invalidate();
		}
			
		model.addAttribute("result", result);
	}
	
	

	@PostMapping(value = "/userIdDupChk",produces = "text/html;charset=utf-8" )  // 문자열로 존재 여부 판단
	@ResponseBody
	public String idChk(@RequestParam("userId") String userId) {
		String data = "";
		UserSW user = uss.select(userId);
		if (user == null) 
			data = "사용가능한 아이디 입니다";
		else
			data ="사용중인 아이디 입니다";
		return 
				data;
	}
	

	
	@PostMapping(value = "/userEmailDupChk",produces = "text/html;charset=utf-8" )  // 문자열로 존재 여부 판단
	@ResponseBody
	public String emialChk(@RequestParam("userEmail") String userEmail) {
		String data = "";
		UserSW user = uss.selectEmail(userEmail);
		if (user == null) 
			data = "사용가능한 이메일 입니다";
		else
			data ="사용중인 이메일 입니다";
		return 
				data;
	}
	
	@GetMapping("/order/userOrderList")
	public String getUserOrderList(HttpSession session, Model model,
	        @RequestParam(name = "page", defaultValue = "1") int page) {

	    String userId = (String) session.getAttribute("userId");
	    if (userId == null) {
	        return "redirect:/selectLoginForm";
	    }

	    // 페이지네이션
	    int pageSize = 10;
	    int offset = (page - 1) * pageSize;
	    int totalOrderCount = osj.countUserOrders(userId);
	    int totalPages = (int) Math.ceil((double) totalOrderCount / pageSize);

	    int blockSize = 5;
	    int startPage = ((page - 1) / blockSize) * blockSize + 1;
	    int endPage = Math.min(startPage + blockSize - 1, totalPages);
	    int prevPage = Math.max(startPage - 1, 1);
	    int nextPage = endPage + 1;

	    Map<String, Integer> pgData = new HashMap<>();
	    pgData.put("startPage", startPage);
	    pgData.put("endPage", endPage);
	    pgData.put("page", page);
	    pgData.put("prevPage", prevPage);
	    pgData.put("nextPage", nextPage);
	    pgData.put("maxPage", totalPages);
	    model.addAttribute("pgData", pgData);

	    // 주문 목록 + 요약 정보 묶기
	    List<OrderJB> userOrderList = osj.getUserOrders(userId, offset, pageSize);
	    List<Map<String, Object>> orderSummaries = new ArrayList<>();

	    for (OrderJB order : userOrderList) {
	        List<OrderDetailJB> details = odrDetailService.getOrderdetails(order.getOrderId());

	        String orderName = "";
	        int totalPrice = 0;
	        int totalBookCnt = 0;

	        if (details.size() == 1) {
	            OrderDetailJB d = details.get(0);
	            orderName = d.getBookName() + " " + d.getOdrCnt() + "권";
	            totalPrice = d.getBookPrice() * d.getOdrCnt();
	        } else if (details.size() > 1) {
	            for (OrderDetailJB d : details) {
	                totalPrice += d.getBookPrice() * d.getOdrCnt();
	                totalBookCnt += d.getOdrCnt();
	            }
	            orderName = details.get(0).getBookName() + " 외 " + (totalBookCnt - 1) + "권";
	        }

	        Map<String, Object> summary = new HashMap<>();
	        summary.put("order", order);
	        summary.put("orderName", orderName);
	        summary.put("totalPrice", totalPrice);
	        orderSummaries.add(summary);
	    }

	    model.addAttribute("orderSummaries", orderSummaries);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "/order/userOrderList";
	}



	
}
