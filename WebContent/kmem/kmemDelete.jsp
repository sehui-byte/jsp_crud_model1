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
	//Ŭ���̾�Ʈ�� ���� ������ �����
	//jsp������ ������Ʈ request ��ü�� �̿��Ͽ� ����
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