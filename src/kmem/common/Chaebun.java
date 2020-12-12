package kmem.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Chaebun {

	//KosMember���̺��� KNUM ä�� ���ϱ� ���� (M0001)
	public static String kosmemberKnumChaebun() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT										\n");
		sb.append("		'M' || 									\n");
		sb.append("		LPAD(NVL(MAX(SUBSTR(KNUM,2)),0) + 1,4,'0')	KNUM\n");
		sb.append("FROM KOSMEMBER								\n");

		return sb.toString();
	}

	//DB�����Ͽ� ���� ä�� ��ȯ 
	public static String getKnumChaebun() {
		//�ʱ�ȭ
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		String knumChaebun = "";

		try {
			conn = JspConnProp.getConnection();
			pstmt = conn.prepareStatement(kosmemberKnumChaebun());
			rsRs = pstmt.executeQuery();

			if (rsRs !=null) {
				while (rsRs.next()) {
					knumChaebun = rsRs.getString(1);
				}
			}

			JspConnProp.connClose(conn, pstmt, rsRs);
		}catch(SQLException s) {
			System.out.println("��� ������ ������ : getKnumChaebun >>> : " + s);
		}finally {
			try {
				JspConnProp.connClose(conn, pstmt, rsRs);
			}catch(Exception e) {}
		}

		return knumChaebun;
	}
	
	///////////////KOSBOARDä��///////////////////////////////////

	//KOSBOARD���̺��� kno ä�� ���ϱ� : YYYYMMDD0001
	public static String kboardKnoChaebun() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT												\n");
		sb.append("		TO_CHAR(SYSDATE,'YYYYMMDD') || 										\n");
		sb.append("		LPAD(NVL(MAX(SUBSTR(KNO,-4)),0) + 1,4,'0')	KNO	\n");
		sb.append("FROM KOSBOARD								\n");

		return sb.toString();
	}

	//DB�����Ͽ� ���� KNO ä�� ��ȯ 
	public static String getKnoChaebun() {
		//�ʱ�ȭ
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		String knoChaebun = "";

		try {
			conn = JspConnProp.getConnection();
			pstmt = conn.prepareStatement(kboardKnoChaebun());
			rsRs = pstmt.executeQuery();

			if (rsRs !=null) {
				while (rsRs.next()) {
					knoChaebun = rsRs.getString(1);
				}
			}

			JspConnProp.connClose(conn, pstmt, rsRs);
		}catch(SQLException s) {
			System.out.println("��� ������ ������ : getKnoChaebun >>> : " + s);
		}finally {
			try {
				JspConnProp.connClose(conn, pstmt, rsRs);
			}catch(Exception e) {}
		}

		return knoChaebun;
	}

}
