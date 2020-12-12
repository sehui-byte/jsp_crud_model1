<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<%@ page import="kmem.dao.KosmoMemberDAO"%>
<%@ page import="kmem.dao.KosmoMemberDAOImpl"%>
<%@ page import="kmem.vo.KosmoMemberVO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KosMember SELECTALL</title>
</head>
<body>
	<%
	KosmoMemberDAO kmdao = new KosmoMemberDAOImpl();
	ArrayList<KosmoMemberVO> aList = kmdao.memSelectAll();
	if (aList.size() == 0) {
	%>
	<table border="1">
		<tr>
			<td>NO DATA</td>
		</tr>
	</table>

	<%
		} else {
	%>

	<table border="1">
		<tr>
			<td colspan="12" align="center">KosMember 테이블 전체조회</td>
		</tr>
		<tr>
			<td width="100" align="center">회원번호</td>
			<td width="100" align="center">회원이름</td>
			<td width="100" align="center">아이디</td>
			<td width="100" align="center">비밀번호</td>
			<td width="100" align="center">핸드폰번호</td>
			<td width="100" align="center">성별</td>
			<td width="100" align="center">취미</td>
			<td width="100" align="center">지역</td>
			<td width="100" align="center">소개글</td>
			<td width="100" align="center">deleteyn</td>
			<td width="100" align="center">insertdate</td>
			<td width="100" align="center">updatedate</td>
		</tr>
		<%
			for (int i = 0; i < aList.size(); i++) {
				KosmoMemberVO kmvo = aList.get(i);
		%>
		<tr>
			<td width="100" align="center"><%= kmvo.getKnum() %></td>
			<td width="100" align="center"><%= kmvo.getKname() %></td>
			<td width="100" align="center"><%= kmvo.getKid() %></td>
			<td width="100" align="center"><%= kmvo.getKpw() %></td>
			<td width="100" align="center"><%= kmvo.getKhp() %></td>
			<td width="100" align="center"><%= kmvo.getKgender() %></td>
			<td width="100" align="center"><%= kmvo.getKhobby() %></td>
			<td width="100" align="center"><%= kmvo.getKlocal() %></td>
			<td width="100" align="center"><%= kmvo.getKmsg() %></td>
			<td width="100" align="center"><%= kmvo.getKdeleteyn() %></td>
			<td width="100" align="center"><%= kmvo.getKinsertdate() %></td>
			<td width="100" align="center"><%= kmvo.getKupdatedate() %></td>
			
			
		</tr>

		<%
			}
		}
		%>
	</table>
</body>
</html>