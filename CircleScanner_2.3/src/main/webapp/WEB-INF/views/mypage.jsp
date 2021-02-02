<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/main1.css">
	<link rel="stylesheet" href="${path}/resources/css/mypage.css">
	<script src="${path}/resources/js/mypage.js" defer></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<!-- HEADER -->
    <jsp:include page="html_common/header.jsp" flush="true"/>
	<!-- Mypages -->
    <jsp:include page="main_page/mypage.jsp" flush="true"/>
	<!-- FOOTER_CONTANT -->
	<jsp:include page="html_common/footer.jsp" flush="true"/>
	<!-- COUNTRY -->
	<jsp:include page="html_common/globalLink.jsp" flush="true"/>
</body>
</html>