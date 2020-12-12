package kboard.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public abstract class JspConnProp {
	public static final String ORCL_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String ORCL_USER = "ksh00";
	public static final String ORCL_PASS = "orcl00";
	public static final String ORCL_DRIVER = "oracle.jdbc.driver.OracleDriver";


	public static Connection getConnection() {
		Connection conn = null;
		try {

			Class.forName(JspConnProp.ORCL_DRIVER);
			conn = DriverManager.getConnection(JspConnProp.ORCL_URL,JspConnProp.ORCL_USER,JspConnProp.ORCL_PASS);
		} catch (Exception c) {
			System.out.println("드라이버 연결 실패" + c.getMessage());

		}
		return conn;
	}


	public static void connClose(Connection conn, PreparedStatement pstmt, ResultSet rsRs) {
		if (rsRs != null) {

			try {
				rsRs.close();
				rsRs = null;
			} catch (Exception e) {
				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
				pstmt = null;
			} catch (Exception e) {
				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}

		}

		if (conn != null) {
			try { 
				conn.close();
				conn = null;

			} catch (Exception e) {

				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}
		}
	}

	public static void connClose(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {
			try { 
				pstmt.close();
				pstmt = null;
			} catch (Exception e) {
				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}

		}

		if (conn != null) {
			try { 
				conn.close();
				conn = null;

			} catch (Exception e) {

				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}
		}
	}
}