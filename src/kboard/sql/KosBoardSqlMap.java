package kboard.sql;

public class KosBoardSqlMap {
	
	public static String getSelectAllQuery() {
		//KNO ,KSUBJECT ,KNAME ,KPW	, KMEMO 	 	
		//KDELETEYN  ,KINSERTDATE ,KUPDATEDATE
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT					\n");
		sb.append(" 		KNO				\n");
		sb.append("			,KSUBJECT		\n");
		sb.append("			,KNAME			\n");
		sb.append("			,KPW			\n");
		sb.append("			,KMEMO 			\n");
		sb.append("			,KDELETEYN		\n");
		sb.append(" 	  ,TO_CHAR(KINSERTDATE, 'YYYY-MM-DD') KINSERTDATE  	\n");
		sb.append(" 	  ,TO_CHAR(KUPDATEDATE, 'YYYY-MM-DD') KUPDATEDATE  	\n");
		sb.append("FROM KOSBOARD			\n");
		sb.append("WHERE	KDELETEYN = 'Y'	\n");
		sb.append("ORDER BY KNO DESC		\n");
	
		return sb.toString();
	}
	
	public static String getSelectQuery() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT					\n");
		sb.append(" 		KNO				\n");
		sb.append("			,KSUBJECT		\n");
		sb.append("			,KNAME			\n");
		sb.append("			,KPW			\n");
		sb.append("			,KMEMO 			\n");
		sb.append("			,KDELETEYN		\n");
		sb.append(" 	  ,TO_CHAR(KINSERTDATE, 'YYYY-MM-DD') KINSERTDATE  	\n");
		sb.append(" 	  ,TO_CHAR(KUPDATEDATE, 'YYYY-MM-DD') KUPDATEDATE  	\n");
		sb.append("FROM 	KOSBOARD		\n");
		sb.append("WHERE	KDELETEYN = 'Y'	\n");
		sb.append("AND 		KNO = ?			\n");
		
		return sb.toString();
	}
	
	//insert시에 kno는 채번로직 사용해야한다.
	public static String getInsertQuery() {
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO				\n");
		sb.append("			KOSBOARD		\n");
		sb.append("        (				\n");
		sb.append(" 		KNO				\n");
		sb.append("			,KSUBJECT		\n");
		sb.append("			,KNAME			\n");
		sb.append("			,KPW			\n");
		sb.append("			,KMEMO 			\n");
		sb.append("			,KDELETEYN		\n");
		sb.append("			,KINSERTDATE	\n");
		sb.append("			,KUPDATEDATE	\n");
		sb.append("			)				\n");
		sb.append("		VALUES(             \n");
		sb.append(" 		?				\n");//KNO
		sb.append(" 		,?				\n");//KSUBJECT
		sb.append(" 		,?				\n");//KNAME
		sb.append(" 		,?				\n");//KPW
		sb.append(" 		,?				\n");//KMEMO
		sb.append(" 		,'Y'			\n");//KDELETEYN
		sb.append(" 		,SYSDATE		\n");//KINSERTDATE
		sb.append(" 		,SYSDATE	)	\n");//KUPDATEDATE
		return sb.toString();
	}
	
	//게시물 제목, 게시물 내용만 수정가능. (KSUBJECT, KMEMO)
	public static String getUpdatetQuery() {
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE 	KOSBOARD SET 	 	\n");
		sb.append(" KSUBJECT = ? 				\n");
		sb.append(" ,KMEMO = ? 			 		\n");
		sb.append(" ,KUPDATEDATE = SYSDATE 	 	\n");
		sb.append("	WHERE KNO = ?			 	\n");
		return sb.toString();
	}
	
	public static String getDeleteQuery() {
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE 	KOSBOARD SET 	\n");
		sb.append(" KDELETEYN = 'N' 		\n");
		sb.append(" ,KUPDATEDATE = SYSDATE 	\n");
		sb.append("	WHERE KNO = ?			\n");
		return sb.toString();
	}
	
	//페이징 처리를 위한 쿼리문
	public static String getListQuery() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT KNO, KSUBJECT, KNAME, KMEMO, TO_CHAR(KINSERTDATE,'YYYY/MM/DD') FROM( \n");
		sb.append("SELECT ROW_NUMBER() OVER(ORDER BY KNO DESC) KNUM, A.* \n");
		sb.append("FROM KOSBOARD A 	)								\n");
		sb.append("WHERE KNUM BETWEEN ? AND ? 						\n");
		return sb.toString();
	}

}
