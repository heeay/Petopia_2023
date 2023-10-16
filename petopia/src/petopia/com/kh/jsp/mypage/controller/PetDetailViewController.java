package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;

/**
 * Servlet implementation class PetDetailViewController
 */
@WebServlet("/petDetail.my")
public class PetDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetDetailViewController() {
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
		
		// petopia/petDetail.my?pno=XXX
		int petNo = Integer.parseInt(request.getParameter("pno"));
		
		Pet p = new PetService().selectPetProfil(petNo);
		PetFile pt = new PetService().selectPetFile(petNo);
		
		request.setAttribute("p", p);
		request.setAttribute("pt", pt);
		
		request.getRequestDispatcher("views/mypage/petProfilDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
