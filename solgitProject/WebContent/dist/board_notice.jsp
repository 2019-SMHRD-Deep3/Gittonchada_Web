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
	margin-top:150px; 
}

.my_table {
	height: 550px;
}

a {
	color: black;
}

/* form{
	float: right;
}
 */
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
	<div class=container-fluid"">
		<main>

			<h3>   </h3>

			<!-- 게시판 생성 -->
			<div class="card container-sm">
<div class="card-header" style="margin-top: 0px; margin-left: 0px;">
				<h3>공지사항</h3>
			</div><br><br>
				<div class=" input-groupmb-3">
					<form>
						<div class="form-row align-items-center">
							<div class="col-auto my-1">
								<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>

								<div class="form-row">
									<div class="col-md-3 mb-3" style="width: 50px;">
										<label for="validationCustom04"></label> <select
											class="custom-select" id="validationCustom04" required>
											<option selected disabled value="">Choose...</option>
											<option value="title">제목</option>
											<option value="id">아이디</option>
											<option value="content">내용</option>
										</select>
									</div>
									<div class="col-md-6 mb-3" style="width: 600px;">
										<label for="validationCustom03"></label> <input type="text"
											class="form-control" id="validationCustom03" required>
										<div class="invalid-feedback">Please provide a valid
											city.</div>
									</div>
									<button type="button" class="btn btn-info" style="width: 70px;">검색</button>
								</div>
							</div>
						</div>
					</form>
					<div style="float: right; margin-top: 5px;">
					<%if(info!=null && info.getManager()==1){ %>
						<button type="button" class="btn btn-info" style="width: 70px;"
							onclick="location.href='noticeWrite.jsp'">등록</button>
							<%} %>
					</div>
				</div>
				<br>


				<!-- 테이블 생성 -->
				<div class="my_table">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" style="text-align: center;">#</th>
							<th scope="col" >제목</th>
							<th scope="col" >작성자</th>
							<th scope="col" >날짜</th>
						</tr>
					</thead>
					<tbody>

						<%
							NoticeDAO dao = new NoticeDAO();
							ArrayList<NoticeDTO> list = dao.selectNotice();
							int pageNow = 0;
							int totalCount = list.size();
							int listCount = 10;
							int totalPage = totalCount / listCount;
							if (totalCount % listCount > 0) {
								totalPage++;
							}
							/* 
														if (list != null && pageNow==0) {
															for (int i = 0; i < 10; i++) { */
						%>
						<%-- <tr>
							<td style="width: 10%; padding: 10px; text-align: center;"><%=list.get(i).getNotice_idx()%></td>
							<td style="width: 50%; padding: 10px;"><a id="post"
								href="n_post.jsp?idx=<%=i + 1%>"><%=list.get(i).getNotice_title()%></a></td>
							<td style="width: 20%; padding: 10px;"><%=list.get(i).getNotice_id()%></td>
							<td style="width: 20%; padding: 10px;"><%=list.get(i).getNotice_date()%></td>
						</tr> --%>
						<%
							/* }
							} */
							if (request.getParameter("page_num") != null) {
								pageNow = Integer.parseInt(request.getParameter("page_num"));
								int end = listCount * pageNow;
								if (end > list.size()) {
									end = list.size();
								}
								for (int i = listCount * (pageNow - 1); i < end; i++) {
						%>
						<tr>
							<td style="width: 10%; padding: 10px; text-align: center;"><%=list.get(i).getNotice_idx()%></td>
							<td style="width: 50%; padding: 10px;"><a id="post" style="color:red; font-weight:bold;"
								href="n_post.jsp?idx=<%=list.get(i).getNotice_idx()%>"><%=list.get(i).getNotice_title()%></a></td>
							<td style="width: 20%; padding: 10px;"><%=list.get(i).getNotice_id()%></td>
							<td style="width: 20%; padding: 10px;"><%=list.get(i).getNotice_date()%></td>
						</tr>
						<%
							}
							} else if (list != null) {
								int end = 10;
								if (list.size() < 10) {
									end = list.size();
								}
								for (int i = 0; i < end; i++) {
						%>
						<tr>
							<td style="width: 10%; padding: 10px; text-align: center;"><%=list.get(i).getNotice_idx()%></td>
							<td style="width: 50%; padding: 10px;"><a id="post" style="color:red; font-weight:bold;"
								href="n_post.jsp?idx=<%=list.get(i).getNotice_idx()%>"><%=list.get(i).getNotice_title()%></a></td>
							<td style="width: 20%; padding: 10px;"><%=list.get(i).getNotice_id()%></td>
							<td style="width: 20%; padding: 10px;"><%=list.get(i).getNotice_date()%></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table></div>
				<!-- 테이블 끝	 -->
				<div class="btn-toolbar justify-content-between" role="toolbar"
					aria-label="Toolbar with button groups">
					<div class="btn-group" role="group" aria-label="First group"
						style="margin: auto;">
						<form action="BoardNoticeCon.do">
							<%
								if (list.size() > 10) {
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
				</div>
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

</body>
</html>
