package kmem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kmem.vo.KosmoMemberVO;
import kmem.common.JspConnProp;
import kmem.common.Chaebun;
import kmem.sql.KosmoMemberSqlMap;

public class KosmoMemberDAOImpl implements KosmoMemberDAO {

	@Override
	public ArrayList<KosmoMemberVO> memSelectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<KosmoMemberVO> aList = null;

		try {
			conn = JspConnProp.getConnection();
			pstmt = conn.prepareStatement(KosmoMemberSqlMap.getKmemSelectAllQuery());
			System.out.println("SELECT ALL>>> : \n" + KosmoMemberSqlMap.getKmemSelectAllQuery());
			rs = pstmt.executeQuery();

			if (rs !=null) {
				aList = new ArrayList<KosmoMemberVO>();

				while (rs.next()) {
					KosmoMemberVO kmvo = new KosmoMemberVO();
					//KNUM,KNAME,KID,KPW,KHP,KGENDER
					//KHOBBY,KLOCAL,KMSG
					//KDELETEYN,KINSERTDATE,KUPDATEDATE
					kmvo.setKnum(rs.getString(1));
					kmvo.setKname(rs.getString(2));
					kmvo.setKid(rs.getString(3));
					kmvo.setKpw(rs.getString(4));
					kmvo.setKhp(rs.getString(5));
					kmvo.setKgender(rs.getString(6));
					kmvo.setKhobby(rs.getString(7));
					kmvo.setKlocal(rs.getString(8));
					kmvo.setKmsg(rs.getString(9));
					kmvo.setKdeleteyn(rs.getString(10));
					kmvo.setKinsertdate(rs.getString(11));
					kmvo.setKupdatedate(rs.getString(12));

					aList.add(kmvo);
				}
			}
			JspConnProp.connClose(conn, pstmt, rs);
		}catch(SQLException s) {
			System.out.println("디비 연동에 에러 : KosmoMemberDAOImpl >>> : " + s);
		}finally {
			try {
				JspConnProp.connClose(conn, pstmt, rs);
			}catch(Exception e) {}
		}

