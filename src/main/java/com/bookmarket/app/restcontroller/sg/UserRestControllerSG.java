package com.bookmarket.app.restcontroller.sg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bookmarket.app.service.sg.UserRestServiceSG;

import jakarta.servlet.http.HttpSession;

@RestController
public class UserRestControllerSG {
	@Autowired
	private UserRestServiceSG userRestSerivce;
	@GetMapping("/user/chkIsUser")
	public Boolean chkIsUser(HttpSession session) {
		return userRestSerivce.isUser(session);
	}
}
