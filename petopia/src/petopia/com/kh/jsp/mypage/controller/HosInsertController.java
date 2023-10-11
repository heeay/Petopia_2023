package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.mypage.model.vo.HosRecords;

/**
 * Servlet implementation class HosInsertController
 */
@WebServlet("/HosInsert.my")
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
		request.setCharacterEncoding("UTF-8");
		
		String petName = request.getParameter("petName");
		int petNo =request.getParameter("petNo")
		
		String hosDate = request.getParameter("hosDate");
		String hosVaccination = request.getParameter("hosVaccination");
		String hosIllness = request.getParameter("hosIllness");
		String hosMedicine = request.getParameter("hosMedicine");
		String hosContent = request.getParameter("hosContent");
		
		HosRecords hr = new HosRecords();
		hr.setHosDate(hosDate);
		hr.setHosVaccination(hosVaccination);
		hr.setHosMedicine(hosMedicine);
		hr.setHosContent(hosContent);
		hr.setPetNo(petNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
