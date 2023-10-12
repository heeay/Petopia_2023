package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.info.model.vo.HospitalData;

/**
 * Servlet implementation class AjaxMapUpdateController
 */
@WebServlet("/updateMap")
public class AjaxMapUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMapUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		double east = Double.parseDouble(request.getParameter("east"));
		double west = Double.parseDouble(request.getParameter("west"));
		double south = Double.parseDouble(request.getParameter("south"));
		double north = Double.parseDouble(request.getParameter("north"));
		//System.out.println("남서쪽 : "+south+", "+west);
		//System.out.println("북동쪽 : "+north+", "+east);
		
		double[] mapBounds = {east,west,south,north};
		ArrayList<HospitalData> list = new InfoService().selectMapData(mapBounds);
		
		response.setContentType("application/json; charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
