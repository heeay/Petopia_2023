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
 * Servlet implementation class ChangePasswordController
 */
@WebServlet("/changePassword.process")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String token = request.getParameter("token");
		int userNo = Integer.parseInt(request.getParameter("key"));
		String pw = request.getParameter("pw");
		
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
		
		boolean isThere = new UserService().selectEmailAuth(new UserService().checkUserNo(userNo), token);
		if(isThere) {
			User user = new User();
			user.setUserNo(userNo);
			user.setUserPass(pw);
			int result = new UserService().updateUserPw(user);
			
			if(result>0) {
				request.setAttribute("errorMsg", "비밀번호 변경이 완료되었습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			else {
				request.setAttribute("errorMsg", "비밀번호 변경을 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		else {
			request.setAttribute("errorMsg", "토큰이 변경되거나 만료되었습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
