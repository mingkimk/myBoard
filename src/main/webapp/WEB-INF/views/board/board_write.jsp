<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
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
<title>게시글 자성 데모</title>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form name="frm" method="post" action="boardPro"
					class="login100-form validate-form flex-sb flex-w">
					<input type="hidden" name="command" value="log"> <span
						class="login100-form-title p-b-32"> 게시글 작성 페이지 </span> 
						
						<span
						class="txt1 p-b-11">제목 </span>
							<div class="wrap-input100 validate-input m-b-36"
						data-validate="Username is required">
						<input class="input100" type="text" name="id" id="b_title" placeholder="게시글 제목"> <span
							class="focus-input100"></span><br>
					</div>
						<span
						class="txt1 p-b-11">내용 입력 </span>
						<div class="wrap-input100 validate-input m-b-36"
						data-validate="Username is required"> 
					<textarea rows="5" id="b_content" placeholder="게시글 내용"></textarea>
					<br>
					</div>
						<input type="submit" class="login100-form-btn" id="wrtie_process" value="게시글 등록"
							onclick="return logCheck()">
					
					<p>
						게시글 목록으로 가고 싶다면 <a href="bbsConlist">여기</a>를 눌러주세요.
					</p>

					<script src="<%=request.getContextPath()%>/resources/main.js"></script>

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
	<script>
		$(document)
				.ready(
						function() {
							$("#wrtie_process")
									.click(
											function() {
												var json = {
													b_title : $("#b_title")
															.val(),
													b_content : $("#b_content")
															.val()
												};

												for ( var str in json) {
													if (json[str].length == 0) {
														alert($("#" + str)
																.attr(
																		"placeholder")
																+ "를 입력해주세요.");
														$("#" + str).focus();
														return;
													}
												}

												$
														.ajax({
															type : "post",
															url : "board_wrtie",
															data : json,
															success : function(
																	data) {
																switch (Number(data)) {
																case -1:
																	alert("로그인 후 이용해주세요.");
																	window.location.href = "/demo/";
																	break;
																case 0:
																	alert("정상적으로 등록이 되었습니다.");
																	window.location.href = "/demo/board_list";
																	break;

																default:
																	alert("알수없는 오류가 발생했습니다. [ErrorCode : "
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