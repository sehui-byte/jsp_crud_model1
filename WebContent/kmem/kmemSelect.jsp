<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="kmem.dao.KosmoMemberDAO"%>
<%@ page import="kmem.dao.KosmoMemberDAOImpl"%>
<%@ page import="kmem.vo.KosmoMemberVO"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("EUC-KR"); %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KosMember SELECT</title>
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
		} else {
	%>

	<table border="1">
		<tr>
			<td colspan="12" align="center">KosmoMember SELECT</td>
		</tr>
		<tr>
			<td width="100" align="center">ȸ����ȣ</td>
			<td width="100" align="center">ȸ���̸�</td>
			<td width="100" align="center">���̵�</td>
			<td width="100" align="center">��й�ȣ</td>
			<td width="100" align="center">�ڵ�����ȣ</td>
			<td width="100" align="center">����</td>
			<td width="100" align="center">���</td>
			<td width="100" align="center">����</td>
			<td width="100" align="center">�Ұ���</td>
			<td width="100" align="center">deleteyn</td>
			<td width="100" align="center">insertdate</td>
			<td width="100" align="center">updatedate</td>
		</tr>
		<%
			for (int i = 0; i < aList.size(); i++) {
				KosmoMemberVO _kmvo = aList.get(i);
		%>
		<tr>
			<td width="100" align="center"><%= _kmvo.getKnum() %></td>
			<td width="100" align="center"><%= _kmvo.getKname() %></td>
			<td width="100" align="center"><%= _kmvo.getKid() %></td>
			<td width="100" align="center"><%= _kmvo.getKpw() %></td>
			<td width="100" align="center"><%= _kmvo.getKhp() %></td>
			<td width="100" align="center"><%= _kmvo.getKgender() %></td>
			<td width="100" align="center"><%= _kmvo.getKhobby() %></td>
			<td width="100" align="center"><%= _kmvo.getKlocal() %></td>
			<td width="100" align="center"><%= _kmvo.getKmsg() %></td>
			<td width="100" align="center"><%= _kmvo.getKdeleteyn() %></td>
			<td width="100" align="center"><%= _kmvo.getKinsertdate() %></td>
			<td width="100" align="center"><%= _kmvo.getKupdatedate() %></td>
			
			
		</tr>

		<%
			}
		}
		%>
	</table>



</body>
</html>