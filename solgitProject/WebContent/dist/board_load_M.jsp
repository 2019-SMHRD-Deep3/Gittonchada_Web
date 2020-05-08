<%@page import="com.model.FileDTO"%>
<%@page import="com.model.FileDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.NoticeDTO"%>
<%@page import="com.model.NoticeDAO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
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
	margin-bottom:80px;
}

.my_table {
	height: 550px;
}

#manager_div {
	overflow:hidden;
		height:auto;
}

a {
	color: black;
}

.form-row {
	float: left;
}

.form-control {
	display: inline;
	width: 95%;
	/* padding:0;
	margin:0; */
}

.custom-select {
	display: inline;
	width: 90%;
	/* 	margin:0;
	padding:0; */
}

.btn-info {
	display: inline;
	height: 38px;
}

.col-auto.my-1 {
	width: 100%;
}
</style>
</head>

<body class="nav-fixed">
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

			<h3></h3>

			<!-- 게시판 생성 -->
			<div class="card container-sm">
				<div class="card-header" style="margin-top: 0px; margin-left: 0px;">
					<h3>데이터 등록</h3>
				</div>
				<br> <br>
				<div class=" input-groupmb-3">
					<form>
						<div class="form-row align-items-center">
							<div class="col-auto my-1">
								<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
							</div>
						</div>
					</form>
					<div style="float: right; margin-top: 5px;">
						<button type="button" class="btn btn-info" id="check_ok" style="width: 70px;">확인</button>
						<button type="button" class="btn btn-info" id="check_no" style="width: 70px;">불가</button>
					</div>
				</div>
				<br>

				<%
					FileDAO dao = new FileDAO();
					if (info != null) {

							///////////////// 관리자가 조회했을때
				%>
				<div class="my_table" id="manager_div">
					<table class="table">
						<thead>
							<th scope="col" style="text-align:center;">#</th>
							<th scope="col">파일명</th>
							<th scope="col">세부사항</th>
							<th scope="col">상태</th>
							<th scope="col">작성일</th>
							<th scope="col" style="text-align:center;">확인</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<FileDTO> allList = dao.allFiles();
										for (int i = 0; i < allList.size(); i++) {
							%>
							<tr id="managerList">
								<td style="width: 10%; text-align: center;"><%=allList.size() - i%></td>
								<td style="width: 20%; padding: 10px;"><%=allList.get(i).getFile_name()%></td>
								<td style="width: 30%; padding: 10px;"><%=allList.get(i).getFile_content()%></td>
								<td style="width: 10%; padding: 10px;"><%=allList.get(i).getFile_check()%></td>
								<td style="width: 20%; padding: 10px;"><a id="post"><%=allList.get(i).getFile_date()%></a></td>
								<td style="width: 10%; padding: 10px; text-align:center;"><input
									type="checkbox" id="check" name="check" value=<%=allList.get(i).getFile_seq() %> /></td>
							</tr>
							<%
								}}
							%>

						</tbody>
					</table>
				</div>
				
				

							
				</div>
				<!-- 테이블 끝	 -->
				<br> <br>
			<%-- 	<div class="btn-toolbar justify-content-between" role="toolbar"
					aria-label="Toolbar with button groups">
					<div class="btn-group" role="group" aria-label="First group"
						style="margin: auto;">
						<form action="BoardLoadCon.do">
							<%
								if (allList.size() > 10) {
							%>
							<button type="submit" name='page_num' value="1"
								class="btn btn-secondary">1</button>
							<%
								}
							%>
							<%
								for (int i = 1; i < 10; i++) {
											if (list.size() >= 10 * i + 1) {
												for (int j = i + 1; j <= i + 1; j++) {
							%>
							<button type="submit" name='page_num' value="<%=j%>"
								class="btn btn-secondary"><%=j%></button>
							<%
								}
											}
										}
							%>
						</form>
					</div>
				</div> --%>
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
	<%
		if (info != null) {
	%>
	<input type="hidden" value=${info.email } class="infoEmail">

	<%
		}
	%>
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
		
	var check_list = [];
	$("input:checkbox[name='check']").click(function(){
				if($("#check").is(":checked")){
			     var checked = this.value
				 console.log(checked); 
			     check_list.push(checked);
			      }
			});
		$("#check_ok").click(function(){
			$.ajax({
				type:"get",
				url:"CheckLoadCon.do",
				data:{"check_list":check_list},
				success:function(result){
					var as = eval(result);
					alert("data"+as[0]+"as[1]");
				}
			})
		});
		
	</script>

</body>
</html>
