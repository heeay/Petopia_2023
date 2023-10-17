package petopia.com.kh.jsp.user.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.user.model.service.UserService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class KakaoLoginController
 */
@WebServlet("/kakaoLogin")
public class KakaoLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String profile = request.getParameter("profile");
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(id.getBytes());
			
			byte[] bytes = md.digest();
			StringBuilder builder = new StringBuilder();
			for(int i=0;i<bytes.length;i++) {
				builder.append(String.format("%02X", bytes[i]));
			}
			id = builder.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		User u = new User();
		u.setUserMethod(2);
		u.setUserEmail(email);
		u.setUserPass(id);
		u.setFileMypageNo(profile);
		System.out.println(profile);
		
		User user = new UserService().simpleKakaoAuth(u);
		
		if(user == null) {
			request.setAttribute("errorMsg", "간편 로그인 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
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
