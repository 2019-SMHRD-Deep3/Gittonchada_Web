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
.orangeColor {
	background-color: #FFE6DD;
}

.orange1Color {
	background-color: #FFCDBB;
}

.orange2Color {
	background-color: #FFB499;
}

.orange3Color {
	background-color: #FF9C77;
}

.orange4Color {
	background-color: #FF8355;
}

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
<body>
<%
      MemberDTO info = (MemberDTO) session.getAttribute("info");
   	%>
	<!-- 네비게이션바 코드 -->
		<nav class="navbar navbar-expand-sm navbar-collapse navbar-dark fixed-top bg-default" font-size="50" font-family="Verdana" x="0" y="100"  style="	background-color: rgba(0, 0, 0, 0.5) !important;">
			
			<!-- 회사명, 로고 -->
			<div class="container-fluid">
			<div class="navbar-header">
			<a class="navbar-brand" href="mainpage2.jsp"><img src="./assets/img/solgit_logo2.png" alt="Logo" style="text-size=5rem; width:100px;"></a>
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
							<a class="dropdown-item" href="predict_benefit.jsp">수익 예측</a>
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
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="font-size:20px;">고객 센터</a>
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
		<!-- 메인 테이블 시작 -->
		<div class="card container-sm" style="margin-top: 150px; margin-bottom: 50px; padding-right: 0px; padding-left: 0px;">
			<div class="card-header" style="margin-top: 0px; margin-left: 0px;">
				<h3 style="float:left;">SMP 예측</h3>
				<button style="float:right;" class="btn_table" style="padding: 3px">표</button>
				<button style="float:right;" class="btn_chart" style="padding: 3px">차트</button>
			</div>

				<div class="card mb-4">
					<div class="card-header display_chart">
						<i class="fas fa-chart-area mr-1"></i>시간별 SMP가격
					</div>
					<div class="card-body">
						<canvas id="myLineChart2" width="100%" height="30"></canvas>
					</div>
					<div class="card-footer small text-muted">※ 본 SMP예측(1~2일 후)은
						딥러닝 분석으로 예측한 결과이므로 참고만 하시기 바랍니다. ※</div>
			</div>

			<div class="card-header">
				<i class="fas fa-table mr-1"></i>표(Table)
			</div>

			<div class="card-body display_table">
				<div class="table table-responsive" style="width: 25%; float: left;">
					<table
						class="table table-bordered table-striped table-hover table-condensed"
						id="dataTable" width="100%" cellspacing="0">
						<thead class=table style="text-align: center;">
							<tr>
								<th>시간\날짜</th>
							</tr>
							<tr>
								<th>1시</th>
							</tr>
							<tr>
								<th>2시</th>
							</tr>
							<tr>
								<th>3시</th>
							</tr>
							<tr>
								<th>4시</th>
							</tr>
							<tr>
								<th>5시</th>
							</tr>
							<tr>
								<th>6시</th>
							</tr>
							<tr>
								<th>7시</th>
							</tr>
							<tr>
								<th>8시</th>
							</tr>
							<tr>
								<th>9시</th>
							</tr>
							<tr>
								<th>10시</th>
							</tr>
							<tr>
								<th>11시</th>
							</tr>
							<tr>
								<th>12시</th>
							</tr>
							<tr>
								<th>13시</th>
							</tr>
							<tr>
								<th>14시</th>
							</tr>
							<tr>
								<th>15시</th>
							</tr>
							<tr>
								<th>16시</th>
							</tr>
							<tr>
								<th>17시</th>
							</tr>
							<tr>
								<th>18시</th>
							</tr>
							<tr>
								<th>19시</th>
							</tr>
							<tr>
								<th>20시</th>
							</tr>
							<tr>
								<th>21시</th>
							</tr>
							<tr>
								<th>22시</th>
							</tr>
							<tr>
								<th>23시</th>
							</tr>
							<tr>
								<th>24시</th>
							</tr>
							<tr>
								<th>최대</th>
							</tr>
							<tr>
								<th>최소</th>
							</tr>
							<tr>
								<th>가중평균</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table" style="width: 15%; float: left;">
					<table id="setTable"
						class="table table-bordered table-striped table-condensed"
						id="dataTable" cellspacing="0">
						<tr class="table" style="text-align: center;">
							<th class="orangeColor">2일 전</th>
						</tr>
					</table>
				</div>
				<div class="table" style="width: 15%; float: left;">
					<table id="setTable1"
						class="table table-bordered table-striped table-condensed"
						style="float: left;" cellspacing="0">
						<tr class="table" style="text-align: center;">
							<th class="orange1Color">1일 전</th>
						</tr>
					</table>
				</div>
				<div class="table" style="width: 15%; float: left;">
					<table id="setTable2"
						class="table table-bordered table-striped table-condensed info"
						style="float: left;" cellspacing="0">
						<tr class="info" style="text-align: center;">
							<th class="orange2Color">오늘</th>
						</tr>
					</table>
				</div>
				<div class="table" style="width: 15%; float: left;">
					<table id="setTable3"
						class="table table-bordered table-striped table-condensed success"
						style="float: left;" cellspacing="0">
						<tr class="table" style="text-align: center;">
							<th class="orange3Color">1일 후</th>
						</tr>
					</table>
				</div>
				<div class="table" style="width: 15%; float: left;">
					<table id="setTable4"
						class="table table-bordered table-striped table-condensed success"
						style="float: left;" cellspacing="0">
						<tr class="table" style="text-align: center;">
							<th class="orange4Color">2일 후</th>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="py-4 bg-light mb-auto">
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
		var str = '';
		var jsonResult;

		$
				.ajax({
					url : 'http://localhost:9001/re/',
					type : "get",
					dataType : "json",
					success : function(data) {
						var past2 = [];
						var past1 = [];
						var present = [];
						var future1 = [];
						var future2 = [];

						var result = JSON.parse(data);

						for (var i = 0; i < 27; i++) {
							var table = document.getElementById('setTable');
							var tr = document.createElement('TR');
							table.appendChild(tr);
							var td = document.createElement('TD');
							td.className = "orangeColor";
							tr.appendChild(td);
							td.innerHTML = result[i].past2.toFixed(2);

							var table = document.getElementById('setTable1');
							var tr = document.createElement('TR');
							table.appendChild(tr);
							var td = document.createElement('TD');
							td.className = "orange1Color";
							tr.appendChild(td);
							td.innerHTML = result[i].past1.toFixed(2);

							var table = document.getElementById('setTable2');
							var tr = document.createElement('TR');
							table.appendChild(tr);
							var td = document.createElement('TD');
							td.className = "orange2Color";
							tr.appendChild(td);
							td.innerHTML = result[i].present.toFixed(2);

							var table = document.getElementById('setTable3');
							var tr = document.createElement('TR');
							table.appendChild(tr);
							var td = document.createElement('TD');
							td.className = "orange3Color";
							tr.appendChild(td);
							td.innerHTML = result[i].future1.toFixed(2);

							var table = document.getElementById('setTable4');
							var tr = document.createElement('TR');
							table.appendChild(tr);
							var td = document.createElement('TD');
							td.className = "orange4Color";
							tr.appendChild(td);
							td.innerHTML = result[i].future2.toFixed(2);

							past2.push(result[i].past2.toFixed(2));
							past1.push(result[i].past1.toFixed(2));
							present.push(result[i].present.toFixed(2));
							future1.push(result[i].future1.toFixed(2));
							future2.push(result[i].future2.toFixed(2));
						}

						// 차트 
						Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
						Chart.defaults.global.defaultFontColor = '#292b2c';

						var ctx = document.getElementById("myLineChart2");
						var myLineChart = new Chart(
								ctx,
								{
									type : 'line',

									data : {
										labels : [ "1시", "2시", "3시", "4시",
												"5시", "6시", "7시", "8시", "9시",
												"10시", "11시", "12시", "13시",
												"14시", "15시", "16시", "17시",
												"18시", "19시", "20시", "21시",
												"22시", "23시", "24시", "최대",
												"최소", "가중평균", ],

										datasets : [
												{
													label : "2일전",
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
													data : past2,
												},
												{
													label : "1일전",
													lineTension : 0.3,
													backgroundColor : "rgba(255,255,255,0)",
													borderColor : "rgba(255, 205, 187,1)",
													pointRadius : 5,
													pointBackgroundColor : "rgba(255, 205, 187,1)",
													pointBorderColor : "rgba(255,255,255,0.8)",
													pointHoverRadius : 5,
													pointHoverBackgroundColor : "rgba(255, 205, 187,1)",
													pointHitRadius : 80,
													pointBorderWidth : 4,
													data : past1,
												},
												{
													label : "오늘",
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
													data : present,
												},
												{
													label : "1일후",
													lineTension : 0.3,
													backgroundColor : "rgba(255,255,255,0)",
													borderColor : "rgba(255, 156, 119,1)",
													pointRadius : 5,
													pointBackgroundColor : "rgba(255, 156, 119,1)",
													pointBorderColor : "rgba(255,255,255,0.8)",
													pointHoverRadius : 5,
													pointHoverBackgroundColor : "rgba(255, 156, 119,1)",
													pointHitRadius : 40,
													pointBorderWidth : 2,
													data : future1,
												},
												{
													label : "2일후",
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
													data : future2,
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
													maxTicksLimit : 27
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
													labelString : '금액'
												}
											} ]
										},
										legend : {
											display : true
										}
									}
								});
					},
					beforeSend : function() {
						$('.wrap-loading').removeClass('display-none');
					},
					complete : function() {
						$('.wrap-loading').addClass('display-none');
					}

				});

		$(function() {
			$('.btn_table').click(function() {
				$('.display_chart').hide();
				$('.display_table').show();
			});
			$('.btn_chart').click(function() {
				$('.display_table').hide();
				$('.display_chart').show();
			});

		});
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js?ver=1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js?ver=1"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js?ver=1"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js?ver=1"
		crossorigin="anonymous"></script>
	<!-- <script src="assets/demo/current-temp-chart.js?ver=1"></script> -->
	<script src="assets/demo/datatables-demo.js?ver=1"></script>
</body>
</html>
