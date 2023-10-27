package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class MyMainViewSelectController
 */
@WebServlet("/main.my")
public class MyMainViewSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMainViewSelectController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("userInfo")==null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		User loginUser = ((User)session.getAttribute("userInfo"));
		int userNo = loginUser.getUserNo();
		
		String bcount = new PetService().selectBoardCount(userNo);
		String lastDate = new PetService().selectBoardDate(userNo);
		
		//System.out.println(bcount);
		//System.out.println(lastDate);
		
		
		request.setAttribute("bcount", bcount);
		request.setAttribute("lastDate", lastDate);
		request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
