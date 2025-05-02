package com.bookmarket.app.service.sg;

import jakarta.servlet.http.HttpSession;

public interface UserRestServiceSG {
	Boolean isUser(HttpSession session);
}
