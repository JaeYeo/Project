<%@page import="com.dto.AirportDTO"%>
<%@ page import="com.dto.ScheduleSearchDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
	// SearchController에서 담긴 session
	String tripType = (String)session.getAttribute("tripType");
	String seatGrade = (String)session.getAttribute("seatGrade");
	int passenger = (int)session.getAttribute("passenger");
	String totalPrice = (String)session.getAttribute("totalPrice");
	String list_D_priceFormat = (String)session.getAttribute("list_D_priceFormat");
	String list_A_priceFormat = (String)session.getAttribute("list_A_priceFormat");
	String total_priceFormat = (String)session.getAttribute("total_priceFormat");
	
	String non_stop = (String)session.getAttribute("non_stop");
	
	// FlightConfirm Controller
	ScheduleSearchDTO selected_DepartScheduleSearchDTO = (ScheduleSearchDTO) session.getAttribute("selected_DepartScheduleSearchDTO");
	ScheduleSearchDTO selected_ArrivalScheduleSearchDTO = (ScheduleSearchDTO) session.getAttribute("selected_ArrivalScheduleSearchDTO");
	
	String ANAME_K_D = (String)session.getAttribute("ANAME_K_D");
	String ANAME_K_A = (String)session.getAttribute("ANAME_K_A");
	
	AirportDTO Airport_Names_Depart = (AirportDTO) session.getAttribute("Airport_Names_Depart");
	AirportDTO Airport_Names_Desti = (AirportDTO) session.getAttribute("Airport_Names_Desti");
	
	String airportKR_D_Depart = Airport_Names_Depart.getANAME_K();
	String airportKR_D_Desti = Airport_Names_Desti.getANAME_K();

	/* 요일 출력 */
	DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	DateFormat outputFormat = new SimpleDateFormat("a KK:mm");
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyymmdd");
	Date myDate = sf.parse(selected_DepartScheduleSearchDTO.getDEPART_DATE());
	Date myDate_A = sf.parse(selected_ArrivalScheduleSearchDTO.getDEPART_DATE());
	Calendar cal = Calendar.getInstance();
	cal.setTime(myDate);
	String m_week = "";
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	switch(dayOfWeek){
	case 1: m_week = "일"; break;
	case 2: m_week = "월"; break;
	case 3: m_week = "화"; break;
	case 4: m_week = "수"; break;
	case 5: m_week = "목"; break;
	case 6: m_week = "금"; break;
	case 7: m_week = "토"; break;
	}
	String getDay = m_week;
	
	int pricePerPesson = Integer.parseInt(selected_DepartScheduleSearchDTO.getPRICE()) +Integer.parseInt(selected_ArrivalScheduleSearchDTO.getPRICE());
	
	// 요일 가공
	// 가는편
	String selected_D_date1 = selected_DepartScheduleSearchDTO.getDEPART_DATE().substring(5, 7) + "월";
	String selected_D_date2 = selected_DepartScheduleSearchDTO.getDEPART_DATE().substring(8, 10) + "일";
	String selected_D_date = selected_D_date1 + selected_D_date2 +"(" + m_week + ")";
	// 오는편
	String selected_A_date1 = selected_ArrivalScheduleSearchDTO.getDEPART_DATE().substring(5, 7) + "월";
	String selected_A_date2 = selected_ArrivalScheduleSearchDTO.getDEPART_DATE().substring(8, 10) + "일";
	String selected_A_date = selected_A_date1 + selected_A_date2 +"(" + m_week + ")";
%>

