package kboard.dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kboard.vo.KosBoardVO;
import kmem.common.Chaebun;
import kmem.common.JspConnProp;
import kboard.sql.KosBoardSqlMap;

public class KosBoardDAOImpl implements KosBoardDAO {

	@Override
	public ArrayList<KosBoardVO> boardSelectAll() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<KosBoardVO> aList = null;
		
		conn = JspConnProp.getConnection();
		try {
			pstmt = conn.prepareStatement(KosBoardSqlMap.getSelectAllQuery());
			System.out.println("select all query >> " + KosBoardSqlMap.getSelectAllQuery());
			rs = pstmt.executeQuery();
			
			
			if(rs != null) {//null 체크
				aList = new ArrayList<KosBoardVO>();
				
				while(rs.next()) {
					KosBoardVO kbvo = new KosBoardVO();
					//KNO ,KSUBJECT ,KNAME ,KPW	, KMEMO 	 	
					//KDELETEYN  ,KINSERTDATE ,KUPDATEDATE
					kbvo.setKno(rs.getString(1));
					kbvo.setKsubject(rs.getString(2));
					kbvo.setKname(rs.getString(3));
					kbvo.setKpw(rs.getString(4));
					kbvo.setKmemo(rs.getString(5));
					kbvo.setKdeleteyn(rs.getString(6));
					kbvo.setKinsertdate(rs.getString(7));
					kbvo.setKupdatedate(rs.getString(8));
					
					aList.add(kbvo);
				}
			}
			
			else {
				System.out.println("ResultSet >> null !");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return aList;
	}

	@Override
	public ArrayList<KosBoardVO> boardSelect(KosBoardVO _kbvo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<KosBoardVO> aList = null;
		
		conn = JspConnProp.getConnection();
		try {
			pstmt = conn.prepareStatement(KosBoardSqlMap.getSelectQuery());
			pstmt.setString(1, _kbvo.getKno());
			System.out.println("select all query >> " + KosBoardSqlMap.getSelectQuery());
			rs = pstmt.executeQuery();
			
			
			if(rs != null) {//null 체크
				aList = new ArrayList<KosBoardVO>();
				
				while(rs.next()) {
					KosBoardVO kbvo = new KosBoardVO();
					//KNO ,KSUBJECT ,KNAME ,KPW	, KMEMO 	 	
					//KDELETEYN  ,KINSERTDATE ,KUPDATEDATE
					kbvo.setKno(rs.getString(1));
					kbvo.setKsubject(rs.getString(2));
					kbvo.setKname(rs.getString(3));
					kbvo.setKpw(rs.getString(4));
					kbvo.setKmemo(rs.getString(5));
					kbvo.setKdeleteyn(rs.getString(6));
					kbvo.setKinsertdate(rs.getString(7));
					kbvo.setKupdatedate(rs.getString(8));
					
					aList.add(kbvo);
				}
			}
			
			else {
				System.out.println("ResultSet >> null !");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return aList;
	}

	@Override
	public boolean boardInesert(KosBoardVO _kbvo) {
		System.out.println("boardInesert >> " + KosBoardSqlMap.getInsertQuery());
		Connection conn = null;
		PreparedStatement pstmt = null;
		int nCnt = 0;
		
		conn = JspConnProp.getConnection();
		
		
		try {
			pstmt = conn.prepareStatement(KosBoardSqlMap.getInsertQuery());
			pstmt.clearParameters();
			pstmt.setString(1, Chaebun.getKnoChaebun());
			pstmt.setString(2, _kbvo.getKsubject());
			pstmt.setString(3, _kbvo.getKname());
			pstmt.setString(4, _kbvo.getKpw());
			pstmt.setString(5, _kbvo.getKmemo());
			
			nCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("디비 연동에 에러 : KosBoardDAOImpl >>> : " + e.getMessage());
		}
		if(nCnt > 0)
			return true;
		return false;
	}

	@Override
	public boolean boardUpdate(KosBoardVO _kbvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean boardDelete(KosBoardVO _kbvo) {
		// TODO Auto-generated method stub
		return false;
	}
	

	@Override
	public ArrayList<KosBoardVO> PageListSelect(int startRow, int endRow){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<KosBoardVO> aList = null;
		conn = JspConnProp.getConnection();
		
		try {
			pstmt = conn.prepareStatement(KosBoardSqlMap.getListQuery());
			System.out.println("쿼리문 >> ");
			System.out.println(KosBoardSqlMap.getListQuery());
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			if(rs != null){
				aList = new ArrayList<KosBoardVO>();
				
				while(rs.next()) {
					KosBoardVO kbvo = new KosBoardVO();
					// KNO, KSUBJECT, KNAME, KMEMO, KINSERTDATE
					kbvo.setKno(rs.getString(1));//kno
					kbvo.setKsubject(rs.getString(2));
					kbvo.setKname(rs.getString(3));
					kbvo.setKmemo(rs.getString(4));
					kbvo.setKinsertdate(rs.getString(5));
					aList.add(kbvo);
				}
				
			}
		
		} catch (SQLException e) {
			System.out.println("디비연동 에러 : PageListSelect >> " + e.getMessage());
		}
		
		return aList;
	}
	
	@Override
	public int boardTotalCount() {
		//총 kboard레코드 수 반환
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(KNO) FROM KOSBOARD";
		conn = JspConnProp.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("디비연동 에러 : boardTotalCount >> " + e.getMessage());
		}
		
		return count;
	}

}
