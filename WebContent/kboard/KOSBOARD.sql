CREATE TABLE KOSBOARD(
 	KNO 		VARCHAR2(20) PRIMARY KEY
   ,KSUBJECT 	VARCHAR2(100) NOT NULL -- 수정가능 (게시물 제목)
   ,KNAME    	VARCHAR2(100) NOT NULL
   ,KPW		 	VARCHAR2(20)
   ,KMEMO    	VARCHAR2(2000)  -- 수정가능 (게시물 내용)
   ,KDELETEYN 	VARCHAR2(1)
   ,KINSERTDATE DATE
   ,KUPDATEDATE DATE
); 
