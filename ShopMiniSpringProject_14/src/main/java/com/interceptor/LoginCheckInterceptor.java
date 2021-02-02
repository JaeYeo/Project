package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	// /loginCheck/**	//장바구니, 마이페이지, 장바구니에서 삭제, 수량업데이트, 주문 등 회원전용 메뉴에서 선동작
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("prehandle동작=======");
		HttpSession session = request.getSession();
		if(session.getAttribute("login")==null) { //로그인 검사 ( 로그인시 세션에 넣어준 dto객체 존재여부 )
			System.out.println("로그인 되어있지 않음.");
			response.sendRedirect("../loginForm"); // servlet-context.xml //로그인 페이지로 이동
			return false; //주의, null이면 더이상 작업하지 않음.
		}else {
			return true; //주의, 로그인 정보가 있는경우 이후 작업 계속 진행
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	
}