		return aList;
	}

	@Override
	public ArrayList<KosmoMemberVO> memSelect(KosmoMemberVO _kmvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<KosmoMemberVO> aList = null;

		try {
			conn = JspConnProp.getConnection();
			pstmt = conn.prepareStatement(KosmoMemberSqlMap.getKmemSelectQuery());
			pstmt.setString(1, _kmvo.getKnum());
			System.out.println("SELECT >>> : \n" + KosmoMemberSqlMap.getKmemSelectQuery());
			rs = pstmt.executeQuery();

			if(rs != null) {
				aList = new ArrayList<KosmoMemberVO>();
				while(rs.next()) {
					//KNUM,KNAME,KID,KPW,KHP,KGENDER
					//KHOBBY,KLOCAL,KMSG
					//KDELETEYN,KINSERTDATE,KUPDATEDATE
					KosmoMemberVO kmvo = new KosmoMemberVO();
					kmvo.setKnum(rs.getString("KNUM"));
					kmvo.setKname(rs.getString("KNAME"));
					kmvo.setKid(rs.getString("KID"));
					kmvo.setKpw(rs.getString("KPW"));
					kmvo.setKhp(rs.getString("KHP"));
					kmvo.setKgender(rs.getString("KGENDER"));
					kmvo.setKhobby(rs.getString("KHOBBY"));
					kmvo.setKlocal(rs.getString("KLOCAL"));
					kmvo.setKmsg(rs.getString("KMSG"));
					kmvo.setKdeleteyn(rs.getString("KDELETEYN"));
					kmvo.setKinsertdate(rs.getString("KINSERTDATE"));
					kmvo.setKupdatedate(rs.getString("KUPDATEDATE"));

					aList.add(kmvo);
				}
			}

		}catch(Exception e) {
			System.out.println("디비 연동에 에러 : KosmoMemberDAOImpl >>> : " + e.getMessage());
		}finally {
			try {
				JspConnProp.connClose(conn, pstmt, rs);
			}catch(Exception e) {}
		}
		return aList;
	}

	@Override
	public boolean memInesert(KosmoMemberVO _kmvo) {
		System.out.println("memInsert(KosmoMemberVO kmvo)");
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;

		conn = JspConnProp.getConnection();

		try {
			pstm = conn.prepareStatement(KosmoMemberSqlMap.getKmemInsertQuery());

			//knum의 경우 : 채번 사용.
			//knum, kname, kid, kpw, khp, 
			//kgender, khobby, klocal, kmsg
			pstm.clearParameters();//이전 파라미터 값들 지워준다
			pstm.setString(1, Chaebun.getKnumChaebun());//채번값 받아옴
			pstm.setString(2, _kmvo.getKname());
			pstm.setString(3, _kmvo.getKid());
			pstm.setString(4, _kmvo.getKpw());
			pstm.setString(5, _kmvo.getKhp());
			pstm.setString(6, _kmvo.getKgender());
			pstm.setString(7, _kmvo.getKhobby());
			pstm.setString(8, _kmvo.getKlocal());
			pstm.setString(9, _kmvo.getKmsg());

			nCnt = pstm.executeUpdate();

		} catch (SQLException e) {
			System.out.println("디비 연동에 에러 : KosmoMemberDAOImpl >>> : " + e.getMessage());
		}finally {
			JspConnProp.connClose(conn, pstm);
		}

		if(nCnt > 0)
			return true;
		return false;
	}

	@Override
	public boolean memUpdate(KosmoMemberVO _kmvo) {
		System.out.println("memUpdate(KosmoMemberVO kmvo)");
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;

		conn = JspConnProp.getConnection();

		try {
			pstm = conn.prepareStatement(KosmoMemberSqlMap.getKmemUpdateQuery());

			//KMSG, KHOBBY, KLOCAL
			//KNUM
			pstm.clearParameters();
			pstm.setString(1, _kmvo.getKmsg());
			pstm.setString(2, _kmvo.getKhobby());
			pstm.setString(3, _kmvo.getKlocal());
			pstm.setString(4, _kmvo.getKnum());

			nCnt = pstm.executeUpdate();

		} catch (SQLException e) {
			System.out.println("디비 연동에 에러 : KosmoMemberDAOImpl >>> : " + e.getMessage());
		}finally {
			JspConnProp.connClose(conn, pstm);
		}

		if(nCnt > 0)
			return true;
		return false;
	}

	@Override
	public boolean memDelete(KosmoMemberVO _kmvo) {
		System.out.println("memDelete(KosmoMemberVO kmvo)");
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;

		conn = JspConnProp.getConnection();

		try {
			pstm = conn.prepareStatement(KosmoMemberSqlMap.getKmemDeleteQuery());
			pstm.clearParameters();
			pstm.setString(1, _kmvo.getKnum());//KNUM
			nCnt = pstm.executeUpdate();

		} catch (SQLException e) {
			System.out.println("디비 연동에 에러 : KosmoMemberDAOImpl >>> : " + e.getMessage());
		}finally {
			JspConnProp.connClose(conn, pstm);
		}

		if(nCnt > 0)
			return true;
		return false;
	}

	@Override
	public boolean idCheck(KosmoMemberVO _kmvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isIdDuplicated = false;//중복아이디 존재 여부

		try {
			conn = JspConnProp.getConnection();
			pstmt = conn.prepareStatement(KosmoMemberSqlMap.getKmemCheckIdQuery());
			pstmt.setString(1, _kmvo.getKid());
			System.out.println("idCheck >>> : \n" + KosmoMemberSqlMap.getKmemCheckIdQuery());
			rs = pstmt.executeQuery();

			//아이디가 존재하면
			while(rs.next()) {
				System.out.println("rs.getString(1) >>" + rs.getString(1));
				if(rs.getString(1) != null)
					isIdDuplicated = true;
			}
			
			JspConnProp.connClose(conn, pstmt, rs);
		}catch(SQLException s) {
			System.out.println("디비 연동에 에러 : KosmoMemberDAOImpl >>> : " + s);
		}finally {
			try {
				JspConnProp.connClose(conn, pstmt, rs);
			}catch(Exception e) {}
		}

		return isIdDuplicated;
	}
}
