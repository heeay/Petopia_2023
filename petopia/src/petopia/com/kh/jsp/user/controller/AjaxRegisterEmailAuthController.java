package petopia.com.kh.jsp.user.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

import org.apache.catalina.tribes.membership.McastService;

import petopia.com.kh.jsp.user.model.service.UserService;

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
		String fromEmail = "dlaudwns521@gmail.com";
		String password = "";
		String fromUsername = "관리자";
		
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587"); //465, 587
		props.put("mail.smtp.auth", "true");
		
		props.put("mail.smtp.quitwait", "false");
		props.put("mail.smtp.socketFactory.port", "587");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getDefaultInstance(props);
		Message message = new MimeMessage(session);
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
			sb.append("<h3>[Community 프로젝트] 회원 가입 인증 번호입니다.</h3>\n");
			sb.append("<h3>인증 번호 : <span style='color:red'>"+ cNumber +"</span></h3>\n");
			String mailContent = sb.toString();
			mTextPart.setText(mailContent,"UTF-8","html");
			mParts.addBodyPart(mTextPart);
			message.setContent(mParts);
			Transport t =session.getTransport("smtp");
			t.connect(fromEmail, password);
			t.sendMessage(message, message.getAllRecipients());
			t.close();
			
			int result = new UserService().insertEmailAuth(toEmail,cNumber);
			
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
