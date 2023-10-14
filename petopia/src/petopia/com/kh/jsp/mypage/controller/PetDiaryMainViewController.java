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
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class HosMainViewController
 */
@WebServlet("/hosMain.my")
public class PetDiaryMainViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetDiaryMainViewController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User loginUser = ((User)session.getAttribute("userInfo"));
		
		HosRecords hr = new PetService().selectHosMain(loginUser);
		ArrayList<Pet> petList = new PetService().selectPetName(loginUser);
		
		request.setAttribute("hr", hr);
		//System.out.println(hr);
		
		request.getRequestDispatcher("views/mypage/petDiaryView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
