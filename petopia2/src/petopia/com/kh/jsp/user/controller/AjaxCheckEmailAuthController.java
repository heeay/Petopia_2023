package petopia.com.kh.jsp.user.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.user.model.service.UserServiceImpl;

/**
 * Servlet implementation class AjaxCheckEmailAuthController
 */
@WebServlet("/checkAuthEmail")
public class AjaxCheckEmailAuthController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckEmailAuthController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String authCode = request.getParameter("authCode");
		
		Date curDate = new Date();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("emailAuthEmail", email);
		map.put("emailAuthCode", authCode);
		Date date = new UserServiceImpl().selectEmailAuth(map);
		
		//System.out.println(date);
		String result="";
		if(date==null) {
			result = "404";
		} else if(curDate.getTime()-date.getTime()<120000) {
			result = "200";
		} else {
			result = "400";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
