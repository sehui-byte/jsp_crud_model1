<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<script>
	function sendMail(){
		document.findPwForm.action="./sendPwMail.jsp";
		document.findPwForm.method="POST";
		
	}
</script>
</head>
<body>
<form name ="findPwForm" id="findPwForm">
	<div class="row mb-3">
		<label for="colFormLabelSm"
			class="col-sm-2 col-form-label col-form-label-sm">Email</label>
		<div class="col-sm-10">
			<input type="email" class="form-control form-control-sm" id="email"
				name="email" placeholder="이메일 주소 입력">
		</div>

		<div class="row mb-3">
			<label for="colFormLabelSm"
				class="col-sm-2 col-form-label col-form-label-sm">아이디</label>
			<div class="col-sm-10">
				<input type="text" class="form-control form-control-sm" id="id"
					name="id" placeholder="아이디 입력">
			</div>
			
			<button onclick="sendMail()">보내기</button>
</form>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
				crossorigin="anonymous"></script>
</body>
</html>