package petopia.com.kh.jsp.user.controller;

import java.io.FileInputStream;
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

/**
 * Servlet implementation class FindPwdEmailController
 */
@WebServlet("/findPasswordEmail")
public class AjaxFindPwdEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFindPwdEmailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String toEmail = request.getParameter("email");
		String subject = "[Petopia] 비밀번호 변경 링크";
		String fromEmail = "leemj9987@gmail.com";
		String password = "ekbc gagq amwi gquu";
		String fromUsername = "펫토피아";
		boolean success = false;
		
		String filePath = AjaxFindPwdEmailController.class.getResource("/sql/properties/email.properties").getPath();
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
			
			StringBuffer sb = new StringBuffer();
			sb.append("<h3>[Petopia] 비밀번호 변경 링크</h3>");
			sb.append("<h4>다음 링크를 통해 비밀번호를 변경해 주십시오.</h4>");
			sb.append("<h3>링크 : <a href='#'>link</a></h3>");
			sb.append("<h4>비밀번호 재설정을 요청하지 않았다면 이 이메일을 무시하셔도 됩니다.</h4>");
			sb.append("<h4>감사합니다.</h4>");
			String mailContent = sb.toString();
			mTextPart.setText(mailContent,"UTF-8","html");
			mParts.addBodyPart(mTextPart);
			message.setContent(mParts);
			Transport transport = session.getTransport(prop.getProperty("mail.transport.protocol"));
			transport.connect(fromEmail, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			System.out.println("비밀번호 재설정 링크 메일 전송 성공");
			
			success = true;
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
			response.setStatus(500);
			response.getWriter().print(e.getMessage());
		}
		
		response.getWriter().print(success);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
