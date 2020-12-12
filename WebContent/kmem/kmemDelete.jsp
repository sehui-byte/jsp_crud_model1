<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kmem.dao.KosmoMemberDAO"%>
<%@ page import="kmem.dao.KosmoMemberDAOImpl"%>
<%@ page import="kmem.vo.KosmoMemberVO"%>
<%@ page import="java.util.ArrayList"%>

<%
	KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
	KosmoMemberVO kmvo = null;
	kmvo = new KosmoMemberVO();
%>

<%
	//클라이언트와 서버 사이의 연결고리
	//jsp내장형 오브젝트 request 객체를 이용하여 연결
	String knum = request.getParameter("knum");
	kmvo.setKnum(knum);
	
	boolean isDeleted = kmdao.memDelete(kmvo);
	System.out.println("delete good >>" + isDeleted);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KosMember DELETE</title>
</head>
<body>
KosmoMember insert
</body>
</html>