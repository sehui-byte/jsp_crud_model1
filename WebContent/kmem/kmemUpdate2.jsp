<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kmem.dao.KosmoMemberDAO"%>
<%@ page import="kmem.dao.KosmoMemberDAOImpl"%>
<%@ page import="kmem.vo.KosmoMemberVO"%>
<%@ page import="java.util.ArrayList"%>

<!--  POST방식 인코딩 -->
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KOSMEMBER UPDATE</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 디바이스에 최적화된 크기로 출력됨 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<%
   KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
   KosmoMemberVO kmvo = null;
   kmvo = new KosmoMemberVO();

   //수정가능 : 취미, 지역, 소개글
   String knum = request.getParameter("knum");
   String hobby[] = request.getParameterValues("hobby");
   String local = request.getParameter("local");
   String msg = request.getParameter("msg");
   
   System.out.println("knum >> " + knum);
   System.out.println("hobby >> " + hobby);
   System.out.println("local >> " + local);
   System.out.println("msg >> " + msg);
   
   StringBuffer sb = new StringBuffer();
   for(int i = 0; i<hobby.length; i++){
      sb.append(hobby[i] + " ");
   }
   String hobbyString = sb.toString();
   kmvo.setKnum(knum);
   kmvo.setKhobby(hobbyString);
   kmvo.setKlocal(local);
   kmvo.setKmsg(msg);
   
   boolean isUpdated = kmdao.memUpdate(kmvo);
   System.out.println("update good >>" + isUpdated);
   if(isUpdated){
	 %>
	   <script>
		alert("정보가 수정되었습니다.");
		location.href="/testISUD/kmem/kmemSelectAll.jsp";
		</script>
	<% 
   }
   else { %>
   <script>
	   alert("정보 수정에 실패했습니다. 다시 시도해주세요.");
		history.go(-1);
		</script>
 <% } %>

</head>


<body>
<% request.setCharacterEncoding("EUC-KR"); %>
</body>
</html>