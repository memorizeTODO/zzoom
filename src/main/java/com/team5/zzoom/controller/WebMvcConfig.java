package com.team5.zzoom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private SessionCheckInterceptor interceptor;
	private AdminSessionCheckInterceptor adminInterceptor;
	
	//인터셉터가 동작할 url 설정--> 추후 다른 곳도 추가 할수 있음
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/myPage")
		.addPathPatterns("/myPageEdit")
		.addPathPatterns("/deleteForm")
		.addPathPatterns("/delete")
		.addPathPatterns("/member_logout")
		.addPathPatterns("/inquiryform")
		.addPathPatterns("/inquirydetail")
		.addPathPatterns("/inquiryUpdate")
		.addPathPatterns("/inquiryDelete")
		.addPathPatterns("/inquirylist")
		.addPathPatterns("/admin/**");
		
		registry.addInterceptor(adminInterceptor)
				.excludePathPatterns("/admin/**");

		
	}
}
