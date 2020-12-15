<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<style>
#loginForm {
	display: table;
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
}

.btns{
	margin-top: 1%;
	text-align: center;
}

</style>
<script>
	function checkAction(actionName) {
		alert('로그인 버튼 클릭');
		if (actionName == 'login') {
			document.loginForm.action = "/modelone/login/loginCheck.jsp";
			document.loginForm.method = "POST";
			//application/x-www-form-urlencoded
			//기본값으로, 모든 문자들은 서버로 보내기 전에 인코딩됨을 명시함.
			document.loginForm.enctype = "application/x-www-form-urlencoded";
			//서버로 보냄
			
		}
		
		else if(actionName == 'logout'){
			document.loginForm.action ="/modelone/login/logout.jsp";
			document.loginForm.method="POST";
			document.loginForm.enctype = "application/x-www-form-urlencoded";
			
		}
		
		document.loginForm.submit();
	}
	
	function sendMail(){
		window.open("../login/findPw.jsp", "", "width=500, height=500, resizable=no, scrollbars=no, status=no");
	}
</script>
</head>
<body>

	<%
if(session.getAttribute("id") == null){
%>

	<!-- 로그인 폼 -->
	<form name="loginForm" id="loginForm">
		<div class="row mb-3">
			<label for="inputEmail3" class="col-sm-5 col-form-label">Id</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="id" id="id">
			</div>
		</div>
		<div class="row mb-3">
			<label for="inputPassword3" class="col-sm-5 col-form-label">Password</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="pw" id="pw">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-10 offset-sm-2">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="autoLogin">
					<label class="form-check-label" for="gridCheck1"> 자동로그인 </label>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary"
			onclick="checkAction('login');">로그인</button>
	</form>
	<div class = "btns">
		<button type="submit" class="btn btn-dark" id="findPwBtn" onclick="sendMail()">비밀번호
			찾기</button>
		<button type="submit" class="btn btn-dark" id="signInBtn" onclick="location.href='../kmem/kmem.html'">
			회원가입</button>
	</div>

	<% }
else { %>
	<form name="loginForm" id="loginForm">
		<button onclick="checkAction('logout');">로그아웃</button>
	</form>
	<% } %>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>