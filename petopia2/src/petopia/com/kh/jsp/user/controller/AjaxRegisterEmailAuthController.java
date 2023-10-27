package petopia.com.kh.jsp.user.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.user.model.service.UserServiceImpl;

/**
 * Servlet implementation class RegisterEmailAuthController
 */
@WebServlet("/requestAuthEmail")
public class AjaxRegisterEmailAuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRegisterEmailAuthController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String toEmail = request.getParameter("email");
		String subject = "[Petopia] 회원 가입 이메일 인증번호";
		String fromEmail = "leemj9987@gmail.com";
		String password = "ekbc gagq amwi gquu";
		String fromUsername = "펫토피아";
		
		String filePath = AjaxRegisterEmailAuthController.class.getResource("/sql/properties/email.properties").getPath();
		Properties prop = new Properties();
		prop.load(new FileInputStream(filePath));
		
		Session session = Session.getDefaultInstance(prop);
		Message message = new MimeMessage(session);
		response.setContentType("text/html; charset=UTF-8");
		try {
			message.setFrom(new InternetAddress(fromEmail, fromUsername));
			message.addRecipient(RecipientType.TO, new InternetAddress(toEmail));
			message.setSubject(subject);
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();
			
			String cNumber = "";
			for(int i=0 ; i< 6 ; i++) {
				int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어
				if(sel1 == 0) {
					int num = (int)(Math.random() * 10); // 0~9
					cNumber += num;
				}else {
					char ch = (char)(Math.random() * 26 + 65); // A~Z
					int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자
					if(sel2 == 0) {
						ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
					}
					cNumber += ch;
				}
			}
			StringBuffer sb = new StringBuffer();
			sb.append("<h3>[Petopia] 회원 가입 인증 번호입니다.</h3>\n");
			sb.append("<h4>아래의 인증번호를 입력해 주십시오.</h4>\n");
			sb.append("<h3>인증 번호 : <span style='color:red'>"+ cNumber +"</span></h3>\n");
			sb.append("<h4>감사합니다.</h4>\n");
			String mailContent = sb.toString();
			mTextPart.setText(mailContent,"UTF-8","html");
			mParts.addBodyPart(mTextPart);
			message.setContent(mParts);
			Transport transport = session.getTransport(prop.getProperty("mail.transport.protocol"));
			transport.connect(fromEmail, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			System.out.println("이메일 인증 메일 전송 성공");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("emailAuthEmail", toEmail);
			map.put("emailAuthCode", cNumber);
			int result = new UserServiceImpl().insertEmailAuth(map);
			
			response.getWriter().print(result);
			
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
			response.setStatus(500);
			response.getWriter().print(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
