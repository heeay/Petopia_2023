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
		
		String bcount = new PetService().selectBoardCount(loginUser);
		String lastDate = new PetService().selectBoardDate(loginUser);
		
		//System.out.println(bcount);
		//System.out.println(lastDate);
		
		
		int bGrade = Integer.valueOf(bcount);
		
		//System.out.println(bcount);
		//System.out.println(bGrade);
		
		//System.out.println(loginUser.getRoleId());
		
		if(loginUser.getRoleId() == "관리자") {	// 관리자는 업그레이드 x
			String getRoleId = "관리자";
			//System.out.println(getRoleId);
			
			request.setAttribute("getRoleId", getRoleId);
			request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
		}
		
		if(loginUser.getRoleId() == "초급") {
			if(bGrade>10) {
				
				int result = new PetService().updateGradeR1(loginUser);
				
				if(result>0) {
					String getRoleId = new PetService().selectR2(loginUser);
					//System.out.println(getRoleId);
					
					request.setAttribute("getRoleId", getRoleId);
					request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			} 
		}
		
		if(loginUser.getRoleId() == "중급") {
			if(bGrade>30) {
				int result = new PetService().updateGradeR2(loginUser);
				
				if(result>0) {
					String getRoleId = new PetService().selectR3(loginUser);
					//System.out.println(getRoleId);
					
					request.setAttribute("getRoleId", getRoleId);
					request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			}
			
		}
		
		if(loginUser.getRoleId() == "고급") {// 고급단계는 더이상 업그레이드 할 수 없음
			String getRoleId = "고급";
			
			//System.out.println(getRoleId);
			
			request.setAttribute("getRoleId", getRoleId);
			request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
		}
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
