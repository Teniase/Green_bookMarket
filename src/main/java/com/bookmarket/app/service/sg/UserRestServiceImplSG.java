package com.bookmarket.app.service.sg;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service("UserRestServiceImplSG")
public class UserRestServiceImplSG implements UserRestServiceSG {
	@Override
	public Boolean isUser(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		Boolean result = null;
		
		if (userId == null || userId.equals("")) {
			result = false;
		} else {
			result = true;
		}
		
		return result;
	}
}