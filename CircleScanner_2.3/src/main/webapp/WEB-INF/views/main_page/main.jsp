<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%
	String sysDate = (String) session.getAttribute("sysDate");
	String sysNextDate = (String) session.getAttribute("sysNextDate");
%>
<!-- MAIN -->
<form action="scheduleSearch" method="get" id="MainForm">
	<section class="section main__cover">
		<div class="wrap">
			<h1 class="main__title">이제 여행을 시작하세요</h1>
			<div class="flight-bg">
				<div class="flight-type__btn__container">
					<ul class="flight-type__btn clearfix">
						<li>
							<label for="roundtrip" class="radio__button-original">
							<input type="radio" name="tripType" id="roundtrip" value="roundtrip" checked="checked">&nbsp;왕복&nbsp;&nbsp;
							<span class="radio__button"></span>
							</label>
						</li>
						<li>
							<label for="oneway" class="radio__button-original">
							<input type="radio" name="tripType" id="oneway" value="oneway">&nbsp;편도&nbsp;&nbsp;
							<span class="radio__button"></span>
							</label>
						</li>
						<li>
							<label for="multiway" class="radio__button-original">
							<input type="radio" name="tripType" id="multiway" value="multiway">&nbsp;다구간
							<span class="radio__button"></span>
							</label>
						</li>
					</ul>
					<a href="#a" class="map__search">지도로 검색하기</a>
				</div>

				<div class="flight-type-data__wrap">
					<div class="flight-type-data">
						<label for="departure">출발지</label> 
						<span class="flight-type-data__box1"> 
							<input type="text" class="flight-width" name="originPlace" id="departure"
								placeholder="&nbsp;&nbsp;국가, 도시 또는 공항" autocomplete="off"/>
						</span> 
						<label for="nearby_airport-origin" class="label__original">
						<input type="checkbox" id="nearby_airport-origin">&nbsp;&nbsp;주변 공항 추가 
						<span class="new__checkbox"></span>
						</label>
					</div>
					<div class="flight-type-data">
						<label for="switch">&nbsp;</label> 
						<span class="flight-type-data__box__switch"> 
						<input type="button" class="switch__button flight-width" name="switch"
							id="switch" value=" ">
						</span>
					</div>
					<div class="flight-type-data">
						<label for="destination">도착지</label> 
						<span class="flight-type-data__box2"> <input type="text"
							name="destinationPlace" id="destination" class="flight-width"
							placeholder="국가, 도시 또는 공항" autocomplete="off"/>
						</span> 
						<label for="nearby_airport-destination" class="label__original">
						<input type="checkbox" id="nearby_airport-destination">&nbsp;&nbsp;주변
							공항 추가 
							<span class="new__checkbox"></span>
						</label>
					</div>
					<div class="flight-type-data">
						<label for="departure-date">가는날</label> <span
							class="flight-type-data__box3"> <input type="text"
							name="outboundPartialDate" class="c flight-width" id="departure-date"
							value="<%=sysDate %>" autocomplete="off">
						</span>
					</div>
					<div class="flight-type-data">
						<label for="arrival-date">오는날</label> 
						<span class="flight-type-data__box4"><input type="text"
							name="inboundPartialDate" class="c flight-width" id="arrival-date"
							value="<%=sysNextDate%>" autocomplete="off"> </span>
					</div>

					<div class="flight-type-data">
						<label for="seat-grade">좌석 및 승객</label>
						<div class="flight-type-data__box5">
							<!--popup_open_btn_seatGrade-->
							<input type="text" name="passenger" id="seat-grade"
								class="popup_btn flight-width" value="1 성인, 일반석">
							<div id="my_modal">
								<div class="my_modal__container">
									<label for="seatGrade"><span class="modal__title">좌석등급</span></label>
									<div>
										<span class="input__container"> <select
											name="seatGrade" id="seatGrade">
												<option value='일반석' selected="selected">일반석</option>
												<option value='프리미엄 일반석'>프리미엄 일반석</option>
												<option value='비즈니스'>비즈니스</option>
												<option value='일등석'>일등석</option>
										</select><br>
										</span>
									</div><br>
									<div class="alert_message">
										<span id="alertmesg_adult"></span><br>
										<span id="alertmesg_kid"></span>
									</div>
									<div class="kidult">
										<label for="adult"><span class="modal__title">성인</span></label>
										<div class="buttons">
											<input type="button" name="adult" id="minus_adult" class="kidult_btn" value="-">
												<span id="adult_number" class="bold">1</span> 
											<input type="button" name="adult" id="plus_adult" class="kidult_btn" value="+">
												<span>만 16세이상</span>
										</div>
									</div>
									<div class="kidult">
										<label for="kid"><span class="modal__title">유/소아</span></label>
										<div class="buttons">
											<input type="button" name="kid" id="minus_kid"
												class="kidult_btn" value="-"> <span id="kid_number"
												class="bold">0</span> <input type="button" name="kid"
												id="plus_kid" class="kidult_btn" value="+"> <span>만
												0 - 15세이상</span>
										</div>
									</div>
									<div class="notify">
										<p>여행 시 탑승객의 나이는 예약된 연령 범주에 부합해야 합니다. 항공사는 만 18세 미만의 단독 여행
											탑승객에 대한 제한이 있습니다.</p>
										<p>유/소아 동반 여행 시 연령 제한과 정책은 항공사별로 다를 수 있으니 예약하기 전에 해당 항공사와
											확인하시기 바랍니다.</p>
									</div>
									<a class="modal_close_btn" id="passenger_submit-btn">완료</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="flight-type-filter__wrap">
					<div class="flight-filter-data">
						<label for="nonstop" class="label__original"> <input
							type="checkbox" id="nonstop" name="non_stop" value="직항">&nbsp;&nbsp;직항만
							<span class="new__checkbox"></span>
						</label> <label for="flexible" class="label__original"> <input
							type="checkbox" id="flexible" name="flexible">&nbsp;&nbsp;변경
							가능 항공권만 보기 <span class="new__checkbox"></span>
						</label>
					</div>
				</div>

				<div class="submit-button__wrap">
					<button type="submit" id="form_submit"> 
					항공권 검색<span class="submit-button"></span>
                	</button>
				</div>

			</div>

			<!-- modal start -->
			<div id="my_modal_hb">
				<div class="modal__dialog">
					<div class="modal__content">
						<div class="modal__body">
							<div class="modal__header">
								<h4 class="modal__title">도시 검색</h4>
								<button type="button" class="modal__close"></button>
							</div>
							<hr>
							<div class="modal__search">
								<input class="modal__search-input" type="text"
									placeholder="    여행하실 도시를 입력하세요.">
								<button>검색</button>
							</div>
							<div class="modal__city-selector">
								<h4 class="modal__title">주요 도시 선택</h4>
								<div class="modal__table">
									<table>
										<tbody class="modal__table-body">
											<tr>
												<th>일본</th>
												<td>
													<ul class="city_list">
														<li><a href="#">도쿄/나리타</a></li>
														<li><a href="#">오사카</a></li>
														<li><a href="#">도쿄/하네다</a></li>
														<li><a href="#">후쿠오카</a></li>
														<li><a href="#">오키나와</a></li>
														<li><a href="#">센다이</a></li>
														<li><a href="#">삿포로</a></li>
														<li><a href="#">나고야</a></li>
													</ul>
												</td>
											</tr>
											<tr>
												<th>중국</th>
												<td>
													<ul class="city_list">
														<li><a href="#">상해/푸동</a></li>
														<li><a href="#">청도</a></li>
														<li><a href="#">상해/홍차오</a></li>
														<li><a href="#">북경</a></li>
														<li><a href="#">연길</a></li>
														<li><a href="#">심양</a></li>
														<li><a href="#">대련</a></li>
														<li><a href="#">위해</a></li>
													</ul>
												</td>
											</tr>
											<tr>
												<th>아시아</th>
												<td>
													<ul class="city_list">
														<li><a href="#">다낭</a></li>
														<li><a href="#">대만/타오위안</a></li>
														<li><a href="#">방콕</a></li>
														<li><a href="#">세부</a></li>
														<li><a href="#">하노이</a></li>
														<li><a href="#">싱가포르</a></li>
														<li><a href="#">코타키나발루</a></li>
														<li><a href="#">마닐라</a></li>
													</ul>
												</td>
											</tr>
											<tr>
												<th>미주/중남미</th>
												<td>
													<ul class="city_list">
														<li><a href="#">하와이/호놀룰루</a></li>
														<li><a href="#">샌프란시스크</a></li>
														<li><a href="#">로스앤젤레스</a></li>
														<li><a href="#">뉴욕</a></li>
														<li><a href="#">벤쿠버</a></li>
														<li><a href="#">라스베가스</a></li>
														<li><a href="#">토론토</a></li>
														<li><a href="#">시애틀</a></li>
													</ul>
												</td>
											</tr>
											<tr>
												<th>유럽</th>
												<td>
													<ul class="city_list">
														<li><a href="#">바르셀로나</a></li>
														<li><a href="#">로마</a></li>
														<li><a href="#">프랑크푸르트</a></li>
														<li><a href="#">이스탄불</a></li>
														<li><a href="#">런던</a></li>
														<li><a href="#">마드리드</a></li>
														<li><a href="#">파리</a></li>
														<li><a href="#">블라디보스토크</a></li>
													</ul>
												</td>
											</tr>
											<tr>
												<th>대양주</th>
												<td>
													<ul class="city_list">
														<li><a href="#">괌</a></li>
														<li><a href="#">오클랜드</a></li>
														<li><a href="#">사이판</a></li>
														<li><a href="#">시드니</a></li>
														<li><a href="#">브리즈번</a></li>
														<li><a href="#">크라이스트처치</a></li>
														<li><a href="#">멜버른</a></li>
														<li><a href="#">골드코스트</a></li>
													</ul>
												</td>
											</tr>
											<tr>
												<th>중동/아프리카</th>
												<td>
													<ul class="city_list">
														<li><a href="#">두바이</a></li>
														<li><a href="#">요하네스버그</a></li>
														<li><a href="#">카이로</a></li>
														<li><a href="#">텔아비브</a></li>
														<li><a href="#">도하</a></li>
														<li><a href="#">카사블랑카</a></li>
														<li><a href="#">나이로비</a></li>
														<li><a href="#">아디스 아바바</a></li>
													</ul>
												</td>
											</tr>
											<tr>
												<th>국내</th>
												<td>
													<ul class="city_list">
														<li><a href="#">인천</a></li>
														<li><a href="#">제주</a></li>
														<li><a href="#">김포</a></li>
														<li><a href="#">부산</a></li>
														<li><a href="#">대구</a></li>
														<li><a href="#">무안</a></li>
														<li><a href="#">광주</a></li>
														<li><a href="#">청주</a></li>
													</ul>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- modal end -->
		</div>
	</section>
