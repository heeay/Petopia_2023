package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.WalkRecords;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class WalkListController
 */
@WebServlet("/walkList.my")
public class WalkListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkListController() {
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
		
		HttpSession session = request.getSession();
		User loginUser = ((User)session.getAttribute("userInfo"));
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		int listCount;		// 현재 일반게시판의 게시글 총 개수
		int currentPage;	// 현재 페이지(사용자가 요청한 페이지) => request.getParameter("cpage")
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 최대 개수
		int boardLimit;		// 한 페이지에 보여질 게시글의 초대 개수
		
		int maxPage;		// 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
		int startPage;		// 페이지 하단에 보여질 페이징바의 시작수
		int endPage;		// 페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = new PetService().selectWalkListCount(loginUser);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		pageLimit = 10;
		boardLimit = 3;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = ((currentPage-1)/pageLimit)*pageLimit+1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, 
								boardLimit, maxPage, startPage, endPage);
		
		ArrayList<WalkRecords> walkList = new PetService().selectWalkList(pi, loginUser, startDate, endDate);
		
		
		//System.out.println(listCount);
		//System.out.println(currentPage);
		//System.out.println(pageLimit);
		//System.out.println(maxPage);
		//System.out.println(startPage);
		//System.out.println(endPage);
		
		//System.out.println(startDate);
		//System.out.println(endDate);
		//System.out.println(walkList);
	
		
		
		request.setAttribute("walkList", walkList);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("/views/mypage/walkListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
