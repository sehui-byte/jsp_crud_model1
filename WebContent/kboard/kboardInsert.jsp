<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "kboard.dao.KosBoardDAO" %>
<%@ page import = "kboard.dao.KosBoardDAOImpl" %>
<%@ page import = "kboard.vo.KosBoardVO" %>
<% request.setCharacterEncoding("EUC-KR");%>  

<%	
	String isudType=request.getParameter("ISUD_TYPE");
	System.out.println("isudType>>>:"+isudType);
	
	String kno=request.getParameter("kno");
	String ksubject=request.getParameter("ksubject");
	String kname=request.getParameter("kname");
	String kpw=request.getParameter("kpw");
	String kmemo=request.getParameter("kmemo");
	
	System.out.println(isudType+" : "
						+kno+" : "
						+ksubject+" : "
						+kname+" : "
						+kpw+" : "
						+kmemo);
	
	if(isudType !=null){
		System.out.println("isudType>>>:"+isudType);
		boolean bool= "I".equals(isudType.toUpperCase());
		
		if(bool){
			KosBoardDAO kbdao = new KosBoardDAOImpl();
			System.out.println("kbdao >>> : "+kbdao);
			
			KosBoardVO kbvo = null;
			kbvo=new KosBoardVO();
			
			kbvo.setKsubject(ksubject);
			kbvo.setKname(kname);
			kbvo.setKpw(kpw);
			kbvo.setKmemo(kmemo);
			
			boolean isInserted = kbdao.boardInesert(kbvo);
			
			if(isInserted){
%>
			<script>
				console.log('�Խù��� ��ϵǾ����ϴ�.');				
				location.href="/kboard/kboardList.jsp";
			</script>
<%				
				
			}else{
%>
			<script>
				console.log('�۾��� ����');				
				location.href="/kboard/kboardInsert.jsp";
			</script>
<%
			}//end of if(nCnt>=1)
		}else{
			out.println("ISUD_TYPE�� �� �ѱ⼼��");
		}//end of if(bool)
	}//end of if(isudType !=null)
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ������</title>
</head>
<body>

</body>
</html>