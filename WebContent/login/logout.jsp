<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//세션종료
session.invalidate();
//홈화면으로 돌아가기
response.sendRedirect("/modelone/home/home.jsp");
%>
</body>
</html>