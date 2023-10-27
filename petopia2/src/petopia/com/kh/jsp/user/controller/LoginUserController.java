package petopia.com.kh.jsp.user.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.user.model.service.UserServiceImpl;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class loginUserController
 */
@WebServlet("/login.prossess")
public class LoginUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email").trim();
		String pw = request.getParameter("pw").trim();
		String remember = request.getParameter("remember")!=null ? request.getParameter("remember") : "off";
		
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
		
		User u = new User();
		u.setUserEmail(email);
		u.setUserPass(pw);
		User user = new UserServiceImpl().loginUser(u);
		
		if(user == null) {
			request.setAttribute("fail", "fail");
			request.getRequestDispatcher("views/user/loginView.jsp").forward(request, response);
		} else {
			if(remember.equals("on")) {
				Cookie cookie = new Cookie("rememberEmail", email);
				cookie.setMaxAge(86400);
				response.addCookie(cookie);
			} else {
				Cookie[] cookies = request.getCookies();
				if(cookies != null) {
					for(int i=0;i<cookies.length;i++) {
						if(cookies[i].getName().equals("rememberEmail")) {
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
				}
			}
			
			ServletContext application = request.getSession().getServletContext();
			
			if(application.getAttribute("accessCount")==null) {
				application.setAttribute("accessCount", 0);
			}
			int ac = (Integer)application.getAttribute("accessCount");
			application.setAttribute("accessCount", ++ac);
			
			request.getSession().setAttribute("userInfo", user);
			response.sendRedirect(request.getContextPath());
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
