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
		<link href="css/styles.css" rel="stylesheet" />
		<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
		<style>
			#bg {
			  position: fixed; 
			  top: -50%; 
			  left: -50%; 
			  width: 200%; 
			  height: 200%;
			}
			#bg img {
			  position: absolute; 
			  top: 0; 
			  left: 0; 
			  right: 0; 
			  bottom: 0; 
			  margin: auto; 
			  min-width: 50%;
			  min-height: 50%;
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
			<a class="navbar-brand" href="#"><img src="./assets/img/solgitIcon.png" alt="Logo" style="text-size=5rem; width:40px;">솔깃</a>
			
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
							<span role="presentation" class="dropdown-header">발전이력</span>
							<a class="dropdown-item" href="#">발전이력 등록</a>
							<a class="dropdown-item" href="#">발전이력 갱신</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">인공지능 분석</a>
						<div class="dropdown-menu">
							<span role="presentation" class="dropdown-header">예보·예측</span>
							<a class="dropdown-item" href="#">기상예보</a>
							<a class="dropdown-item" href="#">발전량 예측</a>
							<a class="dropdown-item" href="#">수익 예측</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">정보 공유</a>
						<div class="dropdown-menu">
							<span role="presentation" class="dropdown-header">게시판</span>
							<a class="dropdown-item" href="#">공지사항</a>
							<a class="dropdown-item" href="board2.jsp">커뮤니티</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">고객 센터</a>
						<div class="dropdown-menu">
							<span role="presentation" class="dropdown-header">사이트정보</span>
							<a class="dropdown-item" href="#">앱 지원</a>
							<a class="dropdown-item" href="#">FAQ</a>
						</div>
					</li>
				</ul>
			</div>
				<%
	            	if (info != null) {
	            %>
				<!-- SMP 등 정보전달 -->
				<div class="navbar-nav"> <!-- ml-auto ml-md-8 -->
					<span class="nav-link" id="navbar">오늘의 SMP : <% %></span>
					<span class="nav-link" id="navbar">REC : </span>
					<span class="nav-link" id="navbar">날씨 : </span>
				</div>
				<%
	            	}
	            %>
			
				<!-- 메뉴 로그인 등 -->
	            <ul class="navbar-nav ml-auto ml-md-7">
	            	<li><div style="color:white;"><%if(info!=null){ %><%=info.getName()%><br>님 환영합니다.
	               		<%}else {%><%} %></div></li>
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
	            
	            <!-- 신 로그인, 회원가입 -->
				
		</nav>
		<!-- 메인 내용 작성 부분 -->
		<div class="container-fluid">
		<main>
		
			<div class="container-fluid">
				<div id="bg">
					<img src="./assets/img/mainpage3.jpg" alt="메인 사진입니다.">
				</div>
			</div>
			
		
		<!-- Footer -->
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto fixed-bottom">
				<div class="container-fluid">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 2020 © SOLGIT</div>
							<div><a href="#">Privacy Policy</a>  &middot; <a href="#">Terms	&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
			</div>
		</main>
		</div>
		

	
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>
