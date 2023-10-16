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
 * Servlet implementation class HosDetailController
 */
@WebServlet("/hosDetail.my")
public class HosDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosDetailController() {
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
		// petopia/hosDetail.my?hno=XXX
		int hosNo = Integer.parseInt(request.getParameter("hno"));
		
		HosRecords hr = new PetService().selectHosContent(hosNo);
		ArrayList<Pet> petList = new PetService().selectPetName(loginUser);
		
		//System.out.println(hr);
		//System.out.println(hosNo);
		
		request.setAttribute("hr", hr);
		request.setAttribute("petList", petList);
		
		request.getRequestDispatcher("views/mypage/hosDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
