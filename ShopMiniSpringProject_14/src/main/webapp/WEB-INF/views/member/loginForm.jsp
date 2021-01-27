<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${!empty mesg }">
  <script>
    alert('${mesg}');
  </script>
</c:if> 
<%--
<%String mesg = (String)request.getAttribute("mesg");
  String mesg2 = (String)request.getAttribute("mesg2");%>
<%	if(mesg!=null){%>
<h1><%=mesg %></h1>
<%  }%>
<%	if(mesg2!=null){%>
	<script>
	alert('<%=mesg2%>');
	</script>
<%  }%> 
--%>
 <!-- id, 패스워드 입력 검사 후 진행하도록  작성  -->
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
 	$("form").submit(function() {
		var id = $("#userid").val();
		var pw = $("#passwd").val();
		if (id.length == 0) {
			alert("아이디 입력해주세요!");
			$("#userid").focus();
			e.preventDefault();			
		} else if(pw.length == 0){
			alert("비밀번호 입력해주세요!");
			$("#passwd").focus();
			e.preventDefault();			
		}
	})
});
</script>
<form action="login" method="get"><!-- 주소 수정 -->
아이디:<input type="text" name="userid" id="userid"><br>
비밀번호:<input type="text" name="passwd" id="passwd"><br> 
<input type="submit" value="로그인">
<input type="reset" value="취소">
<a href="MemberIdSearchUIServlet">아이디찾기</a>
</form>
