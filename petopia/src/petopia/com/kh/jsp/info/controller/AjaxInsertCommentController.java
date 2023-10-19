package petopia.com.kh.jsp.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.info.model.vo.InfoComment;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class AjaxInsertReply
 */
@WebServlet("/commentInsert.in")
public class AjaxInsertCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertCommentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int infoNo = Integer.parseInt(request.getParameter("ino"));
		String content = request.getParameter("content");
		int userNo = 0;
		
		if((User)request.getSession().getAttribute("userInfo") != null) {
			userNo = ((User)request.getSession().getAttribute("userInfo")).getUserNo();
		}
		
		InfoComment comment = new InfoComment();
		comment.setBoardNo(infoNo);
		comment.setCommentContent(content);
		comment.setUserNo(userNo);
		
		int result = new InfoService().insertComment(comment);
		
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
