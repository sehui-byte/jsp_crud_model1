package kmem.sql;

public class KosmoMemberSqlMap {
	
	public static String getKmemSelectAllQuery() {
		StringBuffer sb = new StringBuffer();
		sb.append("  SELECT					\n");
		sb.append(" 	   KNUM  			\n");
		sb.append(" 	  ,KNAME  			\n");
		sb.append(" 	  ,KID  			\n");
		sb.append(" 	  ,KPW  			\n");
		sb.append(" 	  ,KHP  			\n");
		sb.append(" 	  ,KGENDER  		\n");
		sb.append(" 	  ,KHOBBY  			\n");
		sb.append(" 	  ,KLOCAL  			\n");
		sb.append(" 	  ,KMSG  			\n");
		sb.append(" 	  ,KDELETEYN  		\n");
		sb.append(" 	  ,TO_CHAR(KINSERTDATE, 'YYYY-MM-DD') KINSERTDATE  	\n");
		sb.append(" 	  ,TO_CHAR(KUPDATEDATE, 'YYYY-MM-DD') KUPDATEDATE  	\n");
		sb.append("  FROM					\n");
		sb.append("  		KOSMEMBER  		\n");
		sb.append("  WHERE	KDELETEYN = 'Y'	\n");
		sb.append("  ORDER BY 1	   			\n");
		
		return sb.toString();
	}
	
	public static String getKmemSelectQuery() {
		
		StringBuffer sb = new StringBuffer();
		sb.append("  SELECT					\n");
		sb.append(" 	   KNUM  			\n");
		sb.append(" 	  ,KNAME  			\n");
		sb.append(" 	  ,KID  			\n");
		sb.append(" 	  ,KPW  			\n");
		sb.append(" 	  ,KHP  			\n");
		sb.append(" 	  ,KGENDER  		\n");
		sb.append(" 	  ,KHOBBY  			\n");
		sb.append(" 	  ,KLOCAL  			\n");
		sb.append(" 	  ,KMSG  			\n");
		sb.append(" 	  ,KDELETEYN  		\n");
		sb.append(" 	  ,TO_CHAR(KINSERTDATE, 'YYYY-MM-DD') KINSERTDATE  	\n");
		sb.append(" 	  ,TO_CHAR(KUPDATEDATE, 'YYYY-MM-DD') KUPDATEDATE  	\n");
		sb.append("  FROM					\n");
		sb.append("  		KOSMEMBER  		\n");
		sb.append("  WHERE	KDELETEYN = 'Y'	\n");
		sb.append("  AND	KNUM = ?		\n");
		
		return sb.toString();
	}
	
	public static String getKmemInsertQuery() {
		
		StringBuffer sb = new StringBuffer();
		sb.append(" INSERT INTO  		\n");
		sb.append(" 	KOSMEMBER  		\n");
		sb.append(" 	(  				\n");
		sb.append(" 	   KNUM  		\n");
		sb.append(" 	  ,KNAME  		\n");
		sb.append(" 	  ,KID  		\n");
		sb.append(" 	  ,KPW  		\n");
		sb.append(" 	  ,KHP  		\n");
		sb.append(" 	  ,KGENDER  	\n");
		sb.append(" 	  ,KHOBBY  		\n");
		sb.append(" 	  ,KLOCAL  		\n");
		sb.append(" 	  ,KMSG  		\n");
		sb.append(" 	  ,KDELETEYN  	\n");
		sb.append(" 	  ,KINSERTDATE  	\n");
		sb.append(" 	  ,KUPDATEDATE  	\n");
		sb.append(" 	 )  			\n");
		sb.append("    VALUES  			\n");
		sb.append("    (  				\n");
		sb.append(" 	   ?  			\n");//KNUM
		sb.append(" 	   ,?  			\n");//KNAME
		sb.append(" 	   ,?  			\n");//KID
		sb.append(" 	   ,?  			\n");//KPW
		sb.append(" 	   ,?  			\n");//KHP
		sb.append(" 	   ,?  			\n");//KGENDER
		sb.append(" 	   ,?  			\n");//KHOBBY
		sb.append(" 	   ,?  			\n");//KLOCAL
		sb.append(" 	   ,?  			\n");//KMSG
		sb.append(" 	  ,'Y'  		\n");
		sb.append(" 	  ,SYSDATE  	\n");
		sb.append(" 	  ,SYSDATE  	\n");
		sb.append(" 	)  				\n");		
		
		return sb.toString();
	}
	
	//수정가능 : 취미, 지역, 소개글 
	// + updatedate
	public static String getKmemUpdateQuery() {
		
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE 	KOSMEMBER 				\n");
		sb.append("SET KMSG = ? , KHOBBY = ?, KLOCAL = ? \n");
		sb.append("		,KUPDATEDATE = SYSDATE 			\n");
		sb.append("	WHERE KNUM = ? 						\n");
		sb.append("	AND KDELETEYN = 'Y' 					\n");
		
		return sb.toString();
	}
	
	public static String getKmemDeleteQuery() {
		
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE 	KOSMEMBER SET 	 \n");
		sb.append(" KDELETEYN = 'N' 			 \n");
		sb.append(" ,KUPDATEDATE = SYSDATE 	 \n");
		sb.append("	WHERE KNUM = ?			 \n");
		
		return sb.toString();
	}
	
	//아이디 찾는 select문 (아이디중복체크)
	public static String getKmemCheckIdQuery() {
		StringBuffer sb = new StringBuffer();
		sb.append(" SELECT * 		\n");
		sb.append("	FROM KOSMEMBER 	\n");
		sb.append(" WHERE KID = ? 	\n");
		
		return sb.toString();
	}
}
