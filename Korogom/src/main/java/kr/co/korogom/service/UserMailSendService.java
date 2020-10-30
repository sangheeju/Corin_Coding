package kr.co.korogom.service;

import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

//import kr.co.korogom.domain.MemberDAO;
import kr.co.korogom.mapper.MemberMapper;
import lombok.AllArgsConstructor;


@Service
public class UserMailSendService {
//	
//	@Inject
//	private MemberDAO memberDAO;
////	
//	@Autowired
//	private JavaMailSender mailSender;
//	
//	@Autowired
//	private SqlSessionTemplate sqlSession;
//	
//	@Autowired
//	private MemberMapper memberMapper;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String GetKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
//	// 인증키 Y로 변경
//	public int alter_mKey(String mid, String mkey) {
//		// TODO Auto-generated method stub
//		return memberMapper.alter_mKey(mid, mkey);
//	}

	// 회원가입 발송 이메일(인증키 발송)
//	public void mailSendWithUserKey(String e_mail, String mid, HttpServletRequest request)throws Exception {
//		
//		String mkey = GetKey(false, 20);
//		memberMapper = sqlSession.getMapper(MemberMapper.class);
//		memberMapper.GetKey(mid, mkey); 
//		MimeMessage mail = mailSender.createMimeMessage();
//		String htmlStr = "<h2>안녕하세요 KOROGOM입니다!</h2><br><br>" 
//				+ "<h3>" + mid + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
//				+ "<a href='http://localhost:8080" + request.getContextPath() + "/member/key_alter?mid="+ mid +"mkey="+mkey+"'>인증하기</a></p>"
//				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
//		
//			mail.setSubject("[본인인증] KOROGOM의 인증메일입니다", "utf-8");
//			mail.setText(htmlStr, "utf-8", "html");
//			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
//			mailSender.send(mail);
//		
		// 아마존 주소 : http://54.180.117.142/MS/user/key_alter?user_id=
		
//	}
		
//	public int alter_userKey_service(String mid, String mkey) {
//			
//			int resultCnt = 0;
//			
//			memberMapper = sqlSession.getMapper(MemberMapper.class);
//			resultCnt = memberMapper.alter_mKey(mid, mkey);
//			
//			return resultCnt;
//		}


}
