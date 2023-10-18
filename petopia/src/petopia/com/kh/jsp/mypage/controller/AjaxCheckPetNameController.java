package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.mypage.model.service.PetService;

/**
 * Servlet implementation class AjaxCheckPetNameController
 */
@WebServlet("/checkPetName.my")
public class AjaxCheckPetNameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckPetNameController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String petName = request.getParameter("petName");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int checkName = new PetService().checkPetName(petName, userNo);
		
		if(checkName == 0) {
			//System.out.println("이미 존재하는 이름");
		} else {
			//System.out.println("사용가능한 이름");
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(checkName);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
