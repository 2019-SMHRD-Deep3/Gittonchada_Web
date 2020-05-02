<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>SOLGIT-솔깃한 정보 공유 플랫폼</title>
<link href="css/styles.css?ver=1" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css?ver=1"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js?ver=1"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
#table-div {
	margin-top: 100px;
}

@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 940px;
	}
}

#iconwt {
	width: 150px;
	height: 150px;
}

td {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body class="nav-fixed">

	<!-- 네비게이션바 코드 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">

		<!-- 회사명, 로고 -->
		<a class="navbar-brand" href="#"><img
			src="./assets/img/solgitIcon.png" alt="Logo" style="width: 40px;">솔깃</a>

		<!-- 반응형 버튼 -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- 메뉴바 내용 -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<!-- 메뉴 타이틀 -->
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">데이터 등록</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">발전이력 등록</a> <a
							class="dropdown-item" href="#">발전이력 갱신</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">인공지능 분석</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">기상예보</a> <a
							class="dropdown-item" href="#">발전량 예측</a> <a
							class="dropdown-item" href="#">수익 예측</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">정보 공유</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">커뮤니티</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">고객 센터</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">앱 지원</a> <a
							class="dropdown-item" href="#">FAQ</a>
					</div></li>
			</ul>

			<!-- 메뉴 로그인 등 -->
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="userDropdown" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="login.html">로그인</a> <a
							class="dropdown-item" href="register.html">회원가입</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="login.html">로그아웃</a>
					</div></li>
			</ul>

		</div>
	</nav>

	<!-- 메인 내용 작성 부분 -->
	<main>
		<!-- 메인 테이블 시작 -->
		<div class="card mb-4">
			<div class="card-header container-sm" style="margin-top: 100px;">
				<i class="fas fa-table mr-1"></i>DataTable Example
			</div>
			<div class="card-body container-sm">
				<div class="table" style="width: 50%; float:left;">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>날짜</th>
								<th>시간</th>
								<th>기온</th>
								<th>습도</th>
								<th>강수량</th>
							</tr>
						</thead>
						<tbody class="myValue">
						</tbody>
					</table>
				</div>
				<div class="table" style="width: 50%; float:right;">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>일사량</th>
								<th>일조량</th>
								<th>발전량</th>
							</tr>
						</thead>
						<tbody class="myPredict">
						</tbody>
					</table>
				</div>
			</div>
		</div>


		<!-- Footer -->
		<footer class="py-4 bg-light mt-auto fixed-bottom">
			<div class="container-fluid">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; 2020 © SOLGIT</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
		</div>
	</main>
	<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script>
		$
				.getJSON(
						'https://api.openweathermap.org/data/2.5/onecall?lat=35.15&lon=126.92&appid=dbf3abee8d29ca1bd9cefa8675b55c52&units=metric',
						// 광주 기상정보
						function(oneCall) {

							// Hourly Weather Data
							for (var index = 0; index < oneCall.hourly.length; index++) {
								// 시간
								var hourly_time = oneCall.hourly[index].dt;
								var hourly_now = new Date(hourly_time * 1000);
								var hourly_dt = hourly_now.getFullYear() + "-"
										+ (hourly_now.getMonth() + 1) + "-"
										+ hourly_now.getDate() + " "
										+ hourly_now.getHours() + ":"
										+ hourly_now.getMinutes() + " ";
								var hourly_month = hourly_now.getMonth() + 1;
								var hourly_day = hourly_now.getDate();
								var hourly_time = hourly_now.getHours();

								// 날씨
								var hourly_weather = oneCall.hourly[index].weather[0].description;

								// 날씨 아이콘
								var hourly_wIcon = oneCall.hourly[index].weather[0].icon;

								// 현재 기온
								var hourly_temp = oneCall.hourly[index].temp;

								// 체감 기온
								var hourly_feels_like = oneCall.hourly[index].feels_like;

								// 기압
								var hourly_pressure = oneCall.hourly[index].pressure;

								// 습도
								var hourly_humidity = oneCall.hourly[index].humidity;

								// 이슬점
								var hourly_dew_point = oneCall.hourly[index].dew_point;

								// 운량
								var hourly_clouds = parseInt(oneCall.hourly[index].clouds / 10);

								// 풍속
								var hourly_wind_speed = oneCall.hourly[index].wind_speed;

								// 풍향
								var hourly_wind_deg = oneCall.hourly[index].wind_deg;

								// 강수량
								var hourly_rain;
								if (oneCall.hourly[index].rain != null) {
									hourly_rain = oneCall.hourly[index].rain["1h"];
								} else {
									hourly_rain = 0;
								}

								// 적설량
								var hourly_snow;
								if (oneCall.hourly[index].snow != null) {
									hourly_snow = oneCall.hourly[index].snow["1h"];
								} else {
									hourly_snow = 0;
								}

								// 일사량
								var solar_radiation = 0;

								// 일조량
								var solar_sunshine = 0;

								// 발전량
								var generation = 0;

								// 값 전달하는 부분
								//hourly_time
								var dayValue = document.createElement("td");
								dayValue.innerHTML = (hourly_month + "월　"
										+ hourly_day + "일");

								//hourly_time
								var timeValue = document.createElement("td");
								timeValue.innerHTML = hourly_time + " 시";

								//hourly_temp
								var tempValue = document.createElement("td");
								tempValue.innerHTML = hourly_temp.toFixed(1) + " ℃";

								//hourly_humidity
								var hmdValue = document.createElement("td");
								hmdValue.innerHTML = hourly_humidity + " %";

								//hourly_rain
								var rainValue = document.createElement("td");
								rainValue.innerHTML = hourly_rain + " mm";

								var selector = document
										.querySelector(".myValue");
								var lineValue = document.createElement("tr");
								selector.appendChild(dayValue);
								selector.appendChild(timeValue);
								selector.appendChild(tempValue);
								selector.appendChild(hmdValue);
								selector.appendChild(rainValue);
								selector.appendChild(lineValue);

								//solar_radiation
								/* var radValue = document.createElement("td");
								radValue.innerHTML=solar_radiation;
								console.log(radValue);
								//solar_sunshine
								var sunValue = document.createElement("td");
								sunValue.innerHTML=solar_sunshine;
								console.log(sunValue);
								
								//solar_generation
								var genValue = document.createElement("td");
								genValue.innerHTML=solar_generation;
								
								selector.appendChild(radValue);
								selector.appendChild(sunValue);
								selector.appendChild(genValue); */

								$
										.ajax({
											url : "http://localhost:9000/re/"
													+ hourly_month + "/"
													+ hourly_day + "/"
													+ hourly_time + "/"
													+ hourly_temp + "/"
													+ hourly_rain + "/"
													+ hourly_wind_speed + "/"
													+ hourly_wind_deg + "/"
													+ hourly_humidity + "/"
													+ hourly_clouds,
											method : "POST",
											success : function(rs) {
												if (rs.solar_radiation > 0) {
													solar_radiation = rs.solar_radiation;
												}
												if (rs.solar_sunshine > 0) {
													solar_sunshine = rs.solar_sunshine;
												}
												if (rs.solar_generation > 0) {
													solar_generation = parseInt(rs.solar_generation);
												}

												var selector = document
														.querySelector(".myPredict");
												var lineValue = document
														.createElement("tr");

												var radiationValue = document
														.createElement("td");
												radiationValue.innerHTML = solar_radiation
														.toFixed(2)
														+ " MJ/m2";

												var sunshineValue = document
														.createElement("td");
												sunshineValue.innerHTML = solar_sunshine
														.toFixed(2)
														+ " hr";

												var generationValue = document
														.createElement("td");
												generationValue.innerHTML = solar_generation
														+ " kWh";

												selector
														.appendChild(radiationValue);
												selector
														.appendChild(sunshineValue);
												selector
														.appendChild(generationValue);
												selector.appendChild(lineValue);

											}
										});
							}
						});
	</script>






	<script
		type="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script
		type="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css?ver=1"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js?ver=1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js?ver=1"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js?ver=1"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js?ver=1"
		crossorigin="anonymous"></script>
	<!-- <script src="assets/demo/chart-area-demo.js?ver=1"></script>
		<script src="assets/demo/chart-bar-demo.js?ver=1"></script>
		<script src="assets/demo/chart-pie-demo.js?ver=1"></script> -->
	<script src="assets/demo/datatables-demo.js?ver=1"></script>
</body>
</html>
