package mail;

public class TempPw {
	
	public static String makeTmpPw(){

		int index = 0;
		char[] charArr;
		int tmpPwLength = 10;//임시비밀번호 길이

		charArr = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
				'y', 'z' };

		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < tmpPwLength; i++) {

			index = (int) (charArr.length * Math.random());//0~charArr.length-1까지의 난수 발생
			sb.append(charArr[index]);//랜덤한 값 들어감
		}

		return sb.toString();
	}
}
