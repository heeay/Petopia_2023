package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class AjaxUpdateLike
 */
@WebServlet("/insertLike.in")
public class AjaxInsertLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertLike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int infoNo = Integer.parseInt(request.getParameter("ino")); // 게시글 번호
		int userNo = ((User)request.getSession().getAttribute("userInfo")).getUserNo(); // 회원 번호
		
		int result = new InfoService().insertLike(infoNo, userNo);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
