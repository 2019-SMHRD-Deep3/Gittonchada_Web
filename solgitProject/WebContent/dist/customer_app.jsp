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
	         background-color:#F2F2F2;
	        /*  background-image: url(./assets/img/mainpage3.jpg); */                                                             
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
		    .carousel-inner > .carousel-item > img{ /* width: 640px; */ height: auto; }
		</style>
	</head>

<body class="nav-fixed">
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
		<main class="main" role="main">
		
		<section>
		<div class="img">
        		<div class="content">
			<div class="container" style="color : black; margin-top: 80px; margin-bottom:50px; "><h3 style="color:white;"><span style="background-color:#585858; padding:1%;">SOLGIT 어플 소개</span></h3></div>
			<div id="demo" class="carousel slide" data-ride="carousel"> 
			<div class="carousel-inner"> 
			<!-- 슬라이드 쇼 --> 
			<div class="carousel-item active"> 
			<!--가로--> 
			<img class="d-block" src="./assets/img/app.png" style="width:1000px;"> 
			<div class="carousel-caption d-none d-md-block"> <h5 style="margin-bottom:50px; color:black; !important;">메인 화면</h5></div> 
			</div> 
			<div class="carousel-item"> 
			<img class="d-block" src="./assets/img/app1.png" style="width:1000px;">
			<div class="carousel-caption d-none d-md-block"> <h5 style="margin-bottom:50px; color:black; !important;">메뉴 선택 화면</h5></div> 
			</div> 
			<div class="carousel-item"> 
			<img class="d-block" src="./assets/img/app3.png" style="width:1000px;">
			<div class="carousel-caption d-none d-md-block"> </div> 
			</div>
			<div class="carousel-item"> 
			<img class="d-block" src="./assets/img/app4.png" style="width:1000px;"> 
			<div class="carousel-caption d-none d-md-block"></div>
			</div>
			<div class="carousel-item"> 
			<img class="d-block" src="./assets/img/app5.png" style="width:1000px;"> 
			<div class="carousel-caption d-none d-md-block"></div>
			</div>
			<div class="carousel-item"> 
			<img class="d-block" src="./assets/img/app6.png" style="width:1000px;"> 
			<div class="carousel-caption d-none d-md-block"></div>
			</div> <!-- / 슬라이드 쇼 끝 --> 
			<!-- 왼쪽 오른쪽 화살표 버튼 --> <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
			<span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black;"></span> 
			<!-- <span>Previous</span> --> </a> 
			<a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"style="background-color: black;"></span> 
			<!-- <span>Next</span> --> </a> 
			<!-- / 화살표 버튼 끝 --> <!-- 인디케이터 --> 
			<ul class="carousel-indicators"> 
			<li data-target="#demo" data-slide-to="0" class="active"></li> 
			<!--0번부터시작--> 
			<li data-target="#demo" data-slide-to="1"></li> 
			<li data-target="#demo" data-slide-to="2"></li> 
			<li data-target="#demo" data-slide-to="3"></li> 
			<li data-target="#demo" data-slide-to="4"></li> 
			<li data-target="#demo" data-slide-to="5"></li> 
			<li data-target="#demo" data-slide-to="6"></li> 
			</ul> <!-- 인디케이터 끝 --> 
			</div>
			</div>
			</div>
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
		

		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
		<script> $('.carousel').carousel({ interval: 3000 }) </script>
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
