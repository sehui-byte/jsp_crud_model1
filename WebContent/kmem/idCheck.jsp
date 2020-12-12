<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="kmem.dao.KosmoMemberDAO" %>
<%@ page import="kmem.dao.KosmoMemberDAOImpl" %>
<%@ page import="kmem.vo.KosmoMemberVO" %>
    
<html>
<head>
<meta charset="EUC-KR">
<title> ���̵� üũ </title>
	
<script type="text/javascript">
	function sendID()
	{
		// �θ�â 
		window.parent.opener.document.memberForm.id.value=
		// �ڽ�â
		document.idform.id.value;
		// �ڽ�â�� ������ �ݴ´�.
		window.self.close();		
	}
</script>
</head>
<body>	
<%
	String _kid =  request.getParameter("id");
  	System.out.println("_kid >>>>" + _kid);	
  	
  	KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
  	KosmoMemberVO kmvo = null;
  	kmvo = new KosmoMemberVO();
  	kmvo.setKid(_kid);
  	System.out.println("kmvo >> " + kmvo);
  	boolean isDuplicated = kmdao.idCheck(kmvo);
  	
  	String returnMsg = "";
  	String returnKid = "";
  	
  	if(isDuplicated){
  		returnMsg = "������� ���̵��Դϴ�.";
  		returnKid = "";
  		
  	}
  	else{
  		returnMsg = "��밡���� ���̵��Դϴ�.";
  		returnKid = _kid;
  	}
%>			
<form name="idform" method="POST" action="<%= request.getRequestURI()%>">
	<h4><%= returnMsg %> </h4>
	<%= returnKid %><br>
	
	<input type="hidden" name="id" value="<%= returnKid %>"><br>
	<input type="submit" value="Ȯ��" onClick="sendID()">
</form>
</body>
</html>