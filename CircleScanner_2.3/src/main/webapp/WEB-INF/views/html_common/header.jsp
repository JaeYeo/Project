<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- HEADER -->
<div class="hearder_wrap">
	<header class="header">
		<div class="wrap">
			<div class="header__container">
				<a href="main">
                    <img class="logo" alt="logo" src="${path}/resources/images/logo4.png">
				</a>
				<ul class="main__nav">
					<li><a href="#a">항공권</a></li>
					<li><a href="#a">호텔</a></li>
					<li><a href="#a">렌터카</a></li>
				</ul>


			
				<c:if test="${!empty userEmail}">
				<ul class="user_login clearfix">
					<li><a href="mypage.jsp" class="user_img-small"><svg class="login_icon_user" xmlns="http://www.w3.org/2000/svg" viewBox="2 2 32 32">
							<path d="M18 3C9.75 3 3 9.75 3 18s6.75 15 15 15 15-6.75 15-15S26.25 3 18 3zm0 4.5c2.55 0 4.5 1.95 4.5 4.5s-1.95 4.5-4.5 4.5-4.5-1.95-4.5-4.5 2.102-4.5 4.5-4.5zM18 30c-3.602 0-7.05-1.648-9.3-4.5.902-1.8 2.25-3.45 4.05-4.648A6.569 6.569 0 0116.8 19.5h2.4c1.5 0 2.85.45 4.05 1.352 1.8 1.199 3.148 2.847 4.05 4.648-2.1 2.852-5.55 4.5-9.3 4.5zm0 0"></path></svg></a></li>
					<li><a href="mypage">${userEmail}</a></li>
				</ul>
				</c:if>
				
				<c:if test="${empty userEmail}">
				<button type="button" class="btn login">로그인</button>
				<div class="login__modal">

					<div class="login__modal-contents">
						<div class="login__wrap">
							<button type="button" class="login__modal-close">
								<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24" width="18" height="18" class="close">
                                    <path d="M5.587 3.467a1.5 1.5 0 1 0-2.194 2.046q.036.038.074.074l6.438 6.44-6.44 6.44a1.5 1.5 0 0 0 2.122 2.12l6.44-6.438 6.44 6.44a1.5 1.5 0 0 0 2.12-2.122l-6.438-6.44 6.44-6.44a1.5 1.5 0 0 0-2.122-2.12l-6.44 6.438-6.44-6.44z"></path>
                                </svg>
							</button>

							<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 201 128" class="modal__logo">
                                <path d="M101 127.1c2.1 0 4.1-.5 6-1.6l21.9-12.6c4.4-2.5 9.5-3.6 14.6-3 26.6 3.1 45.2 8.1 50.7 9.7 1.1.3 2.4-.1 3.1-1 .9-1.1 2-2.9 2.9-5.5.8-2.5.9-4.6.8-6.1-.1-1.2-.9-2.3-2.1-2.6-8.6-2.5-46.7-12.8-97.9-12.8s-89.3 10.3-97.9 12.8c-1.2.3-2 1.4-2.1 2.6-.1 1.4 0 3.5.8 6.1.8 2.6 2 4.4 2.9 5.5.7.9 2 1.3 3.1 1 5.5-1.6 24.2-6.6 50.7-9.7 5.1-.6 10.2.5 14.6 3L95 125.5c1.9 1.1 3.9 1.6 6 1.6zM64.5 56.2c1.2 2.1 3.1 3.5 5.3 4.1 2.2.6 4.5.3 6.6-.9 2.1-1.2 3.5-3.1 4.1-5.3.6-2.2.3-4.5-.9-6.6L59.9 13.4c-.6-1.1-1.9-1.5-3.1-1.4-1.6.1-3.8.9-6.4 2.4-2.6 1.5-4.4 3-5.3 4.3-.7 1-.9 2.3-.3 3.4l19.7 34.1zm-18 24.4c2.1 1.2 4.5 1.4 6.6.9 2.1-.5 4.1-2 5.3-4.1 1.2-2.1 1.4-4.5.9-6.6-.5-2.1-2-4.1-4.1-5.3L21.1 45.9c-1.1-.6-2.4-.4-3.4.3-1.3.9-2.8 2.7-4.3 5.3-1.5 2.6-2.3 4.8-2.4 6.4-.1 1.3.4 2.5 1.4 3.1l34.1 19.6zm63.2-36.5c0 2.4-1 4.6-2.5 6.2-1.6 1.6-3.7 2.5-6.2 2.5s-4.6-1-6.2-2.5c-1.6-1.6-2.5-3.7-2.5-6.2V4.8c0-1.3.8-2.3 2-2.8C95.7 1.3 98 .9 101 .9s5.3.4 6.7 1.1c1.1.6 2 1.5 2 2.8v39.3zm27.8 12.1c-1.2 2.1-3.1 3.5-5.3 4.1-2.2.6-4.5.3-6.6-.9-2.1-1.2-3.5-3.1-4.1-5.3-.6-2.2-.3-4.5.9-6.6l19.7-34.1c.6-1.1 1.9-1.5 3.1-1.4 1.6.1 3.8.9 6.4 2.4 2.6 1.5 4.4 3 5.3 4.3.7 1 .9 2.3.3 3.4l-19.7 34.1zm18 24.4c-2.1 1.2-4.5 1.4-6.6.9-2.1-.5-4.1-2-5.3-4.1-1.2-2.1-1.4-4.5-.9-6.6.5-2.1 2-4.1 4.1-5.3l34.1-19.7c1.1-.6 2.4-.4 3.4.3 1.3.9 2.8 2.7 4.3 5.3 1.5 2.6 2.3 4.8 2.4 6.4.1 1.3-.4 2.5-1.4 3.1l-34.1 19.7z"></path>
                            </svg>
							<div class="modal__contants">
								<div class="title__container">
									<h2 class="title">모든 기능을 이용하세요</h2>
									<p>
										가격을 추적하고, 여행을 더 쉽게 계획하고,<br> 더 빠르게 예약해 보세요.
									</p>
								</div>
								<div class="login__btns">
									<input type="button" class="btn btn-white" value="이메일로 로그인하기">
								
									<input type="button" class="btn btn-white" value="Google"
										onclick="google_login()">
									<script type="text/javascript">
										function google_login() {
											location.href = "https://accounts.google.com/o/oauth2/auth?client_id=49105029524-075to6oto0ovlfgia5famptqki3tcm12.apps.googleusercontent.com&redirect_uri=http://localhost:8090/CircleScanner/login&response_type=code&scope=openid%20email&approval_prompt=force&access_type=offline";
										}
									</script>
									<div class="sns-bts__container">
										<input type="button" id="kakoLoginBtn" class="btn btn-white"
											value="KaKaoTalk" onclick="kakaoLogin()">
										<script>
											function kakaoLogin() {
												location.href = "https://kauth.kakao.com/oauth/authorize?client_id=1efeaa868f35829162ae9a8f116478bf&redirect_uri=http://localhost:8090/CircleScanner/KakaoRedirect&response_type=code";
											}
										</script>
										<input type="button" class="btn btn-white" value="Facebook">
									</div>
									<div class="keep__login__container">
										<label for="keep__login"
											class="label__original label__original-blak"> <input
											type="checkbox" name="keep__login" id="keep__login">
											로그인 상태 유지 <span class="new__checkbox"></span>
										</label>
									</div>
									<div class="privaceypolicy__container">
										<p>
											계속 진행하시면 스카이스캐너의 <a class="point" href="#a">서비스 약관</a>과 
											<a class="point" href="#a">개인정보처리방침</a>에 동의하시게 됩니다.
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<script>
						const modal = document.querySelector(".login");
						const modalClose = document
								.querySelector(".login__modal-close");

						modal.addEventListener("click", function() {
							loginModal.style.display = "block";
							loginModalContents.style.display = "block";
						});

						const loginModal = document
								.querySelector(".login__modal");
						const loginModalContents = document
								.querySelector(".login__modal-contents");

						modalClose.addEventListener("click", function() {
							loginModal.style.display = "none";
							loginModalContents.style.display = "none";
						});
					</script>
					
				</div>
				</c:if>
			</div>
		</div>
	</header>
</div>