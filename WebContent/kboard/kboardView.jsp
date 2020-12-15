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
<title>게시물 조회</title>
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
		word-break : break-all; /*자동줄바꿈*/
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

<!-- 메뉴(navbar) -->
	<div id="nav">
		<jsp:include page="/home/header.jsp" />
	</div>
	
<body>
	<!-- 글번호, 제목, 작성자, 입력일, 내용 -->
	<%
		request.setCharacterEncoding("EUC-KR");
	
		KosBoardDAO kbdao = new KosBoardDAOImpl();
		KosBoardVO kbvo = new KosBoardVO();
		String kno = request.getParameter("kno"); //글번호
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
				<td colspan="2" align="center">게시판 글 조회</td>
			</tr>
			<tr>
				<th align="center">글번호</th>
				<!-- readonly을 사용해서 kno를 사용할 수 없게 만든다.-->
				<td><%=kno %></td>
			</tr>
			<tr>
				<th align="center">제목</th>
				<td><%=ktitle %></td>
			</tr>
			<tr>
				<th align="center">작성자</th>
				<td><%=kname %></td>
			</tr>

			<tr>
				<th align="center">입력일</th>
				<td><%=kinsertdate %></td>
			</tr>

			<tr>
				<th align="center">내용</th>
				<td><%=kmemo %></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="수정"
					onclick=""></td>
			</tr>
		</table>
	</form>
</body>
</html>