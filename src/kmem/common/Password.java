package kmem.common;

import java.security.MessageDigest;

public class Password {

	public static String pwSHA(String Mpw) {
		String str="";
		MessageDigest md= null;
		try {
			md=MessageDigest.getInstance("SHA-256");
			md.update(Mpw.getBytes());
			byte byteData[]=md.digest();
			StringBuffer sb= new StringBuffer();
			for(int i=0;i<byteData.length;i++) {
				sb.append(Integer.toString((byteData[i]&0xff)+0x100,16).substring(1));
			}
			str=sb.toString();
			//System.out.println(sb.length());
		}catch(Exception e) {
			e.printStackTrace();
			str=null;
		}
		
		return str;
	}
}
