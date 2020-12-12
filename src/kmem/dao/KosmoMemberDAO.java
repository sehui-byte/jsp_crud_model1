package kmem.dao;

import java.util.ArrayList;

import kmem.vo.KosmoMemberVO;

public interface KosmoMemberDAO {
	
	ArrayList<KosmoMemberVO> memSelectAll();
	ArrayList<KosmoMemberVO> memSelect(KosmoMemberVO _kmvo);
	boolean memInesert(KosmoMemberVO _kmvo);
	boolean memUpdate(KosmoMemberVO _kmvo);
	boolean memDelete(KosmoMemberVO _kmvo);
	boolean idCheck(KosmoMemberVO _kmvo); //���̵� �ߺ�üũ�� ���� �ߺ����̵� ���� ���� �˻�
	
}
