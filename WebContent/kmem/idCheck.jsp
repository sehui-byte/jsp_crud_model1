<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="kmem.dao.KosmoMemberDAO" %>
<%@ page import="kmem.dao.KosmoMemberDAOImpl" %>
<%@ page import="kmem.vo.KosmoMemberVO" %>
    
<html>
<head>
<meta charset="EUC-KR">
<title> 아이디 체크 </title>
	
<script type="text/javascript">
	function sendID()
	{
		// 부모창 
		window.parent.opener.document.memberForm.id.value=
		// 자식창
		document.idform.id.value;
		// 자식창을 스스로 닫는다.
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
  		returnMsg = "사용중인 아이디입니다.";
  		returnKid = "";
  		
  	}
  	else{
  		returnMsg = "사용가능한 아이디입니다.";
  		returnKid = _kid;
  	}
%>			
<form name="idform" method="POST" action="<%= request.getRequestURI()%>">
	<h4><%= returnMsg %> </h4>
	<%= returnKid %><br>
	
	<input type="hidden" name="id" value="<%= returnKid %>"><br>
	<input type="submit" value="확인" onClick="sendID()">
</form>
</body>
</html>