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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/myBoard/resources/main.js"></script>
<title>게시글 작성 데모</title>
</head>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form name="frm" method="post" action="loginPro"
					class="login100-form validate-form flex-sb flex-w">
					<input type="hidden" name="command" value="log"> <span
						class="login100-form-title p-b-32"> 게시글 목록 페이지 </span>
					<!-- 게시글 목록 가져오기 -->
					<table border=1 aling=center width=1000>
						<tr>
							<td colspan=6 align=right>현재 접속자 : ${sessionScope.login } <a
								href="login"> 로그아웃 </a></td>
						</tr>
						<tr bgcolor="">
							<td align=center>#</td>
							<td align=center>작성자</td>
							<td align=center>제목</td>
							<td align=center>등록일</td>
							<td align=center>수정</td>
							<td align=center>삭제</td>
							
							<c:forEach items="${list}" var="vo">
								<tr bgcolor="white">
									<td align=center>${vo.name}</td>
									<td align=center>${vo.title}</td>
									<td align=center>${vo.date}</td>
									<td align=center><a
										href="view?id=${vo.id}&name=${vo.name}">${vo.id}</a></td>
									<%-- <td>
					<c:forEach begin="1" end="${vo.bIndent}">ㄴ</c:forEach>
					<a href="contentView?bNo=${vo.bNo}">${vo.bSubject}</a>
				</td>
				<td>${vo.bName}</td>
				<td>${vo.bDate}</td>
				<td>${vo.bHit}</td> --%>
									<td align=center><a href="bbsCondel?id=${vo.id}">Delete</a></td>
									<td align=center><a href="bbsConmodify?id=${vo.id}">Modify</a></td>
								</tr>
							</c:forEach>
						<tr>
							<td colspan=6 align=right><a href="bbsConinput">게시글 작성하기</a></td>

						</tr>
					</table>
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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/main.js"></script>

	<script src="<%=request.getContextPath()%>/resources/main.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							$
									.ajax({
										type : "GET",
										url : "get_board",
										success : function(data) {
											//12번 눌러서 콘솔로 이동하면 json형태의 데이터 확인
											console.log(data);

											//데이터의 크기만큼 돌려줌
											for ( var str in data) {
												//tr 태그를 생성해서 id에 tobody에 추가
												var tr = $("<tr></tr>")
														.appendTo("#tbody");
												//tr에 td를 추가 후 내용을 데이터 값
												$("<td></td>").text(
														data[str]['b_no'])
														.appendTo(tr);
												$("<td></td>").text(
														data[str]['b_title'])
														.appendTo(tr);
												$("<td></td>")
														.text(
																data[str]['b_owner_nick'])
														.appendTo(tr);
												$("<td></td>")
														.text(
																FormatToUnixtime(data[str]['b_regdate']))
														.appendTo(tr);
											}
										},
										error : function(error) {
											alert("오류 발생" + error);
										}
									});

							//유닉스 타임스템프를 년 월 일 시 분 초로 변경하기 위한 함수
							function FormatToUnixtime(unixtime) {
								var u = new Date(unixtime);
								return u.getUTCFullYear() + '-'
										+ ('0' + u.getUTCMonth()).slice(-2)
										+ '-'
										+ ('0' + u.getUTCDate()).slice(-2)
										+ ' '
										+ ('0' + u.getUTCHours()).slice(-2)
										+ ':'
										+ ('0' + u.getUTCMinutes()).slice(-2)
										+ ':'
										+ ('0' + u.getUTCSeconds()).slice(-2)
							}
							;
						});
	</script>
</body>

</html>
