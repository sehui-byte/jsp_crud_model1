<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kmem.dao.KosmoMemberDAO" %>
<%@ page import = "kmem.dao.KosmoMemberDAOImpl" %>
<%@ page import = "kmem.vo.KosmoMemberVO" %>
<%@ page import = "kmem.common.Password" %>
<% request.setCharacterEncoding("EUC-KR"); %> 

<%
	KosmoMemberDAO kdao = new KosmoMemberDAOImpl();
	KosmoMemberVO kvo = null;
	kvo = new KosmoMemberVO();
	
	String kname = request.getParameter("name");
	String kid = request.getParameter("id");
	String kpw = request.getParameter("pw");
	String khp = request.getParameter("hp1");
	khp += "-";
	khp += request.getParameter("hp2");
	khp += "-";
	khp += request.getParameter("hp3");
	String kgender = request.getParameter("gender");
	
	//����� ��� �ߺ������� �����ϹǷ� �迭�� �޴´�
	String [] hobbyTmp = request.getParameterValues("hobby");
	StringBuffer sb = new StringBuffer();
	for(int i = 0; i<hobbyTmp.length; i++){
		sb.append(hobbyTmp[i] + " ");
	}
	String khobby = sb.toString();
	
	String klocal = request.getParameter("local");
	String kmsg = request.getParameter("msg");
	
	kvo.setKname(kname);
	kvo.setKid(kid);
	//kvo.setKpw(Password.pwSHA(kpw)); //��й�ȣ��ȣȭ
	kvo.setKpw(kpw);
	kvo.setKhp(khp);
	kvo.setKgender(kgender);
	kvo.setKhobby(khobby);
	kvo.setKlocal(klocal);
	kvo.setKmsg(kmsg);
	
	boolean isComplete = kdao.memInesert(kvo);
	if(isComplete){
		System.out.println("insert good!");
	}
	else{
		System.out.println("insert fail...");
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KosmoMember insert</title>
</head>
<body>
KosmoMember insert
</body>
</html>