<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="mail.MailSend" %>
<%@ page import="kmem.dao.*" %>
<%@ page import="kmem.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메일 보내기</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String email = request.getParameter("email");
	String id = request.getParameter("id");
	
	KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
	KosmoMemberVO kmvo = new KosmoMemberVO();
	kmvo.setKid(id);
	
	ArrayList<KosmoMemberVO> aList = null;
	aList = kmdao.pwSelect(kmvo); //아이디로 기존 비밀번호 조회
	System.out.println("aList.size() >> "+ aList.size());
	
	//아이디가 존재하면
	if(aList.size() > 0){
		//임시비밀번호로 비번 업데이트
		kmvo.setKpw(aList.get(0).getKpw());//기존비밀번호 
		kmdao.pwUpdate(kmvo);
		aList = kmdao.pwSelect(kmvo);
		
		//메일 정보 세팅
		MailSend ms = new MailSend();
		ms.setToEmailAddr(email);//유저 이메일 주소
		ms.setUserId(id);//유저 아이디
		ms.setUserPw(aList.get(0).getKpw());//유저 임시비밀번호 
		ms.sendMail();//메일 발송
		
		out.println("메일이 발송되었습니다.");
	}
	else{
		out.println("해당 아이디는 존재하지 않습니다.");
	}
%>
</body>
</html>