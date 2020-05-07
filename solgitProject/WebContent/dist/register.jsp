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
        <title>SOLGIT-계정생성</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
    <!-- 회원가입 성공 판단여부   -->
	<script language=javascript>
    if ("<%=request.getParameter("joinsuccess")%>"=="False") {
			alert('회원가입 실패');
		}
	</script>
    <body class="bg-primary" style="background-color: rgba(0, 0, 0, 0.11) !important;">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">계정 생성하기</h3></div>
                                    <div class="card-body">
                                        <form action="JoinService.do">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputEmailAddress">이메일</label><input name="email" class="form-control py-4" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder="이메일 주소를 입력해주세요." /></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputTelNumber">전화번호</label><input name="phone"  id="inputTelNumber" type="tel" class="form-control py-4" placeholder="전화번호를 입력해주세요."></div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputName">이름</label><input name="name"  class="form-control py-4" id="inputName" type="text" placeholder="이름을 입력하세요." /></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputDate">생년월일</label><input name="birth"  id="inputDate" type="date" class="form-control py-4" placeholder="생년월일을 선택해주세요."></div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputPassword">비밀번호</label><input name="pw" class="form-control py-4" id="inputPassword" type="password" placeholder="비밀번호를 입력해주세요." /></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputConfirmPassword">비밀번호 확인</label><input class="form-control py-4" id="inputConfirmPassword" type="password" placeholder="비밀번호 확인해주세요." /></div>
                                                    <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
                                                </div>
                                            </div>
                                            <div class="form-group mt-4 mb-0"><button type="submit" class="btn btn-primary btn-block" href="#">계정 생성</button></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="login.jsp">계정이 있으신가요? 로그인하기</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
					    $('.form-control').focusout(function () {
					        var pwd1 = $("#inputPassword").val();
					        var pwd2 = $("#inputConfirmPassword").val();
					 
					        if ( pwd1 != '' && pwd2 == '' ) {
					            null;
					        } else if (pwd1 != "" || pwd2 != "") {
					            if (pwd1 == pwd2) {
					                // 비밀번호 일치 이벤트 실행
					            	 $("#alert-success").css('display', 'inline-block');
					                 $("#alert-danger").css('display', 'none');
					            } else {
					                // 비밀번호 불일치 이벤트 실행
					                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
					            	 $("#alert-success").css('display', 'none');
					                 $("#alert-danger").css('display', 'inline-block');
					            }
					        }
					    });
					</script>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 2020 © SOLGIT</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
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
