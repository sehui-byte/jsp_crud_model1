<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kmem.dao.KosmoMemberDAO"%>
<%@ page import="kmem.dao.KosmoMemberDAOImpl"%>
<%@ page import="kmem.vo.KosmoMemberVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� üũ</title>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
	KosmoMemberVO kmvo = new KosmoMemberVO();
	boolean countExist = false;//���� ���翩��
	
	kmvo.setKid(id);
	System.out.println("id >> " + id);
	kmvo.setKpw(pw);
	System.out.println("pw >> " + pw);
	countExist = kmdao.loginCheck(kmvo);
	System.out.println("�α��� ���� ���� >> " + countExist);
	String pageUrl = ""; //�̵��� ������ �ּ�
	String msg ="";
	
	if(countExist){//���������ϸ�
		System.out.println("�α��� ����");
		msg = "�α��εǾ����ϴ�.";
		pageUrl = "/modelone/home/home.jsp";
		
		//���� �α���
		HttpSession kSession = request.getSession();
		System.out.println("kSession >> " + kSession);
		kSession.setAttribute("id",id);
	}
	else{//���� �������� ������
		System.out.println("�α��� ����");
		msg = "���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
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