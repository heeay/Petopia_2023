package petopia.com.kh.jsp.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.mypage.model.service.PetService;

/**
 * Servlet implementation class WalkDeleteController
 */
@WebServlet("/deleteWalk.my")
public class WalkDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkDeleteController() {
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
		
		int walkkNo = Integer.parseInt(request.getParameter("wno"));
		
		int result = new PetService().deleteWalk(walkkNo);
		
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "산책기록 삭제 성공");
			response.sendRedirect(request.getContextPath()+"/walkList.my?cpage=1");
		} else {
			request.setAttribute("errorMsg", "산책기록 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
