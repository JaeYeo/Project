<%@page import="com.dto.ScheduleSearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//by mirim
 	String totalPrice = (String) session.getAttribute("totalPrice");
	
	// FlightConfirm Servlet
	int pricePerPesson = Integer.parseInt((String) session.getAttribute("pricePerPesson"));
	int passenger = (int)session.getAttribute("passenger");
	
	// by mirim
	// 로그인 정보(email)
	String userEmail = (String) session.getAttribute("userId");
	if(userEmail == null){
		//by jungwoo
		userEmail = "";
	}
%>	

<!-- 20201120 -->
<section class="integration">
	<div class="wrap">
	
		<form action="" method="post" id="integrationInfoForm" class="clearfix">
			<div class="integration_wrap">
				<div class="process_box">
					<div class="process">
						<span class="process_info passengerInfoSpan process_info_select">승객 정보 입력</span> -> 
						<span class="process_info passportInfoSpan">승객 상세정보 입력</span> -> 
						<span class="process_info paySpan">결제 수단 선택</span>
					</div>
				</div>
				
				<div class="passengerInfo processInfo">
					<div class="passengerInfo_box">
						<h3>예약자 정보</h3>
						<div class="input_box">
							<label for="reservation_Name">이름</label> 
							<input type="text" maxlength="5" name="reservation_Name" id="reservation_Name" placeholder="이름">
						</div>
						<div class="input_box">
							<label for="reservation_Email">이메일</label> 
							<input type="text" name="reservation_Email" id="reservation_Email" class="r_email" placeholder="이메일" value="<%=userEmail%>">
						</div>
						<div class="input_box">
							<label for="reservation_phone">휴대전화</label> 
							<input type="text" name="reservation_phone" id="reservation_phone" placeholder="휴대전화">
						</div>
					</div>
					
					<div class="passengerInfo_box">
					<%
					for(int i = 0; i< passenger;i++){
					%>
						<h3>탑승객<%=i+1 %>정보</h3>
						<div class="input_box">
							<label for="p_lastname">영문 성</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_lastname" id="p_lastname"
								placeholder="탑승객 <%=i+1 %>의 영문 성">
						</div>
						<div class="input_box">
							<label for="p_firstname">영문 이름</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_firstname" id="p_firstname"
								placeholder="탑승객 <%=i+1 %>의 영문 이름">
						</div>
						<div class="input_box">
							<label for="p_sex<">성별</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_sex" id="p_sex" placeholder="탑승객 <%=i+1 %>의 성별">
						</div>
						<div class="input_box">
							<label for="p_birthday">생년월일</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_birthday" id="p_birthday"
								placeholder="탑승객 <%=i+1 %>의 생년월일">
						</div>
					<%
					}
					%>
					</div>
					<button type="button" class="next_btn passengerInfoBtn">다음</button>
				</div>
	
				<div class="passportInfo processInfo">
					<div class="passengerInfo_box">
						<h3>항공권/정보 등록 및 변경</h3> <br>
					<%
					for(int i = 0; i< passenger;i++){
					%>
						<%-- <div class="input_box">
							<label for="p_passenger<%=i %>">탑승객<%=i+1 %>의 상세 정보</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_passenger" id="p_passenger"
								placeholder="탑승객<%=i %>">
						</div> --%>
						<h4>탑승객<%=i+1 %>의 상세 정보</h3> <br>
						<div class="input_box">
							<label for="p_birthday<%=i %>">생년월일</label> <!-- 생년월일(session) -->
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_birthday" id="p_birthday"
								placeholder="탑승객 <%=i+1 %>의 생년월일">
						</div>
						<div class="input_box">
							<label for="p_passportNum<%=i %>">여권번호</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_passportNum" id="p_passportNum"
								placeholder="탑승객 <%=i+1 %>의 여권번호">
						</div>
						<div class="input_box">
							<label for="p_passportExpirationdate<%=i %>">여권만료일</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_passportExpirationdate"
								id="p_passportExpirationdate" placeholder="탑승객 <%=i+1 %>의 여권만료일">
						</div>
						<div class="input_box">
							<label for="p_nationality<%=i %>">국적</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_nationality" id="p_nationality"
								placeholder="탑승객 <%=i+1 %>의 국적">
						</div>
						<div class="input_box">
							<label for="p_issuecountry<%=i %>">발행국</label> 
							<input type="text" name="list_PassportInfoDTO[<%=i %>].p_issuecountry" id="p_issuecountry"
								placeholder="탑승객 <%=i+1 %>의 발행국">
						</div>
						<br>
					<%
					}
					%>
					</div>
					<button type="button" class="next_btn passportInfoBtn">다음</button>
				</div>
	
				<div class="pay processInfo" id="pay">
					<div class="passengerInfo_box">
						<h3>신용카드 결제</h3><!-- 생년월일(session) -->
						<div class="input_box">
							<label for="p_price">결제 금액</label> 
							<input type="text" name="p_price" id="p_price" placeholder="결제 금액" value="<%=totalPrice%>">
						</div>
						<div class="input_box">
							<label for="p_cardholderName">카드소유주명</label> 
							<input type="text" name="p_cardholderName" maxlength="4" id="p_cardholderName" placeholder="카드소유주명">
						</div>
						<div class="input_box">
							<label for="p_cardNum1">카드번호</label> 
							<input type="text" maxlength="4" name="p_cardNum1" id="p_cardNum1" class="cardNum" placeholder="카드번호1">
					
							<label for="p_cardNum2" class="blind">카드번호2</label> 
							<input type="text" maxlength="4" name="p_cardNum2" id="p_cardNum2" class="cardNum" placeholder="카드번호2">
				
							<label for="p_cardNum3" class="blind">카드번호3</label> 
							<input type="text" maxlength="4" name="p_cardNum3" id="p_cardNum3" class="cardNum" placeholder="카드번호3">
				
							<label for="p_cardNum4" class="blind">카드번호4</label> 
							<input type="text" maxlength="4" name="p_cardNum4" id="p_cardNum4" class="cardNum" placeholder="카드번호4">
						</div>
						<div class="input_box">
							<label for="p_cardExpiration">유효기간</label> 
							<input type="text" name="p_cardExpiration" id="p_cardExpiration" placeholder="유효기간">
						</div>
						<div class="input_box">
							<label for="p_paymentPlan">할부기간</label> 
							<select name="p_paymentPlan" id="p_paymentPlan">
								<option value="" selected>선택</option>
								<option value="일시불">일시불</option>
								<option value="02개월">02개월</option>
								<option value="03개월">03개월</option>
								<option value="04개월">04개월</option>
								<option value="05개월">05개월</option>
								<option value="06개월">06개월</option>
								<option value="07개월">07개월</option>
								<option value="08개월">08개월</option>
								<option value="09개월">09개월</option>
								<option value="10개월">10개월</option>
								<option value="11개월">11개월</option>
								<option value="12개월">12개월</option>
							</select>
						</div>
						<div class="input_box">
							<label for="p_passwd">비밀번호</label> 
							<input type="password" name="p_passwd" id="p_passwd" placeholder="앞 2자리" class="passwd" maxlength="2"> <span class="extra">XX</span>
						</div>
						<div class="input_box">
							<label for="p_cardType">카드소유관계</label> 
							<input type="text" name="p_cardType" id="p_cardType" placeholder="카드소유관계">
						</div>
					</div>
					<button type="button" name="kakaopay" id="kakaopay" class="next_btn kakaopay_btn">카카오페이</button>
					<button type="button" class="next_btn cardpay">카드결제</button>
				</div>
			</div>
			
			<div class="basic_view_integration">
				<h3 class="price_info">요금정보</h3>
				<div class="person_title">
					<h3>성인<strong><%=passenger %></strong>명</h3>
				</div>
				<div class="circle_basic_view">
					<table>
						<caption class="blind">요금정보</caption>
						<colgroup>
							<col style="width: 40%;">
							<col style="width: 30%;">
							<col style="width: 30%;">
						</colgroup>
						<tbody>
							<tr>
								<td>항공요금</td>
								<td><%=passenger %>명</td>
								<td class="td_r"><%=pricePerPesson - 8000%>원</td>
							</tr>
							<tr>
								<td>유류할증료</td>
								<td><%=passenger %>명</td>
								<td class="td_r">0원</td>
							</tr>
							<tr>
								<td>제세공과금</td>
								<td><%=passenger %>명</td>
								<td class="td_r">8,000원</td>
							</tr>
							<tr>
								<td>발권수수료</td>
								<td><%=passenger %>명</td>
								<td class="td_r">0원</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td>총 요금</td>
								<td colspan="2" class="td_r"><%= totalPrice %>원</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</form>
	</div>
</section>
