package mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	private String toEmailAddr;
	private String userId;
	private String userPw;
	
	//���� �̸���
	public void setToEmailAddr(String email) {
		this.toEmailAddr = email;
	}
	
	//���� ���̵�
	public void setUserId(String id) {
		this.userId = id;
	}
	
	//���� pw
		public void setUserPw(String pw) {
			this.userPw = pw;
		}
	
	//���� ������
	public void sendMail() {
		Properties prop = System.getProperties();
		/*
		 * Properties prop = System.getProperties();
		 * Properties Ŭ������ �ý��� �Ӽ��� ��ü�� �����ϴ� Ŭ����
		 * Hashtable�� ��ӹ޴� Ŭ������ �Ӽ��� ���� 1:1�� �����
		 * */
		
		// Mail ó��ȯ��
		prop.put("mail.smtp.starttls.enable","true");
		// �α��ν� TLS�� ����� ������ ����
		prop.put("mail.smtp.host","smtp.gmail.com");
		// �̸��� ����� ó������ SMTP����
		prop.put("mail.smtp.auth","true");
		// SMTP ������ ������ ����Ѵٴ� �ǹ�
		prop.put("mail.smtp.port","587");
		// TLS�� ��Ʈ��ȣ�� 587�̸� SSL�� ��Ʈ��ȣ�� 465�̴�.
		
		Authenticator auth = new MailAuth();
		Session session = Session.getDefaultInstance(prop, auth);
		/*
		 * MailAuth.java���� Authenticator�� ��ӹ޾� ������ 
		 * MailAuth Ŭ������ �޾� ������ �����Ѵ�.
		 * getDefaultInstance�� ù��° �Ķ���ʹ� 27~33Line���� ������ ��
		 * */

		// MimeMessage�� Message(�߻�)Ŭ������ ��ӹ��� ���ͳ� ������ ���� Ŭ����
		// 38Line ������ ������ ��� msg��ü�� �����Ѵ�.
		MimeMessage msg = new MimeMessage(session);
		
		
		try {
			// ������ ��¥ ����
			msg.setSentDate(new Date());	
			
			// ������
			msg.setFrom(new InternetAddress(((MailAuth) auth).getMail_id(), "mailTest"));	
			// Message Ŭ������ setFrom()�޼ҵ带 ����Ͽ� �߼��ڸ� �����Ѵ�.
			// �߼����� ����,�߼����� InternetAddress Ŭ������ �̸��� �ּҸ� ��Ÿ�� �� ����ϴ� Ŭ����

			// �������� ������ ����
			// �޴��� ������ ���� google,naver,daum
			
			System.out.println("������ >> " + toEmailAddr);
			InternetAddress to = new InternetAddress(toEmailAddr);	

			
			msg.setRecipient(Message.RecipientType.TO, to);
			/* 
			 * Message Ŭ������ setRecipient()�޼ҵ带 ����Ͽ� �����ڸ� ����
			 * setRecipient() �޼ҵ�� ������, ����, ���� ���� ������ �����ϴ�.
			 * Message.RecipientType.TO : �޴»��
			 * Message.RecipientType.CC : ����
			 * Message.RecipientType.BCC : ���� ����
			 * */

            // ������ ���� ���� , encoding Ÿ�� ����
			String title = "�ӽ� ��й�ȣ �߱�"; //���� ����
            msg.setSubject(title, "UTF-8");	            

            // ������ ���� �Է�, encoding Ÿ�� ����
            StringBuffer sb = new StringBuffer();
            sb.append(userId);
            sb.append("���� �ӽ� ��й�ȣ�� �����帳�ϴ�.\n");
            sb.append(userId +"���� �ӽ� ��й�ȣ >> " +userPw + "�Դϴ�.");
            String text = sb.toString();
            msg.setText(text, "UTF-8");
            

            // Transprot�� ������ ���������� ������ Ŭ������ ������ ������ �κ��̴�.            
            Transport.send(msg);

	        } catch(AddressException ae) {  
	            System.out.println("AddressException : " + ae.getMessage());           
	        } catch(MessagingException me) {
	        	// ���� �������� ���� ����ó��
	            System.out.println("MessagingException : " + me.getMessage());
	        } catch(UnsupportedEncodingException e) {
	        	// �������� ���� ���ڵ��� ����� ��� ���� ó��
	            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
	        }           
	    
	}
	}

