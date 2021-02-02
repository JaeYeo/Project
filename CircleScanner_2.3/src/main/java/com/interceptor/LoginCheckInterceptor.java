package com.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	// % loginCheck => 장바구니, 마이페이지, 장바구니 기능 등 회원 전용 메뉴에서 먼저 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("preHandle Activated =>");
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) { // 로그인 여부 검사 -> 세션에 DTO객체 유무 확인!
			response.sendRedirect("../"); // servlet-context.xml -> 로그인 페이지로 이동
			return false; // 로그인 (X) => 로그인 페이지 이동
		} else {
			return true; // 로그인 (O) => 회원 전용 기능 사용
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle Activated =>");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		System.out.println("afterCompletion Activated =>");
	}

}
