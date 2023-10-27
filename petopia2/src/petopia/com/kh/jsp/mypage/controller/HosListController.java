package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.common.template.Pagination;
import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class HosListController
 */
@WebServlet("/hosList.my")
public class HosListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosListController() {
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
		int userNo = loginUser.getUserNo();
		
		//System.out.println(startDate);
		//System.out.println(endDate);
		
		int listCount = new PetService().selectHosListCount(userNo);
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 10;		// 페이지 하단에 보여질 페이징바의 최대 개수
		int boardLimit = 8;		// 한 페이지에 보여질 게시글의 초대 개수
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<HosRecords> hosList = new PetService().selectHosList(pi, userNo);
		
		request.setAttribute("hosList", hosList);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/mypage/hosListView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
