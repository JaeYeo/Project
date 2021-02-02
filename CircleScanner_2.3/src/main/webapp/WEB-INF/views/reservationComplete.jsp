<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>passengerInfo_pay</title>
	<link rel="stylesheet" href="${path}/resources/css/reset.css">
	<link rel="stylesheet" href="${path}/resources/css/font.css">
	<link rel="stylesheet" href="${path}/resources/css/main1.css">
	<link rel="stylesheet" href="${path}/resources/css/reservation_complete.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="${path}/resources/js/kakaopay.js"></script>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="html_common/header.jsp" flush="true" />
	<jsp:include page="passesngerInfo_pay_page/reservationComplete.jsp" flush="true"/> <br>
	<!-- <a href="reservation_PDF.jsp">예약확인하기</a>
	예약확인하기 누르면 새창에서 열리고, 자식창에 닫기기능 추가 -->
	<!-- FOOTER_CONTANT -->
	<jsp:include page="html_common/footer.jsp" flush="true" />
</body>
</html>