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
<title>게시판 리스트</title>
<!-- 부트스트랩 적용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	
	<style> 
		#writeBtn{float: right; margin-right : 8%; }
		#pagination { display: table; margin-left: auto; margin-right: auto; } 
		td{
			/* max-width넘어가면 말줄임표(...)로 표시 */
			overflow: hidden;
			white-space : nowrap;
			text-overflow: ellipsis;
			max-width: 140px;
		}
		table{
			/* 테이블 길이 고정 */
			table-layout:fixed;
		}
		
		tr:hover {background-color: #f5f5f5;}
	</style>
</head>

<body>
<%
	int pageSize = 10; //한 페이지에 출력할 레코드 수
	String pageNum = request.getParameter("pageNum"); //페이지 번호
	if(pageNum == null || pageNum.equals("")){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);//현재 페이지
	int startRow = 1 + (currentPage-1)*pageSize;//한 페이지 시작 게시물 번호
	int endRow = startRow + (pageSize-1);//한 페이지 끝 게시물 번호

	KosBoardDAO _kbdao = new KosBoardDAOImpl();
	ArrayList<KosBoardVO> aList = _kbdao.PageListSelect(startRow, endRow);
	int listCount = aList.size(); //한 페이지에 출력될 게시물 수
	int totalCount = _kbdao.boardTotalCount();//총 레코드 수
	int totalPage = (int)(Math.ceil((double)totalCount/(double)pageSize));//총페이지수
	int pageBlock = 5; //1~5/6~10 페이지는 다섯페이지씩 보여줄 것
	 //현재 페이지 블락(1~5페이지:1블락, 6~10페이지:2블락...)
	int currentBlock = (currentPage%pageBlock == 0?currentPage/pageBlock:currentPage/pageBlock+1);
	int totalBlock = totalPage%pageBlock+1;//전체 블락수
	
	//확인용 출력부분/////////////////////////////////
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

	<!-- 메뉴(navbar) -->
	<div id="nav">
		<jsp:include page="/home/header.jsp" />
	</div>

	<!-- 게시물 목록 -->
	<h1 align="center">게시물 목록</h1>
	<p align="center">총 게시물 수 : <%= totalCount  %></p>

	<% if (listCount == 0) { %>
	게시물이 없습니다.
	<% } else { %>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
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
	<!--  글쓰기 버튼  -->
	<button type="button" class="btn btn-outline-primary" id = "writeBtn" onclick="location.href = 'kBoardWrite.html'">글쓰기</button>
	<br><br>

	<!-- 페이징 -->
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