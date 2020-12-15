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
<title>���� ������</title>
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
	aList = kmdao.pwSelect(kmvo); //���̵�� ���� ��й�ȣ ��ȸ
	System.out.println("aList.size() >> "+ aList.size());
	
	//���̵� �����ϸ�
	if(aList.size() > 0){
		//�ӽú�й�ȣ�� ��� ������Ʈ
		kmvo.setKpw(aList.get(0).getKpw());//������й�ȣ 
		kmdao.pwUpdate(kmvo);
		aList = kmdao.pwSelect(kmvo);
		
		//���� ���� ����
		MailSend ms = new MailSend();
		ms.setToEmailAddr(email);//���� �̸��� �ּ�
		ms.setUserId(id);//���� ���̵�
		ms.setUserPw(aList.get(0).getKpw());//���� �ӽú�й�ȣ 
		ms.sendMail();//���� �߼�
		
		out.println("������ �߼۵Ǿ����ϴ�.");
	}
	else{
		out.println("�ش� ���̵�� �������� �ʽ��ϴ�.");
	}
%>
</body>
</html>