package petopia.com.kh.jsp.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.user.model.service.UserServiceImpl;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class AjaxCheckNicknameController
 */
@WebServlet("/nicknameCheck")
public class AjaxCheckNicknameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckNicknameController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String nickname = request.getParameter("nickname");
		
		User userInfo = ((User)request.getSession().getAttribute("userInfo"));
		int userNo = userInfo!=null ? userInfo.getUserNo() : 0;
		User user = new User();
		user.setUserNo(userNo);
		user.setUserNickname(nickname);
		
		int result = new UserServiceImpl().checkUserNickname(user);
		
		response.setContentType("text/html; charset=UTF-8");
		if(result>0) {
			response.getWriter().print("N");
		} else {
			response.getWriter().print("Y");
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
