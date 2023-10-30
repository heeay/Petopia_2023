package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.common.template.Pagination;
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
		String userNo = Integer.toString(loginUser.getUserNo());
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		HashMap<String, String> map = new HashMap();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("userNo", userNo);
		
		int listCount = new PetService().selectWalkListCount(loginUser);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 10;		// 페이지 하단에 보여질 페이징바의 최대 개수
		int boardLimit = 3;		// 한 페이지에 보여질 게시글의 초대 개수
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<WalkRecords> walkList = new PetService().selectWalkList(pi, loginUser);
		
		
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
