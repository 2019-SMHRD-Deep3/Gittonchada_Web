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
        <title>SOLGIT-로그인</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<style>
.btn-primary {
color: #fff;
background-color: #FFA500;
border-color: #fe9b29;
}

.btn-primary:hover {
    color: #fff;
    background-color: #fe9b29;
    border-color: #FFA500;
}

a {
    color: #FFA500;
    text-decoration: none;
    background-color: transparent;
}
a:hover {
    color: #fe9b29;
    text-decoration: underline;
}
</style>
    </head>
    <%
      MemberDTO info = (MemberDTO) session.getAttribute("info");
  	 %>
    <!-- 전체 화면 -->
    <!--  로그인 실패 판단여부 -->
	<script language=javascript>
      if ("<%=request.getParameter("success")%>"=="False") {
                 alert('로그인 실패');
      } 
   </script>
    <body class="bg-primary" style="background-color: rgba(0, 0, 0, 0.11) !important;">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                        <form action="LoginService.do">
                                            <div class="form-group"><label class="small mb-1" for="inputEmailAddress">이메일</label><input name="email" class="form-control py-4" id="inputEmailAddress" type="email" placeholder="이메일을 입력해주세요."/></div>
                                            <div class="form-group"><label class="small mb-1" for="inputPassword">비밀번호</label><input name="pw" class="form-control py-4" id="inputPassword" type="password" placeholder="비밀번호를 입력해주세요."/></div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox"><input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" /><label class="custom-control-label" for="rememberPasswordCheck">비밀번호 기억하기</label></div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="small" href="password.jsp">비밀번호를 잊어버리셨나요?</a><button type="submit" class="btn btn-primary" href="#">로그인하기</button></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="register.jsp">계정이 없으신가요? 계정 생성하기</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
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
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