</form>
<script>

/* modal-location search */
function modal_location(id) {
  const zIndex = 10;
  const modal_location = document.getElementById(id);
  const bg = document.createElement("div");
  bg.setStyle({
    position: "fixed",
    zIndex: zIndex,
    left: "0px",
    top: "0px",
    width: "100%",
    height: "100%",
    overflow: "auto",
    backgroundColor: "rgba(0,0,0,0.4)",
  });
  document.body.append(bg);

  modal_location
    .querySelector(".modal__close")
    .addEventListener("click", function () {
      bg.remove();
      modal_location.style.display = "none";
    });

  modal_location.setStyle({
    position: "fixed",
    display: "block",
    boxShadow:
      "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",
    zIndex: zIndex + 1,
    top: "50%",
    left: "50%",
    transform: "translate(-50%, -50%)",
    msTransform: "translate(-50%, -50%)",
    webkitTransform: "translate(-50%, -50%)",
  });

  $(".city_list a").on("click", function () {
    bg.remove();
    modal_location.style.display = "none";
  });
}

Element.prototype.setStyle = function (styles) {
  for (let k in styles) this.style[k] = styles[k];
  return this;
};

let idValue;

let cityClick = (e) => {
  modal_location("my_modal_hb");
  idValue = e.target.id;
};

