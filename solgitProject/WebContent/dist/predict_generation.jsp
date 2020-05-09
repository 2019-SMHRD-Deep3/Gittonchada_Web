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

.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.2); /*not in ie */
	z-index: 100;
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
	z-index: 101;
}

.display-none { /*감추기*/
	display: none;
}
</style>
</head>
<body class="nav-fixed">
<div class="wrap-loading display-none">
      <div>
         <img src="./assets/img/loadingbar.gif" />
      </div>
   </div>
<%
      MemberDTO info = (MemberDTO) session.getAttribute("info");
   	%>
	<!-- 네비게이션바 코드 -->
		<nav class="navbar navbar-expand-sm navbar-collapse navbar-dark fixed-top bg-default" font-size="50" font-family="Verdana" x="0" y="100"  style="	background-color: rgba(0, 0, 0, 0.5) !important;">
			
			<!-- 회사명, 로고 -->
			<div class="container-fluid">
			<div class="navbar-header">
			<a class="navbar-brand" href="mainpage.jsp"><img src="./assets/img/solgit_logo2.png" alt="Logo" style="text-size=5rem; width:100px;"></a>
			</div>
			<!-- 반응형 버튼 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar"><span class="navbar-toggler-icon"></span></button>
			
			<!-- 메뉴바 내용 -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar" style="width: 200px;">
				<!-- 메뉴 타이틀 -->
				<ul class="nav navbar-nav nav-pills nav-justified ml-auto"> <!--  ml-auto ml-md-5 -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="font-size:20px;">데이터 등록</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="board_load.jsp">발전이력 등록</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="font-size:20px;">인공지능 분석</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="predict_weather.jsp">기상예보</a>
							<a class="dropdown-item" href="predict_generation.jsp">발전량 예측</a>
							<a class="dropdown-item" href="predict_benefit.jsp">SMP 예측</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="font-size:20px;">정보 공유</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="board_notice.jsp">공지사항</a>
							<a class="dropdown-item" href="board_community.jsp">커뮤니티</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="font-size:20px;">Contact us</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="customer_app.jsp">앱 지원</a>
							<a class="dropdown-item" href="customer_faq.jsp">고객센터</a>
						</div>
					</li>
				</ul>
				</div>
	            
				<!-- 메뉴 로그인 등 -->
				
				<div class="collapse navbar-collapse" id="collapsibleNavbar" style="width: 5px; flex-direction: row-reverse;">
					<%
	                  if (info == null) {
	                %>
	            	<a class="btn btn-light" href="login.jsp" style="font-size:15px; margin-left:10px;">로그인</a>
	            	<a class="btn btn-light" href="register.jsp" style="font-size:15px;">회원가입</a>
	            	
	            	<%
	                  } else {
	                %>
	            	<a class="btn btn-light" href="LogoutService.do">로그아웃</a>
	            	<%
	                  }
	                %>
	            </div>
	            </div>
				
		</nav>

	<!-- 메인 내용 작성 부분 -->
	<main>
		<div class="card container-sm"
			style="margin-top: 150px; margin-bottom: 100px; padding-right: 0px; padding-left: 0px;">
			<div class="card-header" style="margin-top: 0px; margin-left: 0px;">
				<h3 style="float:left;">발전량 예측</h3>
				<button style="float:right;" class="btn_table" style="padding: 3px">표</button>
				<button style="float:right;" class="btn_chart" style="padding: 3px">차트</button>
				<button style="float:right;" class="btn_all" style="padding: 3px">모두</button>
			</div>
			<div class="card mb-4 display_chart">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i>시간별 일사·일조·발전량
				</div>
				<div class="card-body">
					<canvas id="myLineChart2" width="100%" height="30"></canvas>
				</div>
				<div class="card-footer small text-muted">※본 일사·일조·발전량은 머신러닝
					분석으로 예측한 결과이므로 참고만 하시기 바랍니다.※</div>
			</div>
			<div class="card-header display_table">
				<i class="fas fa-table mr-1"></i>표(Table)
			</div>
			<div class="card-body display_table">
				<div style="width: 60%; float: left;">
					<table
						class="table table-bordered table-striped table-hover table-condensed info"
						width="100%" id="dataTable" cellspacing="0">
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
				<div class="table table-responsive"
					style="width: 40%; float: right;">
					<table
						class="table table-bordered table-striped table-hover table-condensed"
						width="100%" cellspacing="0">
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
		<footer class="py-4 bg-light mt-auto">
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
	</main>
	<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script>
		var times = [];
		var radis = [];
		var shines = [];
		var gens = [];

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

								// 값 전달 및 테이블 구축
								//hourly_time(일자)
								var dayValue = document.createElement("td");
								dayValue.innerHTML = (hourly_month + "월　"
										+ hourly_day + "일");

								//hourly_time(시간)
								var timeValue = document.createElement("td");
								timeValue.innerHTML = hourly_time + " 시";

								//hourly_temp(기온)
								var tempValue = document.createElement("td");
								tempValue.innerHTML = hourly_temp.toFixed(1)
										+ " ℃";

								//hourly_humidity(습도)
								var hmdValue = document.createElement("td");
								hmdValue.innerHTML = hourly_humidity + " %";

								//hourly_rain(강수)
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

								times.push(hourly_day + " 일 " + hourly_time
										+ " 시");

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

												if (hourly_time > 5
														&& hourly_time < 20) {
													if (rs.solar_radiation > 0) {
														solar_radiation = rs.solar_radiation;
													}
													if (rs.solar_sunshine > 0) {
														solar_sunshine = rs.solar_sunshine;
													}
													if (rs.solar_generation > 0) {
														solar_generation = parseInt(rs.solar_generation);
													}
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

												radis.push(solar_radiation
														.toFixed(2));
												shines.push(solar_sunshine
														.toFixed(0));
												gens.push(solar_generation);

												if (gens[47] == null) {
													$('.wrap-loading')
															.removeClass(
																	'display-none');
												} else if (gens[47] != null) {
													$('.wrap-loading')
															.addClass(
																	'display-none');
												}

												// 차트 
												Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
												Chart.defaults.global.defaultFontColor = '#292b2c';

												var ctx = document
														.getElementById("myLineChart2");
												var myLineChart = new Chart(
														ctx,
														{
															type : 'line',

															data : {
																labels : times,

																datasets : [
																		{
																			label : "일사량",
																			lineTension : 0.3,
																			backgroundColor : "rgba(255,255,255,0)",
																			borderColor : "rgba(255, 230, 221,1)",
																			pointRadius : 5,
																			pointBackgroundColor : "rgba(255, 230, 221,1)",
																			pointBorderColor : "rgba(255,255,255,0.8)",
																			pointHoverRadius : 5,
																			pointHoverBackgroundColor : "rgba(255, 230, 221,1)",
																			pointHitRadius : 100,
																			pointBorderWidth : 5,
																			data : radis,
																		},
																		{
																			label : "일조시간",
																			lineTension : 0.3,
																			backgroundColor : "rgba(255,255,255,0)",
																			borderColor : "rgba(255, 180, 153,1)",
																			pointRadius : 5,
																			pointBackgroundColor : "rgba(255, 180, 153,1)",
																			pointBorderColor : "rgba(255,255,255,0.8)",
																			pointHoverRadius : 5,
																			pointHoverBackgroundColor : "rgba(255, 180, 153,1)",
																			pointHitRadius : 60,
																			pointBorderWidth : 3,
																			data : shines,
																		},
																		{
																			label : "발전량",
																			lineTension : 0.3,
																			backgroundColor : "rgba(255,255,255,0)",
																			borderColor : "rgba(255, 131, 85,1)",
																			pointRadius : 5,
																			pointBackgroundColor : "rgba(255, 131, 85,1)",
																			pointBorderColor : "rgba(255,255,255,0.8)",
																			pointHoverRadius : 5,
																			pointHoverBackgroundColor : "rgba(255, 131, 85,1)",
																			pointHitRadius : 20,
																			pointBorderWidth : 1,
																			data : gens,
																		} ],
															},

															options : {
																scales : {
																	xAxes : [ {
																		time : {
																			unit : '시간'
																		},
																		gridLines : {
																			display : true
																		},
																		ticks : {
																			maxTicksLimit : 48
																		}
																	} ],
																	yAxes : [ {
																		ticks : {
																			min : 0,
																			max : 100,
																			maxTicksLimit : 20
																		},
																		display : true,
																		ticks : {
																			suggestedMin : 100,
																		},
																		scaleLabel : {
																			display : true,
																			labelString : ''
																		}
																	} ]
																},
																legend : {
																	display : true
																}
															}
														});
											}

										});
							}
							
							
							
						});
		
		/* }); */
		$(function() {
			$('.btn_table').click(function() {
				$('.display_chart').hide();
				$('.display_table').show();
			});
			$('.btn_chart').click(function() {
				$('.display_table').hide();
				$('.display_chart').show();
			});
			$('.btn_all').click(function() {
				$('.display_table').show();
				$('.display_chart').show();
			});

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
	<script src="assets/demo/datatables-demo.js?ver=1"></script>
</body>
</html>