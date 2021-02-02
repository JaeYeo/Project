<%@page import="com.dto.SearchBtnDTO"%>
<%@page import="com.dto.ScheduleSearchDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
<%
SearchBtnDTO searchBtnDTO = (SearchBtnDTO) session.getAttribute("searchBtnDTO");

int passenger = (int)session.getAttribute("passenger");

String originPlaceAcode = (String)session.getAttribute("originPlaceAcode");
String destinationPlaceAcode = (String)session.getAttribute("destinationPlaceAcode");
%>
        <div class="wrap">
            <div class="search__wrap">
                <div class="search__detail-container">
                    <div class="detail__left">
                        <span class="city__detail">
                            <b><%=searchBtnDTO.getOriginPlace() %></b> (<%=originPlaceAcode %>) - <b><%=searchBtnDTO.getDestinationPlace() %></b> (<%=destinationPlaceAcode %>)
                        </span>
                        <div class="passenger__detail">
                            <span><%=passenger%> 승객 |</span>
                            <span><%=searchBtnDTO.getSeatGrade() %></span>
                        </div>    
                    </div>
                    <nav class="detail__right">
                        <div class="depart__date">
                            <button>◀</button>
                            <input type="text" name="departure_date" id="depart" value="<%=searchBtnDTO.getOutboundPartialDate()%>">
                            <button>▶</button>
                        </div>
                        <div class="return__date">
                            <button>◀</button>
                            <input type="text" name="return_date" id="return" value="<%=searchBtnDTO.getInboundPartialDate()%>">
                            <button>▶</button>
                        </div>
                    </nav>
                </div>
            </div> 
        </div>
    </section>