document.getElementById("departure").addEventListener("click", cityClick);
document.getElementById("destination").addEventListener("click", cityClick);

document.querySelectorAll(".city_list li a").forEach((el) => {
  el.addEventListener(
    "click",
    (e) => (document.getElementById(idValue).value = e.currentTarget.text)
  );
});

/* modal - passengerSeats */
function passengerSeats__modal(id) {
  const zIndex = 9999;
  const passengerSeats__modal = document.getElementById(id);
  // 모달 div 뒤에 희끄무레한 레이어
  const bg = document.createElement("div");
  bg.setStyle({
    position: "fixed",
    zIndex: zIndex,
    left: "0px",
    top: "0px",
    width: "100%",
    height: "100%",
    overflow: "auto",
    // 레이어 색갈은 여기서 바꾸면 됨
    backgroundColor: "rgba(0,0,0,0.4)",
  });
  document.body.append(bg);
  // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
  passengerSeats__modal
    .querySelector(".modal_close_btn")
    .addEventListener("click", function () {
      //값넘기고 모달창끄기
     	//var seatGradeVal = document.getElementById('seatGrade');
      	//seatGradeVal.value = Integer.parseInt(adult_n) + Integer.parseInt(kid_n) +"승객,"
      bg.remove();
      passengerSeats__modal.style.display = "none";
    });

  passengerSeats__modal.setStyle({
    position: "fixed",
    display: "block",
    boxShadow:
      "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",
    // 시꺼먼 레이어 보다 한칸 위에 보이기
    zIndex: zIndex + 1,
    // div center 정렬
    top: "50%",
    left: "50%",
    transform: "translate(-50%, -50%)",
    msTransform: "translate(-50%, -50%)",
    webkitTransform: "translate(-50%, -50%)",
  });
}
// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function (styles) {
  for (let k in styles) this.style[k] = styles[k];
  return this;
};