<section class="flightconfirm">
	<div class="wrap">
		<form action="passesngerInfo_pay">
			<input type="hidden" name="pricePerPesson" id="pricePerPesson" value="<%=pricePerPesson%>">
			<!-- 1인당 요금 -->
			<ul class="search_result">
				<!-- RESULT LEFT -->
				<li class="ticket_list">
					<span class="label_blue label_box">가는편</span>
					<p class="ticket_departure_box">
						<strong><%=airportKR_D_Depart%></strong>
						<span class="ico_itinerary"></span> 
						<strong><%=airportKR_D_Desti%></strong>
					</p> 
					<span class="ticket_departure_date"><%=selected_D_date%></span> 
					<span>
						<span class="airline_img">
						<img alt="Airline_images" src="${path}/resources/images/<%=selected_DepartScheduleSearchDTO.getAIRLINE_NAME().trim()%>.jpg"></span> 
						<span class="airline_name"><em><%=selected_DepartScheduleSearchDTO.getAIRLINE_NAME()%></em>
						<em class="depAirNm"><%=selected_DepartScheduleSearchDTO.getAIRCRAFT_NAME()%></em></span>
					</span> 
					<span class="ariline_date"> 
						<span class="dep_time"><strong><%=outputFormat.format(inputFormat.parse(selected_DepartScheduleSearchDTO.getDEPART_DATE())) %></strong><em class="depAirCt"><%=selected_DepartScheduleSearchDTO.getDEPARTURE_ACODE()%></em></span> 
						<span class="from_to"> 
							<span class="ico_itinerary_lg"></span> <em class="time">소요시간</em>
						</span> 
						<span class="arr_time"><strong><%=outputFormat.format(inputFormat.parse(selected_DepartScheduleSearchDTO.getARRIVE_DATE())) %></strong><em class="arrAirCt"><%=selected_DepartScheduleSearchDTO.getDESTINATION_ACODE()%></em></span>
					</span> <strong class="total"><%= list_D_priceFormat %>원</strong>
				</li>
				
				<li class="ticket_list">
					<span class="label_blue label_box">오는편</span>
					<p class="ticket_departure_box">
						<strong><%=airportKR_D_Desti%></strong><span class="ico_itinerary"></span><strong><%=airportKR_D_Depart%></strong>
					</p>
					<span class="ticket_departure_date"><%=selected_A_date %></span> 
					<span>
						<span class="airline_img">
						<img alt="Airline_images" src="${path}/resources/images/<%=selected_ArrivalScheduleSearchDTO.getAIRLINE_NAME().trim()%>.jpg"></span> 
						<span class="airline_name"><em><%=selected_ArrivalScheduleSearchDTO.getAIRLINE_NAME()%></em><em class="depAirNm"><%=selected_ArrivalScheduleSearchDTO.getAIRCRAFT_NAME() %></em></span>
					</span> 
					<span class="ariline_date"> 
						<span class="dep_time"><strong><%=outputFormat.format(inputFormat.parse(selected_ArrivalScheduleSearchDTO.getDEPART_DATE())) %></strong>
						<em class="depAirCt"><%=selected_ArrivalScheduleSearchDTO.getDESTINATION_ACODE()%></em></span> 
						<span class="from_to"> 
							<span class="ico_itinerary_lg"></span> <em class="time">소요시간</em>
						</span> 
						<span class="arr_time"><strong><%=outputFormat.format(inputFormat.parse(selected_ArrivalScheduleSearchDTO.getARRIVE_DATE())) %></strong><em class="arrAirCt"><%=selected_ArrivalScheduleSearchDTO.getDEPARTURE_ACODE()%></em></span>
					</span> 
					<strong class="total"><%=list_A_priceFormat %>원</strong>
				</li>
			</ul>

			<!-- 선택한 항공권  -->
			<div class="total_scdul">

				<h3 class="detail_price">상세요금</h3>
				<div class="basic_view">
					<table>
						<caption class="blind">내가 선택한 항공권 전체 내역 및 가격</caption>
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
							<col style="width: 10%;">
						</colgroup>
						<thead>
							<tr>
								<th>항목</th>
								<th>항공요금</th>
								<th>유류할증료</th>
								<th>제세공과금</th>
								<th>발권수수료</th>
								<th>인원</th>
								<th class="detail_total_title">총요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>성인</td>
								<td class="price_perpesson"><%=pricePerPesson - 8000%>원</td>
								<td>0원</td>
								<td>8,000원</td>
								<td>0원</td>
								<td><%=passenger %>명</td>
								<td class="detail_total"><%=totalPrice%>원</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" class="circle_total">총 예상요금</td>
								<td colspan="2" class="fare_total"><em id="totalPrice"><%=totalPrice%>원</em>
									<button type="submit" title="예약하기" class="bookTicket">예약하기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</form>
		<!-- //선택한 항공권  -->
	</div>
</section>



