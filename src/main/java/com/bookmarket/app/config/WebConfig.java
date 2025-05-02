package com.bookmarket.app.config;

import java.util.concurrent.TimeUnit;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

	    // 기존 리소스 유지
	    registry.addResourceHandler("/resources/sw/userimage/**")
	            .addResourceLocations("file:///C:/spring/sts4Src/bookmarket/uploads/userimage/");

	    registry.addResourceHandler("/resources/sw/bookImg/**")
	            .addResourceLocations("file:///C:/spring/sts4Src/bookmarket/uploads/bookImage/");

	    // ✅ 새로 추가: 업로드 경로
	    registry.addResourceHandler("/uploads/**")
	            .addResourceLocations("file:///C:/spring/sts4Src/bookmarket/uploads/");
	    
	
	}

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
