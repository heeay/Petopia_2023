package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class PetListController
 */
@WebServlet("/pet.my")
public class PetListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User loginUser = ((User)session.getAttribute("userInfo"));
		
		int listCount;		// 현재 일반게시판의 게시글 총 개수 => BOARD테이블로부터 COUNT(*)활용 (STATUS='Y')해서 조회
		int currentPage;	// 현재 페이지(사용자가 요청한 페이지) => request.getParameter("cpage")
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 최대 개수 => 10개로 고정
		int boardLimit;		// 한 페이지에 보여질 게시글의 초대 개수 => 10개로 고정
		
		int maxPage;		// 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수)
		int startPage;		// 페이지 하단에 보여질 페이징바의 시작수
		int endPage;		// 페이지 하단에 보여질 페이징바의 끝 수
		
		
		listCount = new PetService().selectPetListCount(loginUser);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		//System.out.println(listCount);
		//System.out.println(currentPage);
		
		pageLimit = 10;
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/pageLimit);
		
		startPage = ((currentPage-1)/pageLimit)*pageLimit+1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, 
									boardLimit, maxPage, startPage, endPage);

		ArrayList<Pet> list = new PetService().selectPetList(pi, loginUser);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/mypage/petProfil.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
