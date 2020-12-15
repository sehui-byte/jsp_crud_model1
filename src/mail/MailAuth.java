package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	/* 
	 * ������ ������ ���� �߰��� mail-1.4.7 jar���� javax.mail ��Ű���� ����ִ�.
	 * javax.mail ��Ű���� �ֿ� Ŭ������ 
	 * Session, Message, Address, Authenticator, Transport ���� �ִ�. 
	 * SMTP ������ ������ ����� ������ �ϱ� ���ؼ� Authenticator Ŭ���� ����� �ʿ��ϴ�.
	 */
	PasswordAuthentication pa;
	private String mail_id ="";
	private String mail_pw ="";
	
	public MailAuth() {
		
		//�߽��� ���� �̸���, ��� �ֱ�
		mail_id = "";	// gmail ���̵�
		mail_pw = "";// gmail ��й�ȣ
		
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public String getMail_id() {
		return mail_id;
	}
	
	public PasswordAuthentication getPasswordAuthentication() {	
		return pa;
	/* 
	 * public PasswordAuthentication getPasswordAuthentication() {	
	 *		return pa;
	 * 
	 * Authenticator�� ����ϱ� ���ؼ��� PasswordAuthenticator Ŭ�����κ��� 
	 * �ν��Ͻ��� �����ϰ� getPasswordAuthentication �޼ҵ�� ���Ϲ޾ƾ� �Ѵ�.
	 * PasswordAuthentication Ŭ������ ������� 
	 * ���̵�� �н����带 �Է¹޾� ��ȯ�ϵ��� �������Ѵ�.
	 */
	}
}



