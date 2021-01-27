<%@page import="com.dto.CartDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String mesg = (String)session.getAttribute("mesg");
	if(mesg!=null){
%>
<script>
	alert('<%=mesg%>');
</script>
<%
	}
	session.removeAttribute("mesg");
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		//전체선택
		$("#allCheck").on("click", function() {
			var chk = this.checked;
			$(".check").each(function(idx, data) {
				this.checked = chk;
			});
		});
		//수정
	 	$(".updateBtn").on("click", function(event) {
			var num = $(this).attr("data-xxx");
			var gPrice = $(this).attr("data-price");
			var gAmount = $("#cartAmount"+num).val();
	 		$.ajax({
				type : "GET",
				url : "loginCheck/cartUpdate",
				dataType : "text",
				data : {
					num : num, //카트번호
					gAmount : gAmount //수정한 수량 전송			
				},
				success : function(responseData, status, xhr) {
					var total = gAmount*gPrice; //성공시 합계만 변경함
					$("#sum"+num).text(total);
					totalXXX();
					
				},
				error : function(xhr, status, error) {
					console.log("error");
				}
			});
		});
		//삭제
	 	$(".deleteBtn").on("click", function(event) {
			var num = $(this).attr("data-xxx");
			var xxx = $(this);
			console.log(num + xxx);
	 		$.ajax({
				type : "GET",
				url : "loginCheck/cartDelete",
				dataType : "text",
				data : {
					num : num, //카트번호
				},
				success : function(responseData, status, xhr) {
					console.log("success");
					xxx.parents().filter("tr").remove();	
					totalXXX();
				},
				error : function(xhr, status, error) {
					console.log("error");
				}
			});
		});
		
		//전체cart 삭제
		$("#delAllCart").on("click", function() {
			var num=[];
			$("input:checkbox[name='check']:checked").each(function(idx,ele) {
				num[idx] = $(this).val();
			});
			console.log(num);
			location.href="CartDelAllServlet?data="+num;
		});
		//전체cart삭제
		$("#delAllCart2").on("click", function() {
			$("form").attr("action", "loginCheck/delAllCart");
			$("form").submit(); //trigger
		});
		//주문
		$(".orderBtn").on("click", function() {
			var num = $(this).attr("data-xxx");
			location.href = "loginCheck/orderConfirm?num=" + num;
		});
		totalXXX();
	});
	
	function totalXXX (){
		var totalSum = 0;
		 $(".sum").each(function(idx, data) {
			 console.log(idx);
			totalSum += Number.parseInt($(data).text());
		});
		$(".totalSum").text(totalSum);
	}
</script>
<table width="90%" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td height="30">
	</tr>
	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>- 장바구니-</b></font> &nbsp;
		</td>
	</tr>
	<tr>
		<td height="15">
	</tr>`
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="7">
	</tr>
	
	<form action="myForm">
	
	<tr>
		<td class="td_default" align="center">
		<input type="checkbox" name="allCheck" id="allCheck"> <strong>전체선택</strong></td>
		<td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
		<td></td>
	</tr>

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
<!-- 반복시작 -->
<c:forEach var="x" items="${cartList }">

		<tr>
			<td class="td_default" width="80">
				<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. --> 
				<input type="checkbox" name="check" class="check" value="${x.num }">
			</td>
			<td class="td_default" width="80">${x.num }</td>
			<td class="td_default" width="80"><img
				src="images/items/${x.gImage }.gif" border="0" align="center"
				width="80" /></td>
			<td class="td_default" width="300" style='padding-left: 30px'>${x.gName }
				<br> <font size="2" color="#665b5f">[옵션 : 사이즈(${x.gSize }) , 색상(${x.gColor })]</font></td>
			<td class="td_default" align="center" width="110">${x.gPrice }</td>
			<td class="td_default" align="center" width="90">
			<input
				class="input_default" type="text" name="cartAmount"
				id="cartAmount${x.num }" style="text-align: right" maxlength="3" size="2"
				value="${x.gAmount }"></input></td>
			<td><input type="button" value="수정" 
			class="updateBtn"
			data-xxx="${x.num }"
			data-price="${x.gPrice }"/>
			</td>
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum${dto.num }" class="sum">  ${x.gPrice * x.gAmount } 
			</span></td>
			<td><input type="button" value="주문" class="orderBtn" data-xxx="${x.num }"></td>
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'>
				<input type="button" value="삭제"
				class="deleteBtn" data-xxx="${x.num }">
			</td>
			<td height="10"> </td>
		</tr>	
			
		
</c:forEach>
	
	<tr>
		<td colspan="10">
			총합 : <span class="totalSum"></span>
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center" colspan="5"><a class="a_black"
			href="javascript:orderAllConfirm(myForm)"> 전체 주문하기 </a>&nbsp;&nbsp;&nbsp;&nbsp; 
<!-- 			<a class="a_black" href="#" id="delAllCart"> 전체 삭제하기 </a>&nbsp;&nbsp;&nbsp;&nbsp; -->
			<a class="a_black" href="#" id="delAllCart2"> 전체 삭제하기2 </a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="index.jsp"> 계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>
	</form>
</table>
    