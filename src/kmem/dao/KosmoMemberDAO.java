package kmem.dao;

import java.util.ArrayList;

import kmem.vo.KosmoMemberVO;

public interface KosmoMemberDAO {
	
	ArrayList<KosmoMemberVO> memSelectAll();
	ArrayList<KosmoMemberVO> memSelect(KosmoMemberVO _kmvo);
	boolean memInesert(KosmoMemberVO _kmvo);
	boolean memUpdate(KosmoMemberVO _kmvo);
	boolean memDelete(KosmoMemberVO _kmvo);
	boolean idCheck(KosmoMemberVO _kmvo); //아이디 중복체크
	boolean loginCheck(KosmoMemberVO _kmvo);//로그인시 아이디, 비번 체크
}
