package petopia.com.kh.jsp.user.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.user.model.service.UserService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class RegisterUserController
 */
@WebServlet("/register.prossess")
public class RegisterUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email").trim();
		String nickname = request.getParameter("nickname").trim();
		String pw = request.getParameter("pw").trim();
		String phone = request.getParameter("phone").trim();
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(pw.getBytes());
			
			byte[] bytes = md.digest();
			StringBuilder builder = new StringBuilder();
			for(int i=0;i<bytes.length;i++) {
				builder.append(String.format("%02X", bytes[i]));
			}
			pw = builder.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		User user = new User();
		user.setUserMethod(0);
		user.setUserEmail(email);
		user.setUserNickname(nickname);
		user.setUserPass(pw);
		user.setUserPhone(phone);
		
		int result = new UserService().insertUser(user);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/login");
		} else {
			response.sendRedirect(request.getContextPath()+"/register");
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
