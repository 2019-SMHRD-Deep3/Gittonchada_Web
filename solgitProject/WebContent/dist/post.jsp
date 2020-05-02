<%@page import="java.util.ArrayList"%>
<%@page import="com.model.ReplyDAO"%>
<%@page import="com.model.ReplyDTO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="com.model.BoardDAO"%>
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
.mydiv {
	padding-left: 10%;
	padding-right: 10%;
	padding-top: 5%;
	padding-bottom: 5%;
}

.write_info {
	padding-top: 10px;
}

#writer {
	margin: 0px;
}
</style>

</head>

<body class="nav-fixed">
	<!-- 네비게이션바 코드 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">

		<!-- 회사명, 로고 -->
		<a class="navbar-brand" href="#"><img
			src="./assets/img/solgitIcon.png" alt="Logo" style="width: 40px;">솔깃</a>

		<!-- 반응형 버튼 -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- 메뉴바 내용 -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<!-- 메뉴 타이틀 -->
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">데이터 등록</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">발전이력 등록</a> <a
							class="dropdown-item" href="#">발전이력 갱신</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">인공지능 분석</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">기상예보</a> <a
							class="dropdown-item" href="#">발전량 예측</a> <a
							class="dropdown-item" href="#">수익 예측</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">정보 공유</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">커뮤니티</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown">고객 센터</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">앱 지원</a> <a
							class="dropdown-item" href="#">FAQ</a>
					</div></li>
			</ul>

			<!-- 메뉴 로그인 등 -->
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="userDropdown" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="login.html">로그인</a> <a
							class="dropdown-item" href="register.html">회원가입</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="login.html">로그아웃</a>
					</div></li>
			</ul>

		</div>
	</nav>
	<!-- 메인 내용 작성 부분 -->
	<div class=container-fluid"">
		<main>

			<h3>상단에 고정된 내비게이션 바(메뉴바)</h3>


			<!-- 		게시글 시작 -->

			<%
				int idx = Integer.parseInt(request.getParameter("idx"));
				System.out.print(idx);
				BoardDAO dao = new BoardDAO();
				BoardDTO dto = dao.selectOnePost(idx);
				ReplyDAO reple_dao = new ReplyDAO();
				ArrayList<ReplyDTO> reple_list = reple_dao.selectReply(idx);
			%>


			<div class="mydiv">

				<h2>
					<%=dto.getBoard_title()%>
				</h2>
				<div class='write_info'>
					<p id='writer'>
						<%=dto.getBoard_id()%>
					</p>
					<p>
						<%=dto.getBoard_date()%>
					</p>
				</div>
				<hr>
				<div>

					<p><%=dto.getBoard_content()%></p>

				</div>

			</div>
			<!-- 게시글 끝 -->
			<!-- 댓글 입력창 -->
			<div class="mydiv">
				<form action="ReplyWriteCon.do">
					<div class="form-group">
						<input class="form-control" type="text" placeholder="아이디"
							id="reply_id" name="reply_id"> <input
							class="form-control" type="password" placeholder="비밀번호"
							name="reply_pw" id="reply_pw"> <input
							class="form-control" type="text" placeholder="댓글을 입력해주세요"
							id="reply_content" name="reply_content"> <input
							type="hidden" value="<%=idx%>" name="board_idx" id="board_idx">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
				<!-- 댓글 내용 -->
				<div>
					<table class="table table-sm">
						<%if(reple_list.size()!=0){
						for(int i=0;i<reple_list.size();i++){ %>
						<tr>
							<td class="table-active"><%=reple_list.get(i).getReply_id()%></td>
							<td class="table-active"><%=reple_list.get(i).getReply_content()%></td>
							<td class="table-active"><%=reple_list.get(i).getReply_date()%></td>
						</tr> 
						<%}} %>
					</table>
				</div>
			</div>
			<!-- 댓글 끝 -->


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

	<!-- 	댓글 리스트 -->
	<script type="text/javascript">
		$(".btn btn-primary").click(function() {
			$.ajax({
				type : "post",
				url : "ReplyReadCon.do",
				data : "board_idx="+board_idx,
				success : function(result) {
					console.log("hi");
					var reply = $(".table-sm");
					var reply_list;
					//reply.empty();
					if(result.length!=0){
						for(var i=0;i<result.length;i++){
							var reply_id = result[i].reply_id;
							var reply_content = result[i].reply_content;
							var reply_date=result[i].reply_date;
							reply_list = '<tr><td class="table-active">'+reply_id
							+'</td><td class="table-active">'+reply_content
							+'</td><td class="table-active">'+reply_date
							+'</td></tr>';
							reply.append(reply_list);	
						}
					}
				}
			})

		});
	</script>



</body>
</html>
