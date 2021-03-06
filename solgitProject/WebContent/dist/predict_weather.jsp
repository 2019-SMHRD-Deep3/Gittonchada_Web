<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<title>SOLGIT-솔깃한 정보 공유 플랫폼</title>
		<link href="css/styles.css?ver=1" rel="stylesheet" />
		<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css?ver=1" rel="stylesheet" crossorigin="anonymous" />
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js?ver=1" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		<style>
			#table-div {
				margin-top: 100px;
			}
			@media (min-width: 768px) {
			  .container {
			    width: 750px;
			  }
			}
			@media (min-width: 992px) {
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
	<body class="nav-fixed" onload="showClock()">
	
	<div class="wrap-loading display-none">
		<div>
			<img src="./assets/img/loadingbar.gif" />
		</div>
	</div>
	
	<!-- 네비게이션바 코드 -->
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
							<%if(info!=null && info.getManager()==1){ %><a class="dropdown-item" href="board_load_M.jsp">발전이력 확인</a><%} %>
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
	                <a class="btn btn-light" href="user_info.jsp" style="font-size:15px; margin-left:10px;">내정보</a>
	            	<a class="btn btn-light" href="LogoutService.do">로그아웃</a>
	            	<%
	                  }
	                %>
	            </div>
	            </div>
				
		</nav>
		
		<!-- 메인 내용 작성 부분 -->
		<main>
			<div class="card container-sm" style="margin-top: 150px;margin-bottom: 50px;padding-right: 0px;padding-left: 0px;">
			<div class="card-header" style="margin-top: 0px; margin-left: 0px;"><h3><span class="dt"></h3>
			</div>
                	<div class="card-header"><i class="fas fa-table mr-1"></i></span>현재 날씨</div>
                    	<div class="card-body">
                            <div class="table-responsive-sm">
                            	<div class="current">
	                                <table class="table table-bordered" id="dataTable">
	                                    <thead>
	                                        <tr>
	                                            <th colspan="4">위치 : <span class=timezone></span></th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td class="wIcon" rowspan="2" colspan="2"></td>
	                                            <td class="temp" colspan="2"><p>온도</p></td>
	                                        </tr>
	                                        <tr>
	                                            <td class="humidity" colspan="2"><p>습도</p></td>
	                                        </tr>
	                                        <tr>
	                                            <td class="clouds"><p>운량</p></td>
	                                            <td class="wind_speed"><p>풍속</p></td>
	                                            <td class="sunrise"><p>일출</p></td>
	                                            <td class="sunset"><p>일몰</p></td>
	                                        </tr>
                                    	</tbody>
	                                </table>
	                        	</div>
                        	</div>
                    	</div>
                    	<!-- 꺽은선 그래프 -->
                    	<div class="card mb-4">
                            <div class="card-header"><i class="fas fa-chart-area mr-1"></i>시간별 기온</div>
                            <div class="card-body"><canvas id="myLineChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted"><div id="divClock" class="clock"></div></div>
                        </div>
                </div>
			
		
		<!-- Footer -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 2020 © SOLGIT</div>
							<div><a href="#">Privacy Policy</a>  &middot; <a href="#">Terms	&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</main>
		<script src="http://code.jquery.com/jquery-1.7.min.js"></script>
		<script>
			// latitude, longitude, APIKey
			$.getJSON(
					'https://api.openweathermap.org/data/2.5/onecall?lat=37.57&lon=126.98&appid=dbf3abee8d29ca1bd9cefa8675b55c52&units=metric',
					function(oneCall) {
						
						//위도
						var lat = oneCall.lat;
						// 경도
						var lon = oneCall.lon;
						// 지역
						var timezone = oneCall.timezone;

						// Current Weather Data
						// 현재 시간
						var time = oneCall.current.dt;
						var now = new Date(time * 1000);
						var dt = now.getFullYear() + "년 " + (now.getMonth() + 1)
								+ "월 " + now.getDate() + "일 " + now.getHours()
								+ "시 " /* + now.getMinutes() + " "; */

						// 일출 시간
						var sunUp = oneCall.current.sunrise;
						var rTime = new Date(sunUp * 1000);
						var sunrise = rTime.getHours() + "시 "
								+ rTime.getMinutes() + "분";

						// 일몰 시간
						var sunDown = oneCall.current.sunset;
						var sTime = new Date(sunDown * 1000);
						var sunset = sTime.getHours() + "시 "
								+ sTime.getMinutes() + "분";

						// 현재 날씨
						var weather = oneCall.current.weather[0].description;

						// 날씨 아이콘
						var wIcon = oneCall.current.weather[0].icon;

						// 현재 기온
						var temp = oneCall.current.temp.toFixed(1) + " ℃";

						// 체감 기온
						var feels_like = oneCall.current.feels_like + " ℃";

						// 기압
						var pressure = oneCall.current.pressure;

						// 습도
						var humidity = oneCall.current.humidity + " %";

						// 이슬점
						var dew_point = oneCall.current.dew_point;

						// 자외선
						var uvi = oneCall.current.uvi;

						// 운량
						var clouds = parseInt(oneCall.current.clouds / 10) + " %";

						// 가시거리
						var visibility = oneCall.current.visibility;

						// 풍속
						var wind_speed = oneCall.current.wind_speed + " m/s";

						// 풍향
						var wind_deg = oneCall.current.wind_deg;

						// 강수량
						var rain;
						if(oneCall.current.rain != null){
							rain = oneCall.current.rain;
						}else{
							rain = 0;
						}
						
						// 적설량
						var snow;
						if(oneCall.current.snow != null){
							snow = oneCall.current.snow;
						}else{
							snow = 0;
						}
						
						// 날씨 아이콘 변경
						var weathers
						
						if (wIcon == '01d' || wIcon == '01n') {
							wIcons = 'clear_sky';
							weathers = '맑음';
						} else if (wIcon == '02d' || wIcon == '02n') {
							wIcons = 'few_clouds';
							weathers = '구름 조금';
						} else if (wIcon == '03d' || wIcon == '03n' || wIcon == '04d' || wIcon == '04n') {
							wIcons = 'scattered_clouds';
							weathers = '구름';
						} else if (wIcon == '09d' || wIcon == '09n' || wIcon == '10d' || wIcon == '10n') {
							wIcons = 'rain';
							weathers = '비';
						} else if (wIcon == '11d' || wIcon == '11n') {
							wIcons = 'thunderstorm';
							weathers = '번개';
						} else if (wIcon == '13d' || wIcon == '13n') {
							wIcons = 'snow';
							weathers = '눈';
						} else {
							wIcons = 'mist';
							weathers = '안개';
						}

						$('.lat').append(lat);
						$('.lon').append(lon);
						$('.dt').append(dt);
						$('.timezone').append(timezone);
						$('.sunrise').append(sunrise);
						$('.sunset').append(sunset);
						$('.weather').append(weather);
						$('.wIcon')
								.append(
										'<img id="iconwt" src = "./assets/img/' + wIcons + '.png"/><div style="margin-top: 10px;">' + weathers + '</div>')
						$('.temp').append(temp);
						$('.feels_like').append(feels_like);
						$('.pressure').append(pressure);
						$('.humidity').append(humidity);
						$('.dew_point').append(dew_point);
						$('.uvi').append(uvi);
						$('.clouds').append(clouds);
						$('.visibility').append(visibility);
						$('.wind_speed').append(wind_speed);
						$('.wind_deg').append(wind_deg);
						$('.rain').append(rain);
						$('.snow').append(snow);
					});
		</script>
		<script language="javascript">
		    function showClock(){
		        var currentDate = new Date();
		        var divClock = document.getElementById("divClock");
		         
		        var msg = "현재 시각 : "+currentDate.getHours()+"시 "
		        msg += currentDate.getMinutes()+"분 ";
		         
		        divClock.innerText = msg;
		        setTimeout(showClock,1000);
		    }
		</script>
		<script>
		var times = [];
		var temps = [];
		var hmds = [];
		var winds = [];
		$.getJSON(
			'https://api.openweathermap.org/data/2.5/onecall?lat=37.57&lon=126.98&appid=dbf3abee8d29ca1bd9cefa8675b55c52&units=metric',
			function(oneCall) {
				// Hourly Weather Data
				for (var index = 0; index < oneCall.hourly.length; index++) {
	
					// 시간
					var hourly_time = oneCall.hourly[index].dt;
					var hourly_now = new Date(hourly_time * 1000);
					var hourly_dt = hourly_now.getHours()+"시";
					
					// 현재 기온
					var hourly_temp = oneCall.hourly[index].temp;
					
					// 현재 습도
					var hourly_humidity = oneCall.hourly[index].humidity;
					
					// 현재 풍속
					var hourly_wind_speed = oneCall.hourly[index].wind_speed;

					
					times.push(hourly_dt);
					temps.push(hourly_temp.toFixed(1));
					hmds.push(hourly_humidity);
					winds.push(hourly_wind_speed);
					
					if (times[47] == null) {
						$('.wrap-loading')
								.removeClass(
										'display-none');
					} else if (times[47] != null) {
						$('.wrap-loading')
								.addClass(
										'display-none');
					}
				}
				
				Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
				Chart.defaults.global.defaultFontColor = '#292b2c';

				// Area Chart Example
				var ctx = document.getElementById("myLineChart");
				var myLineChart = new Chart(ctx, {
				  type: 'line',
				  
				  data: {
				    labels: [times[0],times[1],times[2],times[3],times[4],times[5],times[6],times[7],times[8],times[9],times[10],times[11],times[12]],
				    
				    datasets: [{
				      label: "기온",
				      lineTension: 0.3,
				      backgroundColor: "rgba(255,255,255,0)",
				      borderColor: "rgba(255, 230, 221,1)",
				      pointRadius: 5,
				      pointBackgroundColor: "rgba(255, 230, 221,1)",
				      pointBorderColor: "rgba(255,255,255,0.8)",
				      pointHoverRadius: 5,
				      pointHoverBackgroundColor: "rgba(255, 230, 221,1)",
				      pointHitRadius: 100,
				      pointBorderWidth: 3,
				      data: [temps[0],temps[1],temps[2],temps[3],temps[4],temps[5],temps[6],temps[7],temps[8],temps[9],temps[10],temps[11],temps[12]],
				    },{
				      label: "습도",
				      lineTension: 0.2,
				      backgroundColor: "rgba(255,255,255,0)",
				      borderColor: "rgba(255, 180, 153,1)",
				      pointRadius: 5,
				      pointBackgroundColor: "rgba(255, 180, 153,1)",
				      pointBorderColor: "rgba(255,255,255,0.8)",
				      pointHoverRadius: 5,
				      pointHoverBackgroundColor: "rgba(255, 180, 153,1)",
				      pointHitRadius: 50,
				      pointBorderWidth: 2,
				      data: [hmds[0],hmds[1],hmds[2],hmds[3],hmds[4],hmds[5],hmds[6],hmds[7],hmds[8],hmds[9],hmds[10],hmds[11],hmds[12]],
				    },{
				      label: "풍속",
				      lineTension: 0.1,
				      backgroundColor: "rgba(255,255,255,0)",
				      borderColor: "rgba(255, 131, 85,1)",
				      pointRadius: 5,
				      pointBackgroundColor: "rgba(255, 131, 85,1)",
				      pointBorderColor: "rgba(255,255,255,0.8)",
				      pointHoverRadius: 5,
				      pointHoverBackgroundColor: "rgba(255, 131, 85,1)",
				      pointHitRadius: 10,
				      pointBorderWidth: 1,
				      data: [winds[0],winds[1],winds[2],winds[3],winds[4],winds[5],winds[6],winds[7],winds[8],winds[9],winds[10],winds[11],winds[12]],
				    }
				    ],
				  },
				  
				  options: {
				    scales: {
				      xAxes: [{
				        time: {
				          unit: '시간'
				        },
				        gridLines: {
				          display: true
				        },
				        ticks: {
				          maxTicksLimit: 13
				        }
				      }],
				      yAxes: [{
				    	 	 ticks: {
					          min: 0,
					          max: 100,
					          maxTicksLimit: 20
					        },
			                display: true,
			                ticks: {
			                    suggestedMin: 100,
			                },
			                scaleLabel: {
			                    display: true,
			                    labelString: ''
			                }
			            }]
				    },
				    legend: {
				      display: true
				    }
				  }
				});
			});
		</script>
		
		
        <script src="https://code.jquery.com/jquery-3.4.1.min.js?ver=1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js?ver=1" crossorigin="anonymous"></script>
        <script src="js/scripts.js?ver=1"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js?ver=1" crossorigin="anonymous"></script>
		<!-- <script src="assets/demo/current-temp-chart.js?ver=1"></script> -->
		<script src="assets/demo/datatables-demo.js?ver=1"></script>
    </body>
</html>