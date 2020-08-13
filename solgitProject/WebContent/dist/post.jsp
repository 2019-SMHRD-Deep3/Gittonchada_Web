<%@page import="com.model.MemberDTO"%>
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
.container-sm {
	margin-top: 150px;
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

			<h3></h3>


			<!-- 		게시글 시작 -->

			<%
				int idx = Integer.parseInt(request.getParameter("board_idx"));
				System.out.print(idx);
				BoardDAO dao = new BoardDAO();
				BoardDTO dto = dao.selectOnePost(idx);
				ReplyDAO reple_dao = new ReplyDAO();
				ArrayList<ReplyDTO> reply_list = reple_dao.selectReply(idx);
			%>


			<div class="card container-sm">
				<br> <br>
				<h2>
					<%=dto.getBoard_title()%>
				</h2>
				<div class='write_info'>
					<br>
					<p id='writer'>
						<%=dto.getBoard_id()%>
					</p>
					<p>
						<%=dto.getBoard_date()%>
						<button type="submit" class="btn btn-default" id="post_delete"
							style="margin: 0; padding: 0; float: right;">삭제</button>
					</p>
				</div>
				<hr>
				<div style="height: 300px;">
					<br>
					<p><%=dto.getBoard_content()%></p>

				</div>

			</div>
			<!-- 게시글 끝 -->
			<!-- 댓글 입력창 -->
			<div class="card container-sm"
				style="margin-top: 1%; margin-bottom: 7%;">
				<br>
				
			
				<!-- 댓글 내용 -->
				<div>
					<table class="table table-sm">
						 <%-- <%
							if (reply_list.size() != 0) {
								for (int i = 0; i < reply_list.size(); i++) {
						%>
						<tr>
							<td class="table-active" style="width: 2%;"></td>
							<td class="table-active" style="width: 15%;"><%=reply_list.get(i).getReply_id()%></td>
							<td class="table-active" style="width: 60%;"><%=reply_list.get(i).getReply_content()%></td>
							<td class="table-active" style="width: 15%;"><%=reply_list.get(i).getReply_date()%></td>
							<td class="table-active" style="width: 8%; text-align: center;">
								<%
									if (info != null && info.getSeq() != null) {
												int infoSeq = Integer.parseInt(info.getSeq());
												if (infoSeq == reply_list.get(i).getMember_seq() || info.getManager() == 1) {
								%><button
									type="button" class="btn btn-delete" id="reply_idx" onclick="reply_delete(<%=reply_list.get(i).getReply_idx() %>)"
									value="<%=reply_list.get(i).getReply_idx()%>"
									style="padding: 0;">삭제</button> <%
 	}
 			}
 %>
							</td>
						</tr>
						<%
							}
							}
						%>  --%>
					</table>
				</div>
				
				<%
					if (info != null) {
				%>
			<!-- 	<form action="ReplyWriteCon.do"> -->
					<div class="row">
						<br>
						<div class="col-lg-6">
							<div class="input-group">
								<input class="form-control" type="text"
									value="<%=info.getEmail()%>" id="reply_id" name="reply_id"
									style="width: 30%;">
							</div>
						</div>
						<div class="col-lg-6">
							<div class="input-group">
								<input class="form-control" type="hidden"
									value="<%=info.getSeq()%>" name="member_seq" id="member_seq">
							</div>
						</div>
						<div class="form-group" style="width: 89%; padding: 12px;">
							<input class="form-control" type="text" placeholder="댓글을 입력해주세요"
								id="reply_content" name="reply_content"> <input
								type="hidden" value="<%=idx%>" name="board_idx" id="board_idx">
						</div>
						<div class="form-group"
							style="display: block; float: right; padding: 12px; width: 11%;">
							<button type="submit" class="btn btn-primary" onclick='insert_reply()'
								style="width: 100%;">등록</button>
						</div>
							<%
					}else{
				%>
				<p style="color:gray;">로그인해주세요<p>
				<%} %>
					</div>
				<!-- </form> -->
				
				
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


<input type="hidden" id="post_seq" value="<%=dto.getBoard_idx()%>"/>
<input type="hidden" id="post_pw" value="<%=dto.getBoard_pw()%>"/>
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
	////////////////////////// 댓글 리스트
	var reply_table = $('.table-sm');
	var board_idx = <%=idx%>;
	$(document).ready(function(){
		show_reply();
	});
	
	function show_reply(){
		var reply_list;
		console.log(board_idx);
		$.ajax({
			url : 'ReplyReadCon.do',
			type : "post",
			data : 'board_idx='+board_idx,
			dataType:'json',
			success: function(result){
				//alert("댓글 가져오기 성공");
				for(var i=0;i<result.length;i++){
					reply_list+="<tr>";
					reply_list+='<td class="table-active" style="width: 2%;"></td>';
					reply_list+='<td class="table-active" style="width: 15%;">'+result[i].reply_id+'</td>';
					reply_list+='<td class="table-active" style="width: 60%;">'+result[i].reply_content+'</td>';
					reply_list+='<td class="table-active" style="width: 15%;">'+result[i].reply_date+'</td>';
					reply_list+='<td class="table-active" style="width: 8%; text-align: center;">';
					reply_list+='<button type="button" class="btn btn-delete" id="reply_idx" value="'+result[i].reply_idx+'"style="padding: 0;" onclick="reply_delete('+result[i].reply_idx+')">';
					reply_list+='삭제'
					reply_list+='</button>'
					reply_list+='</td>'
					reply_list+="</tr>";
					
				}
				reply_table.text("");
				reply_table.append(reply_list);
			},
			error: function(){
				alert("댓글 가져오기 실패");
			}
		})
	};
	///////////////////////// 댓글 달기
	
	function insert_reply(){
		//var insert_reply = $('.table-sm');
		var reply_id = $('#reply_id').val();
		var member_seq = $('#member_seq').val();
		var board_idx = $('#board_idx').val();
		var reply_content = $('#reply_content').val();
		var reply_list;
		$.ajax({
			url : 'ReplyWriteCon.do',
			type : "post",
			data :{"reply_id":reply_id,
				"member_seq":member_seq,
				"board_idx":board_idx,
				"reply_content":reply_content},
			dataType:'json',
			success : function(result){
				
				//alert("전송 성공");
				show_reply();
				$('#reply_content').val('');
			},
			error : function(result){
				alert("전송 실패");
			}
		});
	};
	<!-- //////////// 댓글 삭제 -->
		function reply_delete(idx){
			console.log(idx);
			$.ajax({
				url : 'ReplyDeleteCon.do',
				type : 'post',
				data : "reply_idx="+idx,
				dataType : 'json',
				success: function(result){
					alert("삭제 성공");
					show_reply();
					
				},
				error:function(){
					alert("삭제 실패");
				}
			});
		};

		/* 	///////////////////////게시글 삭제 */
		var post_seq = document.getElementById("post_seq").value;
		var pw = document.getElementById("post_pw").value;
		console.log(post_seq);
		console.log(pw);
		
		$("#post_delete").click(function() {
			//var input_id = prompt("아이디를 입력하세요 ")
			var input_pw = prompt("비밀번호를 입력하세요 ")
			if(input_pw==pw){
				console.log("성공");
				$.ajax({
					type:"post",
					url:"DeletePostCon.do",
					data:"post_seq="+post_seq,
					success:function(){
						alert("삭제되었습니다.")
						location.href = "board_community.jsp";
					}
				});
				
			}else{
				alert("잘못된 비밀번호입니다.")
			}
			
		});
	</script>


</body>
</html>
