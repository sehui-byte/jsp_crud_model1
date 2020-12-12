package kmem.vo;

public class KosmoMemberVO {

	private String knum; 
	private String kname;
	private String kid;
	private String kpw;
	private String khp;
	private String kgender;
	private String khobby; 
	private String klocal;
	private String kmsg; 
	private String kdeleteyn; 
	private String kinsertdate;
	private String kupdatedate;

	public KosmoMemberVO() {}; //기본생성자

	public KosmoMemberVO(String kNUM, String kNAME, String kID, String kPW, String kHP, String kGENDER, String kHOBBY,
			String kLOCAL, String kMSG, String kDELETEYN, String kINSERTDATE, String kUPDATEDATE) {

		knum = kNUM;
		kname = kNAME;
		kid = kID;
		kpw = kPW;
		khp = kHP;
		kgender = kGENDER;
		khobby = kHOBBY;
		klocal = kLOCAL;
		kmsg = kMSG;
		kdeleteyn = kDELETEYN;
		kinsertdate = kINSERTDATE;
		kupdatedate = kUPDATEDATE;
	}

	public String getKnum() {
		return knum;
	}

	public void setKnum(String knum) {
		this.knum = knum;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public String getKid() {
		return kid;
	}

	public void setKid(String kid) {
		this.kid = kid;
	}

	public String getKpw() {
		return kpw;
	}

	public void setKpw(String kpw) {
		this.kpw = kpw;
	}

	public String getKhp() {
		return khp;
	}

	public void setKhp(String khp) {
		this.khp = khp;
	}

	public String getKgender() {
		return kgender;
	}

	public void setKgender(String kgender) {
		this.kgender = kgender;
	}

	public String getKhobby() {
		return khobby;
	}

	public void setKhobby(String khobby) {
		this.khobby = khobby;
	}

	public String getKlocal() {
		return klocal;
	}

	public void setKlocal(String klocal) {
		this.klocal = klocal;
	}

	public String getKmsg() {
		return kmsg;
	}

	public void setKmsg(String kmsg) {
		this.kmsg = kmsg;
	}

	public String getKdeleteyn() {
		return kdeleteyn;
	}

	public void setKdeleteyn(String kdeleteyn) {
		this.kdeleteyn = kdeleteyn;
	}

	public String getKinsertdate() {
		return kinsertdate;
	}

	public void setKinsertdate(String kinsertdate) {
		this.kinsertdate = kinsertdate;
	}

	public String getKupdatedate() {
		return kupdatedate;
	}

	public void setKupdatedate(String kupdatedate) {
		this.kupdatedate = kupdatedate;
	}
}
