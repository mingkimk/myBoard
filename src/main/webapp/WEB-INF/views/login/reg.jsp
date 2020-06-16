<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- css 연동 현재 안됨 0612 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/myBoard/resources/main.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/myBoard/resources/util.css">
<title>Login V14</title>
<form enctype="multipart/form-data" method="post"></form>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--==============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/util.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/main.css">
<!--===============================================================================================-->
<script type="text/javascript" src="myBoard/resources/main.js"></script>

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form name="frm" method="post" action="loginPro"
					class="login100-form validate-form flex-sb flex-w">
					<div class="ui middle aligned center aligned grid">
						<div class="column">
							<h2 class="ui teal image header">회원가입 페이지</h2>
							<div class="ui large form">
								<div class="ui stacked segment">
									<div class="field">
										<span class="txt1 p-b-11">your id </span>
										<div class="wrap-input100 validate-input m-b-36"
											data-validate="Username is required">
											<input class="input100" type="text" id="u_id" name="id">
											<span class="focus-input100"></span>
										</div>
										<span class="txt1 p-b-11"> Password </span>
										<div class="wrap-input100 validate-input m-b-12"
											data-validate="Password is required">
											<span class="btn-show-pass"> <i class="fa fa-eye"></i>
											</span> <input class="input100" type="password" id="u_pw"
												name="pass1" placeholder="비밀번호"> <span
												class="focus-input100"></span>
										</div>
										<span class="txt1 p-b-11"> Password </span>
										<div class="wrap-input100 validate-input m-b-12"
											data-validate="Password is required">
											<span class="btn-show-pass"> <i class="fa fa-eye"></i>
											</span> <input class="input100" type="password" name="pass2"
												id="u_pw2" placeholder="비밀번호 확인"> <span
												class="focus-input100"></span>
										</div>


									</div>
									<button class="login100-form-btn" id="register_btn">회원가입</button>
								</div>

								<div class="ui error message"></div>

							</div>

							<div class="ui message">
								로그인 할 계정이 있다면 <a href="/board/login">여기</a>를 눌러주세요.
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script
		src="<%=request.getContextPath()%>/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="<%=request.getContextPath()%>/login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="<%=request.getContextPath()%>/login/vendor/bootstrap/js/popper.js"></script>
	<script
		src="<%=request.getContextPath()%>/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="<%=request.getContextPath()%>/login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="<%=request.getContextPath()%>/login/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="<%=request.getContextPath()%>/login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/resources/main.js"></script>
	<script type="text/javascript" src="resources/main.js"></script>
	<script src="/resources/main.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$("#register_btn")
									.click(
											function() {
												var json = {
													u_id : $("#u_id").val(),
													u_pw : $("#u_pw").val(),
													u_pw2 : $("#u_pw2").val()
												};

												for ( var str in json) {
													if (json[str].length == 0) {
														alert($("#" + str)
																.attr(
																		"placeholder")
																+ " 정보를 입력해주세요.");
														$("#" + str).focus();
														return false;
													}
												}

												$
														.ajax({
															type : "post",
															url : "register",
															data : json,
															success : function(
																	data) {
																switch (Number(data)) {
																case 0:
																	alert("정상적으로 회원가입 되었습니다.");
																	window.location.href = "/coco";
																	break;
																case 1:
																	alert("아이디가 중복 되었습니다.");
																	break;
																default:
																	alert("알수없는 오류가 발생 했습니다. [Error Code :"
																			+ Number(data)
																			+ "]");
																	break;
																}
															},
															error : function(
																	error) {
																alert("오류 발생"
																		+ error);
															}
														});
											});
						});
	</script>
</body>
</html>