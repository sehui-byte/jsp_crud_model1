<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="kboard.dao.KosBoardDAO"%>
<%@ page import="kboard.dao.KosBoardDAOImpl"%>
<%@ page import="kboard.vo.KosBoardVO"%>
<%@ page import="java.util.ArrayList"%>

<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ����Ʈ</title>
<!-- ��Ʈ��Ʈ�� ���� -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	
	<style> 
		#writeBtn{float: right; margin-right : 8%; }
		#pagination { display: table; margin-left: auto; margin-right: auto; } 
		td{
			/* max-width�Ѿ�� ������ǥ(...)�� ǥ�� */
			overflow: hidden;
			white-space : nowrap;
			text-overflow: ellipsis;
			max-width: 140px;
		}
		table{
			/* ���̺� ���� ���� */
			table-layout:fixed;
		}
		
		tr:hover {background-color: #f5f5f5;}
	</style>
</head>

<body>
<%
	int pageSize = 10; //�� �������� ����� ���ڵ� ��
	String pageNum = request.getParameter("pageNum"); //������ ��ȣ
	if(pageNum == null || pageNum.equals("")){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);//���� ������
	int startRow = 1 + (currentPage-1)*pageSize;//�� ������ ���� �Խù� ��ȣ
	int endRow = startRow + (pageSize-1);//�� ������ �� �Խù� ��ȣ

	KosBoardDAO _kbdao = new KosBoardDAOImpl();
	ArrayList<KosBoardVO> aList = _kbdao.PageListSelect(startRow, endRow);
	int listCount = aList.size(); //�� �������� ��µ� �Խù� ��
	int totalCount = _kbdao.boardTotalCount();//�� ���ڵ� ��
	int totalPage = (int)(Math.ceil((double)totalCount/(double)pageSize));//����������
	int pageBlock = 5; //1~5/6~10 �������� �ټ��������� ������ ��
	 //���� ������ ���(1~5������:1���, 6~10������:2���...)
	int currentBlock = (currentPage%pageBlock == 0?currentPage/pageBlock:currentPage/pageBlock+1);
	int totalBlock = totalPage%pageBlock+1;//��ü �����
	
	//Ȯ�ο� ��ºκ�/////////////////////////////////
	System.out.println("totalCount >> " + totalCount);
	System.out.println("currentPage >> " + currentPage);
	System.out.println("startRow >> " + startRow);
	System.out.println("endRow >>> " + endRow);
	System.out.println("listCount >> " + listCount);
	System.out.println("totalPage >> " + totalPage);
	System.out.println("currentBlock >> " + currentBlock);
	System.out.println("totalBlock >> " + totalBlock);
	/////////////////////////////////////////
%>

	<!-- �޴�(navbar) -->
	<div id="nav">
		<jsp:include page="/home/header.jsp" />
	</div>

	<!-- �Խù� ��� -->
	<h1 align="center">�Խù� ���</h1>
	<p align="center">�� �Խù� �� : <%= totalCount  %></p>

	<% if (listCount == 0) { %>
	�Խù��� �����ϴ�.
	<% } else { %>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">��ȣ</th>
					<th scope="col">����</th>
					<th scope="col">�ۼ���</th>
					<th scope="col">��¥</th>
				</tr>
			</thead>

			<tbody>
				<%
	
					for (int i = 0; i < listCount; i++) {
						KosBoardVO kbvo = aList.get(i);
				%>
				<tr onclick ="location.href='kboardView.jsp?kno=<%=kbvo.getKno()%>'">
					<td scope="row" name="kno"><%=kbvo.getKno()%></td>
					<td scope="row"><%=kbvo.getKsubject()%></td>
					<td scope="row"><%=kbvo.getKmemo()%></td>
					<td scope="row"><%=kbvo.getKinsertdate()%></td>
				</tr>

				<%
						}
					}
				%>
			</tbody>
		</table>
	</div>
	<!--  �۾��� ��ư  -->
	<button type="button" class="btn btn-outline-primary" id = "writeBtn" onclick="location.href = 'kBoardWrite.html'">�۾���</button>
	<br><br>

	<!-- ����¡ -->
	<nav aria-label="..." id = "pagination">
		<ul class="pagination">
		<% if(currentBlock > 1){ %>
			<li class="page-item"><a class="page-link" href="kboardList.jsp?pageNum=<%=(currentBlock-1)*pageBlock-4%>">Previous</a></li>
			
			<%  }
				int start = currentBlock*5-4;
				int last = currentBlock*5;
				for(int i = start; i<=last; i++){ 
					if(totalPage >= i){
			%>
			<li class=<% if(i == currentPage) {out.print("\"page-item active\"");} else{out.print("\"page-item\"");}%> >
				<a class="page-link" href="kboardList.jsp?pageNum=<%=i%>"><%=i%></a>
			</li>
			<% 
				} 
			}
			if(totalBlock > currentBlock){ %>
					<li class="page-item"><a class="page-link" href="kboardList.jsp?pageNum=<%=(currentBlock+1)*pageBlock-4%>">Next</a></li>
			<% }%>
			
		</ul>
	</nav>

</body>
</html>