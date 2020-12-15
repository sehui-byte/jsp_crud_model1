<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kboard.dao.KosBoardDAO"%>
<%@ page import="kboard.dao.KosBoardDAOImpl"%>
<%@ page import="kboard.vo.KosBoardVO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��ȸ</title>
<style>
	table {
		border-color: gray;
		border-collapse: collapse;
		width : 900px;
		display: table;
		margin-top: 5%;
		margin-left: auto;
		margin-right: auto;
		
	}
	
	td {
		border-bottom: 1px solid #ddd;
		word-break : break-all; /*�ڵ��ٹٲ�*/
	}
	
	
	tr:nth-child(even) {background-color: #f2f2f2;}
	
	th{
		width : 10%;
  		background-color: #4CAF50;
  		color: white;
  		border-bottom: 1px solid #ddd;
}
</style>
</head>

<!-- �޴�(navbar) -->
	<div id="nav">
		<jsp:include page="/home/header.jsp" />
	</div>
	
<body>
	<!-- �۹�ȣ, ����, �ۼ���, �Է���, ���� -->
	<%
		request.setCharacterEncoding("EUC-KR");
	
		KosBoardDAO kbdao = new KosBoardDAOImpl();
		KosBoardVO kbvo = new KosBoardVO();
		String kno = request.getParameter("kno"); //�۹�ȣ
		kbvo.setKno(kno);
		ArrayList<KosBoardVO> aList = null;
		aList = kbdao.boardSelect(kbvo);
		
		String ktitle = aList.get(0).getKsubject();
		String kname = aList.get(0).getKname();
		String kinsertdate = aList.get(0).getKinsertdate();
		String kmemo = aList.get(0).getKmemo();
	
	%>
	<form>
		<table>
			<tr>
				<td colspan="2" align="center">�Խ��� �� ��ȸ</td>
			</tr>
			<tr>
				<th align="center">�۹�ȣ</th>
				<!-- readonly�� ����ؼ� kno�� ����� �� ���� �����.-->
				<td><%=kno %></td>
			</tr>
			<tr>
				<th align="center">����</th>
				<td><%=ktitle %></td>
			</tr>
			<tr>
				<th align="center">�ۼ���</th>
				<td><%=kname %></td>
			</tr>

			<tr>
				<th align="center">�Է���</th>
				<td><%=kinsertdate %></td>
			</tr>

			<tr>
				<th align="center">����</th>
				<td><%=kmemo %></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="����"
					onclick=""></td>
			</tr>
		</table>
	</form>
</body>
</html>