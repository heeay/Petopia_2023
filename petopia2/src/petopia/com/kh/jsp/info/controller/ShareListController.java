package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.common.template.Pagination;
import petopia.com.kh.jsp.info.model.service.InfoServiceImpl;
import petopia.com.kh.jsp.info.model.vo.Info;

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
		
		// petopia/share.in?ictg=22
		
		int ctgNo = Integer.parseInt(request.getParameter("ictg"));
		int currentPage = Integer.parseInt(request.getParameter("ipage"));
		int listCount = new InfoServiceImpl().selectListCount(ctgNo);
		int pageLimit = 10;
		int boardLimit = 10;

		// System.out.println(ctgNo);
		// System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Info> list = new InfoServiceImpl().selectList(ctgNo, pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("ctgNo", ctgNo);
		
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
