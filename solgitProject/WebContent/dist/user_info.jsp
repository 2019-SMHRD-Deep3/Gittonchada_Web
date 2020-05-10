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
        <title>SOLGIT-회원정보</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    </head>
    <!-- 회원정보 변경 성공 판단여부   -->
	<script language=javascript>
    if ("<%=request.getParameter("editsuccess")%>"=="False") {
			alert('회원정보 수정 실패');
		}
	</script>
    <body class="bg-primary" style="background-color: rgba(0, 0, 0, 0.1) !important;">
    <%
      MemberDTO info = (MemberDTO) session.getAttribute("info");
   	%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원정보</h3></div>
                                    <div class="card-body">
                                        <form action="EditService.do">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputEmailAddress">이 메 일</label><input name="email" value='<%= info.getEmail() %>' class="form-control py-4" id="inputEmailAddress" type="email" aria-describedby="emailHelp" placeholder='<%= info.getEmail() %>' readOnly /></div> <!-- disabled 인풋태그 입력값 변경 안됨 -->
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputTelNumber">전화번호</label><input name="phone" value='<%= info.getPhone() %>' id="inputTelNumber" type="tel" class="form-control py-4" placeholder='<%= info.getPhone() %>' readOnly /> </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputName">이　름</label><input name="name" value='<%= info.getName() %>' class="form-control py-4" id="inputName" type="text" placeholder=' <%= info.getName() %>' readOnly /></div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group"><label class="small mb-1" for="inputDate">생년월일</label><input name="birth" value='<%= info.getBirth().substring(0,10) %>' id="inputDate" type="date" class="form-control py-4" placeholder='<%= info.getBirth().substring(0,10) %>' readOnly /></div>
                                                </div>
                                            </div>
                                            <input type="hidden" name="seq"  value=${info.seq} class="infoSeq">
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><div class="small" id="btnCreate">　</div><button type="button" id="confirm" class="btn btn-primary" data-toggle="modal" data-target="#myModal">회원정보수정</button></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="login.jsp">로그인으로 돌아가기</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 모달 영역 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">비밀번호 입력</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="form-row"style="padding-left: 30px; padding-right: 30px; padding-top: 30px; padding-bottom: 30px;">
								<div class="col-md-6">
                                   <div class="form-group" style="padding-right: 20px;"><label class="small mb-1" for="inputPassword">비밀번호</label><input name="pw" value="" class="form-control py-4" id="inputPassword" type="password" placeholder="비밀번호 입력" /></div>
                                </div>
                                <div class="col-md-6">
                                   <div class="form-group" style="padding-left: 20px;"><label class="small mb-1" for="inputConfirmPassword">비밀번호 확인</label><input class="form-control py-4" id="inputConfirmPassword" type="password" placeholder="비밀번호 확인 입력" /></div>
                                </div>
                                <div>
                                	<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
                                </div>
                                </div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id="openModalBtn">확인</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" id="closeModalBtn">취소</button>
								</div>
							</div>
						</div>
					</div>
					<% if(info!=null){ %>
					<input type="hidden" value=${info.pw} class="infoPw">
					<% } %>
				<script>
				// 모달 버튼에 이벤트를 건다.
				$('#openModalBtn').on('click', function() {
					$('#myModal').modal('hide');
					var infoPw = document.querySelector('.infoPw').value;
					console.log(infoPw);
					var inputPw = document.querySelector('#inputPassword').value;
					console.log(inputPw);
					var infoSeq = document.querySelector('.infoSeq').value;
					console.log(infoSeq);
					if (infoPw==inputPw){
						$('#inputName').prop('readOnly','');
						$('#inputTelNumber').prop('readOnly','');
						$('#inputDate').prop('readOnly','');
						$("#btnCreate").append('<button type="submit" class="btn btn-primary" id="change">회원정보변경</button>');
						$('#confirm').hide();
						/* $('#change').on('click', function() {
							window.location = window.location; 
						}); */
					} else {
						alert("틀림");
					}
					 
					
					
				});
				/* // 모달 안의 취소 버튼에 이벤트를 건다.
				$('#closeModalBtn').on('click', function() {
					$('#myModal').modal('hide');
					console.log("click close");
				});
				$('#modalBox').on('show.bs.modal', function(e) {
					console.log("show.bs.modal");
				});
				$('#modalBox').on('shown.bs.modal', function(e) {
					console.log("shown.bs.modal");
				});
				$('#modalBox').on('hide.bs.modal', function(e) {
					console.log("hide.bs.modal");
				});
				$('#modalBox').on('hidden.bs.modal', function(e) {
					console.log("hidden.bs.modal");
				}); */
				</script>
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
