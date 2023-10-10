package petopia.com.kh.jsp.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoService;

/**
 * Servlet implementation class InfoListController
 */
@WebServlet("/share.in")
public class ShareListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// petopia/share.in?ictg=12
		
		int ctgNo;
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		// 사용자가 클릭한 카테고리에 따른 카테고리 번호
		ctgNo = Integer.parseInt(request.getParameter("ictg"));
		
		listCount = new InfoService().selectListCount(ctgNo); // 특정 카테고리의 게시글만 조회
		
		System.out.println(ctgNo);
		
		
		
		request.getRequestDispatcher("views/info/shareListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
