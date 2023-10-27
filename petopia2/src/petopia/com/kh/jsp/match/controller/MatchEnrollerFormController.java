package petopia.com.kh.jsp.match.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.match.model.service.MatchService;
import petopia.com.kh.jsp.match.model.vo.Match;
import petopia.com.kh.jsp.mypage.model.vo.Pet;

/**
 * Servlet implementation class MatchEnrollerFormController
 */
@WebServlet("/enroller.pb")
public class MatchEnrollerFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchEnrollerFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<Pet> petInfo = new MatchService().selectPetInfo();
		
		request.setAttribute("petInfo", petInfo);
		
		ArrayList<Match> list = new MatchService().selectMainList();
		
		request.setAttribute("list", list );
		
		request.getRequestDispatcher("views/match/matchEnrollerForm.jsp").forward(request, response);
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
