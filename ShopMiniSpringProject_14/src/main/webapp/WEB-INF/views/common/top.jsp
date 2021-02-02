<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${empty login }"><!-- 세션에서 로그인 정보 검사 로그인 안된경우 -->
	<a href="loginForm">로그인</a> <!-- xml에 링크설정 -->
	<a href="memberForm">회원가입</a> <!-- xml에 링크설정 -->
	<a href="loginCheck/cartList">장바구니</a>
</c:if>
<c:if test="${!empty login }"><!-- 세션에서 로그인정보 검사 로그인 된 경우 -->
	안녕하세요. ${login.username }님!<br>
	<a href="loginCheck/logout">로그아웃</a>
	<a href="loginCheck/myPage">mypage</a>
	<a href="loginCheck/cartList">장바구니 목록</a>
</c:if>