document.getElementById("seat-grade").addEventListener("click", function () {
  // 모달창 띄우기
  passengerSeats__modal("my_modal");
});

$("#passenger_submit-btn").on("click", function(){
  var passenger_sum = parseInt(adult_n.innerText) + parseInt(kid_n.innerText);
  var selected_seat = $("#seatGrade option:selected").text();
  $("#seat-grade").val(passenger_sum + " 승객, "+ selected_seat);
});

/* modal - passengerSeats 모달창 내부사항 */
//btn mapping
const minus_a = document.getElementById("minus_adult");
const plus_a = document.getElementById("plus_adult");
const minus_k = document.getElementById("minus_kid");
const plus_k = document.getElementById("plus_kid");
//span mapping
let adult_n = document.getElementById("adult_number");
let kid_n = document.getElementById("kid_number");
//init number
let Adult_initNum = 1;
let kid_initNum = 0;
var alertmesgA = document.getElementById("alertmesg_adult");
var alertmesgK = document.getElementById("alertmesg_kid");

minus_a.addEventListener("click", function () {
  if (adult_n.innerText == 1) {
    Adult_initNum = 1;
    alertmesgA.innerText = "** 최소 1명 이상의 성인 승객 선택이 필요합니다";
  } else {
    Adult_initNum--;
  }
  adult_n.innerText = Adult_initNum;
});
plus_a.addEventListener("click", function () {
  if (adult_n.innerText == 8) {
    Adult_initNum = 8;
    alertmesgA.innerText = "** 최대 8명 까지의 성인 승객만 선택할 수 있습니다.";
  } else {
    Adult_initNum++;
  }
  adult_n.innerText = Adult_initNum;
});

minus_k.addEventListener("click", function () {
  if (kid_n.innerText == 0) {
    kid_initNum = 0;
  } else {
    kid_initNum--;
  }
  kid_n.innerText = kid_initNum;
});
plus_k.addEventListener("click", function () {
  if (kid_n.innerText == 8) {
    kid_initNum = 8;
    alertmesgK.innerText = "** 최소 1명 이상의 유아 승객 선택이 필요합니다";
  } else {
    kid_initNum++;
  }
  kid_n.innerText = kid_initNum;
});

/* 출발날짜 모달  */
$("#departure-date").datepicker({
    dateFormat: 'yy.mm.dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: [
        '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
    ],
    monthNamesShort: [
        '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
    ],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: false,
    changeYear: false,
    yearSuffix: '년',
    onClose: function (selectedDate) {
        $("#arrival-date").datepicker("option", "minDate", selectedDate);
    }
});



/* 도착날짜 모달  */
$("#arrival-date").datepicker({
    dateFormat: 'yy.mm.dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: [
        '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
    ],
    monthNamesShort: [
        '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
    ],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: false,
    changeYear: false,
    yearSuffix: '년',
    onClose: function (selectedDate) {
        $("#departure-date").datepicker("option", "maxDate", selectedDate);
    }
});

/* Q&A */
const accordionBtn = document.querySelectorAll(".board__title");
const acoordionText = document.querySelectorAll(".board__contents");

accordionBtn.forEach((el) => {
  //console.log(el);
  el.addEventListener("click", toggleAccordion);
});

function toggleAccordion(el) {
  // currentTartget  -> 이벤트 위치가 걸려있는 위치를 반환
  // nextElementSibling --> 바로 다음 형제요소

  const targetText = el.currentTarget.nextElementSibling.classList;

  if (targetText.contains("active")) {
    targetText.remove("active");
  } else {
    targetText.add("active");
  }
}

</script>