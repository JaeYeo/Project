<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Mypages -->
<form action="/KakaoLogoutController" method="get">
<section class="section mypages">
    <div class="wrap clearfix">
        <div class="user-profile__container">
            <div class="user-profile-main">
                <div class="user-img__container">
                    <img class="user-img" src="${path}/resources/images/user-profile.svg" alt="user profile">
                </div>
                <h1 class="title">안녕하세요!</h1>
                <span class="user-email">${ userEmail }</span>
            </div>
            <ul class="user-info">
                <li class="tab-link" data-tab="tab1">
                    <a href="#tab1" class="current">
                        <div class="user-info-left">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path d="M7.382 1.312A.695.695 0 0 0 7 1.98v2.534C7 5.5 8 6 9 6s2-.5 2-1.486V2a.73.73 0 0 0-.405-.689A3.961 3.961 0 0 0 9 1.001a4.077 4.077 0 0 0-1.618.311zM13 8.302v5.921c0 .4-.582.778-1.13 1.017a1.264 1.264 0 0 0-.795 1.014l-.45 5.823a1 1 0 0 1-.998.923H8.443a1 1 0 0 1-.997-.923l-.45-5.823a1.197 1.197 0 0 0-.805-.99C5.621 15.05 5 14.704 5 14.302V8.38a.85.85 0 0 1 .547-.828 12.637 12.637 0 0 1 3.488-.55 12.589 12.589 0 0 1 3.417.477.84.84 0 0 1 .548.823zm2.382 9.01a.695.695 0 0 0-.382.668v3.534C15 22.5 16 23 17 23s2-.5 2-1.486V18a.73.73 0 0 0-.405-.689 3.961 3.961 0 0 0-1.595-.31 4.077 4.077 0 0 0-1.618.311z"></path></svg>
                            <span>승객추가</span>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" class="right-arrow"><path fill-rule="evenodd" d="M8.095 4.887a1.496 1.496 0 0 1 2.008 0l5.948 6.397a1 1 0 0 1 .003 1.358l-6.01 6.532a1.427 1.427 0 0 1-1.949-.138 1.572 1.572 0 0 1-.103-1.997l4.638-5.078-4.535-4.97a1.72 1.72 0 0 1 0-2.104z"></path></svg>
                    </a>
                </li>
                <li class="tab-link" data-tab="tab2">
                    <a href="#tab2">
                        <div class="user-info-left">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path d="M12 2.5a7.095 7.095 0 0 0-7.186 7v.64a9.789 9.789 0 0 1-1.084 4.47l-.51.995A2.002 2.002 0 0 0 5.055 18.5h13.888a2.003 2.003 0 0 0 1.837-2.894l-.51-.995a9.788 9.788 0 0 1-1.085-4.472V9.5A7.095 7.095 0 0 0 12 2.5zM9.076 20.459c-.265-.485.204-.959.756-.959h4.34c.551 0 1.02.474.754.959a2.297 2.297 0 0 1-1.932 1.041h-2a2.27 2.27 0 0 1-1.918-1.041z"></path></svg>
                            <span>가격 변동 알림</span>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" class="right-arrow"><path fill-rule="evenodd" d="M8.095 4.887a1.496 1.496 0 0 1 2.008 0l5.948 6.397a1 1 0 0 1 .003 1.358l-6.01 6.532a1.427 1.427 0 0 1-1.949-.138 1.572 1.572 0 0 1-.103-1.997l4.638-5.078-4.535-4.97a1.72 1.72 0 0 1 0-2.104z"></path></svg>
                    </a>
                </li>
                <li class="tab-link" data-tab="tab3">
                    <a href="#tab3">
                        <div class="user-info-left">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zM9.809 7.254A1.283 1.283 0 0 1 11.12 6h1.763a1.283 1.283 0 0 1 1.31 1.254V9.35a2.194 2.194 0 0 1-4.384 0zM16.5 16a5.28 5.28 0 0 1-4.5 2 5.261 5.261 0 0 1-4.5-2 1.345 1.345 0 0 1 0-1.5 7.204 7.204 0 0 1 4.5-1.497 7.322 7.322 0 0 1 4.5 1.497c.345.28.274 1.15 0 1.5z"></path></svg>
                            <span>계정<em class="extra">이메일, 비밀번호</em></span>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" class="right-arrow"><path fill-rule="evenodd" d="M8.095 4.887a1.496 1.496 0 0 1 2.008 0l5.948 6.397a1 1 0 0 1 .003 1.358l-6.01 6.532a1.427 1.427 0 0 1-1.949-.138 1.572 1.572 0 0 1-.103-1.997l4.638-5.078-4.535-4.97a1.72 1.72 0 0 1 0-2.104z"></path></svg>
                    </a>
                </li>
                <li class="tab-link" data-tab="tab4">
                    <a href="#tab4">
                        <div class="user-info-left">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path d="M21.24 3.927l-2.213-.757a21.687 21.687 0 0 0-14.054 0l-2.213.757A1.137 1.137 0 0 0 2 5.008v10.584a3.377 3.377 0 0 0 3.333 3.421h2.49a2 2 0 0 1 1.432.6l2.03 2.082a1 1 0 0 0 1.414.016l.016-.016 2.03-2.082a2 2 0 0 1 1.432-.6h2.49A3.377 3.377 0 0 0 22 15.592V5.009a1.138 1.138 0 0 0-.76-1.082zM8.995 10.988a1 1 0 1 1-1-1 1 1 0 0 1 1 1zm3 1a1 1 0 1 1 1-1 1 1 0 0 1-1.002.999zm4 0a1 1 0 1 1 1-1 1 1 0 0 1-1.004.999z"></path></svg>
                            <span>리뷰</span>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" class="right-arrow"><path fill-rule="evenodd" d="M8.095 4.887a1.496 1.496 0 0 1 2.008 0l5.948 6.397a1 1 0 0 1 .003 1.358l-6.01 6.532a1.427 1.427 0 0 1-1.949-.138 1.572 1.572 0 0 1-.103-1.997l4.638-5.078-4.535-4.97a1.72 1.72 0 0 1 0-2.104z"></path></svg>
                    </a>
                </li>
            </ul>
            <div class="logout__container">
            	<!-- <input type="button" class="btn btn-white logout-btn" value="로그아웃"/> -->
                <button type="button" class="btn btn-white logout-btn" onclick="kakaoLogout()">로그아웃</button>
                <script>
                	function kakaoLogout(){
                		location.href = "KakaoLogoutController";
                	}
                </script>
            </div>
        </div>
        <div class="user-contents__wrap">
            <div id="tab1" class="user-contents current">
                <div class="user-contents__container">
                    <div class="user-profileInfo">
                        <h2 class="title">상세 개인 정보</h2>
               
                        <ul class="user-profileInfo__container">
                            <li>
                                <label for="user-title">
                                    <strong class="userInfo-title">직함</strong>
                                    <span class="input__container">
                                        <input type="text" name="user-title" id="user-title" placeholder="직함을 입력하세요">
                                    </span>
                                </label> 
                            </li>
                            <li>
                                <label for="firstName">
                                    <strong class="userInfo-title">이름<em>*</em></strong>
                                    <span class="input__container">
                                        <input type="text" name="firstName" id="firstName" placeholder="이름을 입력하세요" required>
                                    </span>
                                </label> 
                            </li>
                            <li>
                                <label for="surName">
                                    <strong class="userInfo-title">성<em>*</em></strong>
                                    <span class="input__container">
                                        <input type="text" name="surName" id="surName" placeholder="성을 입력하세요" required>
                                    </span>
                                </label> 
                            </li>
                            <li>
                                <label for="userGender">
                                    <strong class="userInfo-title">성별</strong>
                                    <span class="input__container">
                                        <select name="userGender" id="userGender">
                                            <option value="선택안함" selected>선택안함</option>
                                            <option value="여성">여성</option>
                                            <option value="남성">남성</option>
                                        </select>
                                    </span>
                                </label> 
                            </li>
                            <li>
                                <label for="user-nationality">
                                    <strong class="userInfo-title">국적</strong>
                                    <span class="input__container">
                                        <select name="user-nationality" id="user-nationality">
                                            <option value="국가/지역 선택" selected>국가/지역 선택</option>
                                            <option value="1">네덜란드</option>
                                            <option value="2">대한민국</option>
                                            <option value="3">라오스</option>
                                            <option value="4">마카오</option>
                                            <option value="5">미국</option>
                                            <option value="6">베트남</option>
                                            <option value="7">싱가포르</option>
                                            <option value="8">영국</option>
                                            <option value="9">인도네시아</option>
                                            <option value="10">일본</option>
                                            <option value="11">중국</option>
                                            <option value="12">캄보디아</option>
                                            <option value="13">캐나다</option>
                                            <option value="14">타이완</option>
                                            <option value="15">태국</option>
                                            <option value="16">프랑스</option>
                                            <option value="17">필리핀</option>
                                            <option value="18">헝가리</option>
                                            <option value="19">호주</option>
                                            <option value="20">홍콩</option>
                                        </select>
                                    </span>
                                </label> 
                            </li>
                            <li>
                                <label for="user-birthplace">
                                    <strong class="userInfo-title">출생지</strong>
                                    <span class="input__container">
                                        <input type="text" name="user-birthplace" id="user-birthplace" placeholder="출생지를 입력하세요">
                                    </span>
                                </label> 
                            </li>
                            <li>
                                <label for="user-birthDay">
                                    <strong class="userInfo-title">생년월일</strong>
                                    <span class="input__container">
                                        <input type="text" name="user-birthDay" id="user-birthDay" placeholder="YYYY/MM/DD">
                                    </span>
                                </label> 
                            </li>
                        </ul>
                    </div>
                    <button type="submit" class="btn btn-disabled">승객저장</button>
                </div> 
            </div>
            <div id="tab2" class="user-contents">
                <div class="user-contents__container">
                    <div class="user-profileInfo">
                        <h2 class="title">가격 변동 알림</h2>
                    </div>
                </div> 
            </div>
            <div id="tab3" class="user-contents">
                <div class="user-contents__container">
                    <div class="user-profileInfo">
                        <h2 class="title">계정</h2>
               
                        <dl class="user-account__container">
                            <dt><strong class="userAccount-title">일반정보</strong></dt>
                            <dd><em class="extra">이메일</em><span class="user_email-big">${ userEmail }</span></dd>
                            <dt><strong class="userAccount-title">구독</strong></dt>
                            <dd><input type="checkbox">CirclScanner에서 여행에 관한 팁, 아이디어, 뉴스와 기타 마케팅 이메일을 받고 싶습니다.</dd>
                            <dt><strong class="userAccount-title">비밀번호</strong></dt>
                            <dd>비밀번호 변경</dd>
                            <dt><strong class="userAccount-title">계정</strong></dt>
                            <dd>계정삭제</dd>
                        </dl>
                        
                    </div>
                </div> 
            </div>
            <div id="tab4" class="user-contents">
                <div class="user-contents__container">
                    <div class="user-profileInfo">
                        <h2 class="title">리뷰</h2>
               
                        <h3 class="review-title">아직 후기가 없나요?</h3>
                        <p>
                            스카이스캐너 앱의둘러보기 영역으로 이동하여
                            여러분의 경험을 공유하고 다른 여행객의 평가를 확인하세요.

                            스카이스캐너 앱을 다운로드하고
                            여러분의 경험을 다른 여행객들과 공유하세요.
                        </p>
                    </div>
                </div> 
            </div>
        </div>
        
        
    </div>
</section>
</form>