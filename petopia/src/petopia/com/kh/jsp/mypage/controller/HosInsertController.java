package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;

/**
 * Servlet implementation class HosInsertController
 */
@WebServlet("/hosInsert.my")
public class HosInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HosInsertController() {
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
		
		int petNo = Integer.parseInt(request.getParameter("petNo"));
		String hosDate = request.getParameter("hosDate");
		String hosVaccination = request.getParameter("hosVaccination");
		String hosIllness = request.getParameter("hosIllness");
		String hosMedicine = request.getParameter("hosMedicine");
		String hosContent = request.getParameter("hosContent");
		
		HosRecords hr = new HosRecords();
		hr.setPetNo(petNo);
		hr.setHosDate(hosDate);
		hr.setHosVaccination(hosVaccination);
		hr.setHosIllness(hosIllness);
		hr.setHosMedicine(hosMedicine);
		hr.setHosContent(hosContent);
		
		int result = new PetService().insertHos(hr);
		
		if(result>0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "병원기록 작성 성공");
			response.sendRedirect(request.getContextPath()+"/hosList.my?cpage=1");
		}else {
			request.setAttribute("ereeorMsg", "공지사항 등록 실패");
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
