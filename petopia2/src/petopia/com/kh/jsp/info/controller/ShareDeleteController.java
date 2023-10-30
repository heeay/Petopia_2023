package petopia.com.kh.jsp.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoService;

/**
 * Servlet implementation class ShareDeleteController
 */
@WebServlet("/delete.in")
public class ShareDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		int category = Integer.parseInt(request.getParameter("ictg"));
		int infoNo = Integer.parseInt(request.getParameter("ino"));
		
		int result = new InfoService().deleteShare(infoNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 삭제에 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/share.in?ictg=" + category + "&ipage=1");
		} else {
			request.setAttribute("errorMsg", "게시글 삭제에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
