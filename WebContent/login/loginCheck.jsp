<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kmem.dao.KosmoMemberDAO"%>
<%@ page import="kmem.dao.KosmoMemberDAOImpl"%>
<%@ page import="kmem.vo.KosmoMemberVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 체크</title>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
	KosmoMemberVO kmvo = new KosmoMemberVO();
	boolean countExist = false;//계정 존재여부
	
	kmvo.setKid(id);
	System.out.println("id >> " + id);
	kmvo.setKpw(pw);
	System.out.println("pw >> " + pw);
	countExist = kmdao.loginCheck(kmvo);
	System.out.println("로그인 계정 존재 >> " + countExist);
	String pageUrl = ""; //이동할 페이지 주소
	String msg ="";
	
	if(countExist){//계정존재하면
		System.out.println("로그인 성공");
		msg = "로그인되었습니다.";
		pageUrl = "/modelone/home/home.jsp";
		
		//세션 로그인
		HttpSession kSession = request.getSession();
		System.out.println("kSession >> " + kSession);
		kSession.setAttribute("id",id);
	}
	else{//계정 존재하지 않으면
		System.out.println("로그인 실패");
		msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
		pageUrl = "/modelone/login/login.jsp";
	}

%>
<script>
	alert("<%=msg%>");
	location.href = "<%=pageUrl%>";
</script>
</head>
<body>
</body>
</html>