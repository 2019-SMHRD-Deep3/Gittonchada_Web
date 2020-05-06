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
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>

<style type="text/css">
.mytable {
	padding-left: 15%;
	padding-right: 15%;
	padding-top: 5%;
	padding-bottom: 5%;
}

a {
	color: black;
}
</style>
</head>

<body class="nav-fixed">
	<%
      MemberDTO info = (MemberDTO) session.getAttribute("info");
   	%>
	<!-- 네비게이션바 코드 -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
			
			<!-- 회사명, 로고 -->
			<a class="navbar-brand" href="mainpage.jsp"><img src="./assets/img/solgitIcon.png" alt="Logo" style="text-size=5rem; width:40px;">&nbsp;　　솔깃</a>
			
			<!-- 반응형 버튼 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar"><span class="navbar-toggler-icon"></span></button>
			
			<!-- 메뉴바 내용 -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<!-- 메뉴 타이틀 -->
				<ul class="navbar-nav ml-auto ml-md-3"> <!--  ml-auto ml-md-5 -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">데이터 등록</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="board_load.jsp">발전이력 등록</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">인공지능 분석</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="predict_weather.jsp">기상예보</a>
							<a class="dropdown-item" href="predict_generation.jsp">발전량 예측</a>
							<a class="dropdown-item" href="predict_benefit.jsp">수익 예측</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">정보 공유</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="board_notice.jsp">공지사항</a>
							<a class="dropdown-item" href="board_community.jsp">커뮤니티</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">고객 센터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="customer_app.jsp">앱 지원</a>
							<a class="dropdown-item" href="customer_faq.jsp">FAQ</a>
						</div>
					</li>
				</ul>
				</div>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<%
	            	if (info != null) {
	            %>
				<!-- SMP 등 정보전달 -->
				<div class="navbar-nav" style="margin-left: 150px;"> <!-- ml-auto ml-md-8 -->
					<span class="nav-link" id="navbar">SMP <% %></span>
					<span class="nav-link" id="navbar">REC <% %></span>
					<span class="nav-link" id="navbar">날씨  <% %></span>
				</div>
				<%
	            	}
	            %>
	            </div>
	            <div class="collapse navbar-collapse" id="collapsibleNavbar">
	            <ul class="navbar-nav ml-auto">
	            	<li><div  style="color : hotpink;"><%if(info!=null){ %><%=info.getName()%><br>님 환영합니다.
	               		<%}else {%><%} %></div></li>
	            </ul>
	            </div>
	            
				<!-- 메뉴 로그인 등 -->
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
	            <ul class="navbar-nav ml-auto ml-md-6">
	               <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" 
	               id="userDropdown" href="#" role="button" data-toggle="dropdown" 
	               aria-haspopup="true" aria-expanded="true"><i class="fas fa-user fa-fw"></i></a>
	               <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
	                  <%
	                  if (info == null) {
	                  %>
	                  <a class="dropdown-item" href="login.jsp">로그인</a> 
	                  <div class="dropdown-divider"></div>
	                  <a class="dropdown-item" href="register.jsp">회원가입</a>
	                  <%
	                  } else {
	                  %>
	                  <a class="dropdown-item" href="LogoutService.do">로그아웃</a>
	                  <%
	                  }
	                  %>
	               </div>
	               </li>
	            </ul>
	            </div>
			
	            <!-- 신 로그인, 회원가입 -->
				
		</nav>
	<!-- 메인 내용 작성 부분 -->
	<div class=container-fluid"">
		<main>

			<h3>상단에 고정된 내비게이션 바(메뉴바)</h3>

			<!-- 게시판 생성 -->
			<div class="mytable">

				<!-- 발전이력 등록하기 -->
				<form action="DevelopInfoCon.do" method="post"
					enctype="multipart/form-data">
					<div class="form-group" >
					<div>
						<label for="exampleFormControlSelect1" style="font-weight:bold;">발전 지역 선택</label> </div>
						<select style="width: 20%; display: block; float: left; margin-right: 2%;"
							class="form-control" name="sido" id="sido"></select> 
							<select style="width: 20%; display: block; float: left; margin-right: 2%;"
							class="form-control" name="gugun" id="gugun"></select>
						<!-- //////////////////////////////////////////////// 발전이력 첨부////////////////////////////////////////////////// -->
					</div><br><br>
					<div class="form-group">
					<label for="exampleFormControlSelect1" style="font-weight:bold;">세부 사항</label> 
						<textarea class="form-control" id="exampleFormControlTextarea1"
							name="file_content" rows="5" placeholder="현재 사용하시는 <인버터> <모듈명> <연식> 등을 함께 적어주시면 차후 성능 개선에 반영됩니다."></textarea>
					</div>
						<div>
						<label for="exampleFormControlSelect1" style="font-weight:bold;">파일 첨부</label> </div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">※ 태양광 발전이력을 '파일명.csv' 형식으로 첨부바랍니다. ※</label>
						<div class="custom-file">
							<input type="file" name="file_name" id="inputGroupFile01"
								aria-describedby="inputGroupFileAddon01">
							<!-- 	<label class="custom-file-label" for="inputGroupFile01">Choose
								file</label> -->
						</div>
							<%if (info!=null){ %>
						<input type="hidden" name="info" value="<%= info.getSeq()%>" />
					</div>
					<%}%><br><br><br><br><br>
					<div style="text-align:center;">
					<button type="button" class="btn btn-primary" onclick="location.href='board_load.jsp'" >뒤로가기</button>
					<button type="submit" class="btn btn-primary">등록하기</button>
					</div>
				</form>

			</div>
			<!-- 	게시판 끝 -->

			<!-- Footer -->
			<footer class="py-4 bg-light mt-auto fixed-bottom">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 2020 © SOLGIT</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</main>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
	<script type="text/javascript">
		$('document')
				.ready(
						function() {
							var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시",
									"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
									"강원도", "충청북도", "충청남도", "전라북도", "전라남도",
									"경상북도", "경상남도", "제주도" ];
							var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구",
									"광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구",
									"동작구", "마포구", "서대문구", "서초구", "성동구", "성북구",
									"송파구", "양천구", "영등포구", "용산구", "은평구", "종로구",
									"중구", "중랑구" ];
							var area2 = [ "계양구", "남구", "남동구", "동구", "부평구",
									"서구", "연수구", "중구", "강화군", "옹진군" ];
							var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
							var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
							var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
									"중구", "달성군" ];
							var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
							var area7 = [ "강서구", "금정구", "남구", "동구", "동래구",
									"부산진구", "북구", "사상구", "사하구", "서구", "수영구",
									"연제구", "영도구", "중구", "해운대구", "기장군" ];
							var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시",
									"군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시",
									"수원시", "시흥시", "안산시", "안성시", "안양시", "양주시",
									"오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시",
									"평택시", "포천시", "하남시", "화성시", "가평군", "양평군",
									"여주군", "연천군" ];
							var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시",
									"춘천시", "태백시", "고성군", "양구군", "양양군", "영월군",
									"인제군", "정선군", "철원군", "평창군", "홍천군", "화천군",
									"횡성군" ];
							var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
									"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군",
									"청원군" ];
							var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시",
									"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
									"연기군", "예산군", "청양군", "태안군", "홍성군" ];
							var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시",
									"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
									"임실군", "장수군", "진안군" ];
							var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시",
									"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
									"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
									"장흥군", "진도군", "함평군", "해남군", "화순군" ];
							var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시",
									"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
									"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
									"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
							var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시",
									"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
									"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
									"함안군", "함양군", "합천군" ];
							var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];

							// 시/도 선택 박스 초기화
							$("select[name^=sido]")
									.each(
											function() {
												$selsido = $(this);
												$
														.each(
																eval(area0),
																function() {
																	$selsido
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
																});
												$selsido
														.next()
														.append(
																"<option value=''>구/군 선택</option>");
											});

							// 시/도 선택시 구/군 설정
							$("select[name^=sido]")
									.change(
											function() {
												var area = "area"
														+ $("option", $(this))
																.index(
																		$(
																				"option:selected",
																				$(this))); // 선택지역의 구군 Array
												var $gugun = $(this).next(); // 선택영역 군구 객체
												$("option", $gugun).remove(); // 구군 초기화
												if (area == "area0")
													$gugun
															.append("<option value=''>구/군 선택</option>");
												else {
													$
															.each(
																	eval(area),
																	function() {
																		$gugun
																				.append("<option value='"+this+"'>"
																						+ this
																						+ "</option>");
																	});
												}
											});

						});
	</script>
</body>
</html>