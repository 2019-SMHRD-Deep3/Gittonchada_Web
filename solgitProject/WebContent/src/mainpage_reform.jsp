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
		<link rel="stylesheet" href="css/animate.css">
		<link rel="stylesheet" type="text/css" href="css/animate.min.css">
		<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
			

		<style>
			.img{
	         position: relative;
	         background-image: url(./assets/img/mainpage3.jpg);                                                               
	         height: 100vh;
	         background-size: cover;
		    }
		    .img-cover{
	         position: absolute;
	         height: 100%;
	         width: 100%;
	         background-color: rgba(0, 0, 0, 0.4);                                                                 
	         z-index:1;
		    }
		    .img .content{
	         position: absolute;
	         top:50%;
	         left:50%;
	         transform: translate(-50%, -50%);                                                                   
	         font-size:5rem;
	         color: white;
	         z-index: 2;
	         text-align: center;
		    }
		    .title h2 h3 {
		      display: inline;
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
			<a class="navbar-brand" href="#"><img src="./assets/img/solgitIcon.png" alt="Logo" style="text-size=5rem; width:40px;">&nbsp;　　솔깃</a>
			
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
		<main class="main" role="main">
		
		<section>
			<div class="img">
        		<div class="content title">
					<h2 class="animated infinite pulse">솔깃한 태양광 정보 공유 플랫폼</h2>
					<div class="dropdown-divider"></div>            		
           			<h3>SOLGIT에 오신것을 환영합니다.</h3>
			</div>
			<div class="img-cover"></div>
			</div>
		</section>
		
		<!-- <section>
			<div class="img">
        		<div class="content">
            		<h1>Hello!</h1>
           			<h2>My name is nunu</h2>
       			</div>
        		<div class="img-cover"></div>
   			</div>
		</section> -->
		</main>
			
		
		<!-- Footer -->
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto"> <!-- fixed-bottom -->
				<div class="container-fluid">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 2020 © SOLGIT</div>
							<div><a href="#">Privacy Policy</a>  &middot; <a href="#">Terms	&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
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
