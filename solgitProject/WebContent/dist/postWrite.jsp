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
.container-sm {
	margin-top: 150px;
}

a {
	color: black;
}
</style>
</head>

<body class="nav-fixed">
	<!-- 네비게이션바 코드 -->
	<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<!-- 네비게이션바 코드 -->
	<nav
		class="navbar navbar-expand-sm navbar-collapse navbar-dark fixed-top bg-default"
		font-size="50" font-family="Verdana" x="0" y="100"
		style="background-color: rgba(0, 0, 0, 0.5) !important;">

		<!-- 회사명, 로고 -->
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="mainpage.jsp"><img
					src="./assets/img/solgit_logo2.png" alt="Logo"
					style="width: 100px;"></a>
			</div>
			<!-- 반응형 버튼 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- 메뉴바 내용 -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar"
				style="width: 200px;">
				<!-- 메뉴 타이틀 -->
				<ul class="nav navbar-nav nav-pills nav-justified ml-auto">
					<!--  ml-auto ml-md-5 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown" style="font-size: 20px;">데이터 등록</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="board_load.jsp">발전이력 등록</a>
							<%if(info!=null && info.getManager()==1){ %><a class="dropdown-item" href="board_load_M.jsp">발전이력 확인</a><%} %>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown" style="font-size: 20px;">인공지능 분석</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="predict_weather.jsp">기상예보</a> <a
								class="dropdown-item" href="predict_generation.jsp">발전량 예측</a> <a
								class="dropdown-item" href="predict_benefit.jsp">SMP 예측</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown" style="font-size: 20px;">정보 공유</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="board_notice.jsp">공지사항</a> <a
								class="dropdown-item" href="board_community.jsp">커뮤니티</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown" style="font-size: 20px;">Contact us</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="customer_app.jsp">앱 지원</a> <a
								class="dropdown-item" href="customer_faq.jsp">고객센터</a>
						</div></li>
				</ul>
			</div>

			<!-- 메뉴 로그인 등 -->

			<div class="collapse navbar-collapse" id="collapsibleNavbar"
				style="width: 5px; flex-direction: row-reverse;">
				<%
					if (info == null) {
				%>
				<a class="btn btn-light" href="login.jsp"
					style="font-size: 15px; margin-left: 10px;">로그인</a> <a
					class="btn btn-light" href="register.jsp" style="font-size: 15px;">회원가입</a>

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
	<div class=container-fluid"">
		<main>

				<!-- 게시판 생성 -->
				<div class="card container-sm">
				<div class="card-header" style="margin-top: 0px; margin-left: 0px;">
					<h3>커뮤니티</h3>
				</div>
					<br>
					<!-- 글쓰기 -->

					<form action="PostWriteCon.do">
						<div class="form-group" style="height: 70px;">
							<div class="form-group"
								style="width: 20%; display: block; float: left; margin-right: 2%;">
								<label for="exampleFormControlInput1">아이디</label> <input
									type="text" class="form-control" id="exampleFormControlInput1"
									name="board_id" placeholder="">
							</div>
							<div class="form-group"
								style="width: 20%; display: block; float: left; margin-right: 5%;">
								<label for="exampleInputPassword1">비밀번호</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="board_pw">
							</div>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">제목</label> <input
								type="text" class="form-control" placeholder="제목을 입력하세요"
								aria-label="Recipient's username"
								aria-describedby="basic-addon2" name="board_title">
						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">본문</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								name="board_content" rows="10" placeholder="내용을 입력하세요"></textarea>
						</div>
						<div class="form-group form-check" style="text-align: right;">
							<input type="checkbox" class="form-check-input"
								id="exampleCheck1" name="board_lock" value="Y"> <label
								class="form-check-label" for="exampleCheck1">비밀글로 설정</label>
						</div>
						<div class="form-group" style="text-align: center;">
							<button type="button" class="btn btn-primary"
								onclick="location.href='board_community.jsp'">뒤로가기</button>
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
	<!-- 	<script type="text/javascript">
		$('#btn_submit').click(function() {
			alert("경고")
		});
	</script> -->
</body>
</html>
