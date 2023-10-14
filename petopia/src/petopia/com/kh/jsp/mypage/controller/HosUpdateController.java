package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;

/**
 * Servlet implementation class HosUpdateController
 */
@WebServlet("/hosUpdate.my")
public class HosUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int hosNo = Integer.parseInt(request.getParameter("hno"));
		//System.out.println(hosNo);
		
		int petNo = Integer.parseInt(request.getParameter("petNo"));
		String hosDate = request.getParameter("hosDate");
		String hosVaccination = request.getParameter("hosVaccination");
		String hosIllness = request.getParameter("hosIllness");
		String hosMedicine = request.getParameter("hosMedicine");
		String hosContent = request.getParameter("hosContent");
		
		HosRecords hr = new HosRecords();
		hr.setPetNo(petNo);
		hr.setHosNo(hosNo);
		hr.setHosDate(hosDate);
		hr.setHosVaccination(hosVaccination);
		hr.setHosIllness(hosIllness);
		hr.setHosMedicine(hosMedicine);
		hr.setHosContent(hosContent);
		
		int result = new PetService().updateHos(hr);
		
		
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "등록 성공");
			response.sendRedirect(request.getContextPath()+"/hosList.my?cpage=1");
		} else {
			request.setAttribute("errorMsg", "등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
