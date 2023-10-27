package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.user.model.service.UserServiceImpl;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class UserDeleteController
 */
@WebServlet("/mypage.userDelete")
public class UserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userInfo = ((User)request.getSession().getAttribute("userInfo"));
		int userNo = userInfo!=null ? userInfo.getUserNo() : 0;
		int userMethod = userInfo!=null ? userInfo.getUserMethod() : 0;
		
		//int result = new UserService().deleteUser(userNo);
		int result = 0;
		if(userMethod == 0) {
			result = new UserServiceImpl().deleteUser(userNo);
		} else {
			result = new UserServiceImpl().deleteOAuthUser(userNo);
		}
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/logout");
		} else {
			request.setAttribute("errorMsg", "회원 탈퇴 실패");
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
