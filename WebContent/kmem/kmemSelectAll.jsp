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
			<td colspan="12" align="center">KosMember ���̺� ��ü��ȸ</td>
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