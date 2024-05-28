package com.team5.zzoom.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Configuration
public class SessionCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		if (member_id == null || member_id.equals("")) {
			response.sendRedirect("login"); // 세션이 종료되면 로그인 폼으로 이동한다.
			System.out.println("Active Interceptor");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest reqeust, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(reqeust, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest reqeust, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(reqeust, response, handler, ex);
	}

}
