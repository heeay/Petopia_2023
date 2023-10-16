package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class AjaxSelectUser
 */
@WebServlet("/selectUser.in")
public class AjaxSelectUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		int infoNo = Integer.parseInt(request.getParameter("ino"));
		int userNo = 0;
		if((User)request.getSession().getAttribute("userInfo") != null) {
			userNo = ((User)request.getSession().getAttribute("userInfo")).getUserNo(); // 회원 번호
		}
		int result = 0;
		
		// 지금 로그인한 사용자가 게시글의 하트를 클릭했으면 1, 아니면 0 반환
		int countUser = new InfoService().selectUser(infoNo, userNo);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(countUser);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
