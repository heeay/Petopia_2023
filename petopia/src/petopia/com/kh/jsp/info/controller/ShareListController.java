package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.service.InfoService;
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
		// 현재 페이지 번호
		currentPage = Integer.parseInt(request.getParameter("ipage"));
		
		// 특정 카테고리에 따른 게시글 수
		listCount = new InfoService().selectListCount(ctgNo);
		
		// System.out.println(ctgNo);
		// System.out.println(listCount);
		
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Info> list = new InfoService().selectList(pi, ctgNo);
		
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
