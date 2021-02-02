<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- RESERVATION -->
<section class="section">
    <div class="content-1 wrap">
        <div class="content-1-top">
            <h2 class="title">부담없이 예약하세요</h2>
            <p>
                나중에 변경 및 취소가 가능한 예약 옵션으로 여러분의 여행을 미리 계획하세요. 다시 여행을 떠날 때가 오면 더 확실하게 계획을 짤 수 있을
                거예요.
            </p>
        </div>
        <div class="content-1-bottom">
            <div>
                <img class="promoteImageFormat" src="${path}/resources/images/p1_flight.svg" alt=""/>
                <p class="text-title">항공권</p>
                <p class="text-content">
                    많은 항공사에서는 추후 항공권 변경 및 취소에도 손해가 없는 새로운 정책을 도입했습니다.
                </p>
                <a class="text-link" href="">변경 가능한 티켓 찾아보기</a>
            </div>
            <div>
                <img class="promoteImageFormat" src="${path}/resources/images/p2_hotel.svg" alt=""/>
                <p class="text-title">호텔
                </p>
                <p class="text-content">
                    숙박 계획을 여유롭게 잡으세요. 지금 예약하더라도, 나중에 확실해지면 그때 가서 확정할 수 있습니다.
                </p>
                <a class="text-link" href="">무료 취소 가능한 호텔보기</a>
            </div>
            <div>
                <img class="promoteImageFormat" src="${path}/resources/images/p3_lentcar.svg" alt=""/>
                <p class="text-title">렌터카</p>
                <p class="text-content">
                    여유 있게 여행을 계획하세요. 대부분 업체에서 48시간 이내까지 무료 취소, 또는 저렴한 금액으로 취소가 가능합니다.
                </p>
                <a class="text-link" href="">예약취소가 자유로운 렌터카 찾기</a>
            </div>
        </div>
    </div>
</section>