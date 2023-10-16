package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.mypage.model.vo.WalkRecords;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class WalkDetailViewController
 */
@WebServlet("/walkDetail.my")
public class WalkDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkDetailViewController() {
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
		// petopia/walkDetail.my?wno=XXX
		int walkNo = Integer.parseInt(request.getParameter("wno"));
		
		WalkRecords wr = new PetService().selectWalkContent(walkNo);
		ArrayList<Pet> petList = new PetService().selectPetName(loginUser);
		
		PetFile pf = new PetService().selectWalkFile(walkNo);
		
		request.setAttribute("wr", wr);
		request.setAttribute("pf", pf);
		request.setAttribute("petList", petList);
		
		//System.out.println(wr);
		
		request.getRequestDispatcher("views/mypage/walkDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
