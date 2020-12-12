<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kmem.dao.KosmoMemberDAO"%>
<%@ page import="kmem.dao.KosmoMemberDAOImpl"%>
<%@ page import="kmem.vo.KosmoMemberVO"%>
<%@ page import="java.util.ArrayList"%>

<!--  POST��� ���ڵ� -->
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KOSMEMBER UPDATE</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- ����̽��� ����ȭ�� ũ��� ��µ� -->
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
				<td width="100" align="center">ȸ����ȣ</td>
				<td><input type="text" name="knum"
					value=<%= aList.get(0).getKnum() %> readonly /></td>
			</tr>
			<tr>
				<% 
				//��̴� �������̹Ƿ� �迭�� �޾ƿ´�.
				String hobbyList[] = aList.get(0).getKhobby().split(" ");
			%>
				<td class="member" align="center">���</td>
				<td><input type="checkbox" name="hobby" value="book"
					<% for(String h : hobbyList){
							if(h.equals("book")) out.print("checked");
							}%> />����
					<input type="checkbox" name="hobby" value="sports"
					<% for(String h : hobbyList){
							if(h.equals("sports")) out.print("checked");
							}%> />�
					<input type="checkbox" name="hobby" value="music"
					<% for(String h : hobbyList){
							if(h.equals("music")) out.print("checked");
							}%> />���ǰ���
					<input type="checkbox" name="hobby" value="journey"
					<% for(String h : hobbyList){
							if(h.equals("journey")) out.print("checked");
							}%> />����</td>
			</tr>
			<tr>
				<td class="member" align="center">����</td>
				<td><select name="local" id="local">
						<option value="seoul"
							<% if("seoul".equals(aList.get(0).getKlocal())) 
										out.print("checked");%>>����</option>
						<option value="gyenggido"
							<% if("seoul".equals(aList.get(0).getKlocal())) 
										out.print("checked");%>>��⵵</option>
						<option value="junju"
							<% if("seoul".equals(aList.get(0).getKlocal())) 
										out.print("checked");%>>����</option>
				</select></td>
			</tr>
			<tr>
				<td align="center">�Ұ���</td>
				<td><textarea name="msg" id="msg" rows="5" cols="50"><%= aList.get(0).getKmsg() %>				
				</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="����"
					onclick="checkAction(this.form);">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="�ٽ�">
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</form>

</body>
</html>