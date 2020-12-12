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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<script type="text/javascript">
	function checkAction(f){
		f.action = "kmemUpdate2.jsp";
		f.submit();
	}
</script>
</head>

<body>
	<%
	KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
	String knum = request.getParameter("knum");
	System.out.println("knum >> " + knum);
	
	KosmoMemberVO kmvo = null;
	kmvo = new KosmoMemberVO();
	kmvo.setKnum(knum);
	
	ArrayList<KosmoMemberVO> aList = null;
	aList = kmdao.memSelect(kmvo);
	System.out.println("aList.size() >> " + aList.size());
	
	if(aList.size() < 1){
%>

	<table border="1">
		<tr>
			<td>NO DATA</td>
		</tr>
	</table>

	<%
		} 
	else {
	%>
	<form name="empForm" method="POST">
		<table border="1" style="background-color: lightskyblue;">
			<tr>
				<td colspan="2" align="center"><font size="4"
					style="color: dodgerblue;">KOSMOMEMBER</font></td>
			</tr>
			<tr>
				<td width="100" align="center">회원번호</td>
				<td><input type="text" name="knum"
					value=<%= aList.get(0).getKnum() %> readonly /></td>
			</tr>
			<tr>
				<% 
				//취미는 여러개이므로 배열로 받아온다.
				String hobbyList[] = aList.get(0).getKhobby().split(" ");
			%>
				<td class="member" align="center">취미</td>
				<td><input type="checkbox" name="hobby" value="book"
					<% for(String h : hobbyList){
							if(h.equals("book")) out.print("checked");
							}%> />독서
					<input type="checkbox" name="hobby" value="sports"
					<% for(String h : hobbyList){
							if(h.equals("sports")) out.print("checked");
							}%> />운동
					<input type="checkbox" name="hobby" value="music"
					<% for(String h : hobbyList){
							if(h.equals("music")) out.print("checked");
							}%> />음악감상
					<input type="checkbox" name="hobby" value="journey"
					<% for(String h : hobbyList){
							if(h.equals("journey")) out.print("checked");
							}%> />여행</td>
			</tr>
			<tr>
				<td class="member" align="center">지역</td>
				<td><select name="local" id="local">
						<option value="seoul"
							<% if("seoul".equals(aList.get(0).getKlocal())) 
										out.print("checked");%>>서울</option>
						<option value="gyenggido"
							<% if("seoul".equals(aList.get(0).getKlocal())) 
										out.print("checked");%>>경기도</option>
						<option value="junju"
							<% if("seoul".equals(aList.get(0).getKlocal())) 
										out.print("checked");%>>전주</option>
				</select></td>
			</tr>
			<tr>
				<td align="center">소개글</td>
				<td><textarea name="msg" id="msg" rows="5" cols="50"><%= aList.get(0).getKmsg() %>				
				</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="수정"
					onclick="checkAction(this.form);">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="다시">
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</form>

</body>
</html>