package kmem.dao;

import java.util.ArrayList;

import kmem.vo.KosmoMemberVO;

public interface KosmoMemberDAO {
	
	ArrayList<KosmoMemberVO> memSelectAll();
	ArrayList<KosmoMemberVO> memSelect(KosmoMemberVO _kmvo);
	boolean memInesert(KosmoMemberVO _kmvo);
	boolean memUpdate(KosmoMemberVO _kmvo);
	boolean memDelete(KosmoMemberVO _kmvo);
	boolean idCheck(KosmoMemberVO _kmvo); //아이디 중복체크를 위해 중복아이디 존재 여부 검사
	
}
