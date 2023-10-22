package petopia.com.kh.jsp.board.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxDisplayController
 */
@WebServlet("/display.bo")
public class AjaxDisplayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDisplayController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dpCount = request.getParameter("display");
		int boardLimit = Integer.parseInt(dpCount);
		
		try {
			if(dpCount != null) {
				switch(Integer.parseInt(dpCount)) {
				case 1 : boardLimit = 1; break;
				case 9 : boardLimit = 9; break;
				default : boardLimit = 4; // 처음 메인게시판 들어왔을 땐 '이벤트없이' #content-items에 .four클래스 추가해야
				}
			}
		} catch(NumberFormatException e) { // 예외case) ""일 때
			boardLimit = 4;
		}
		
		
//		int[]  Array = {dpCount, boardLimit};
//		System.out.println("Array : " + Array);// [I@15833bf6
//		
//		String displayArr = Arrays.toString(Array);
//		System.out.println(displayArr);//[1, 1]
//		response.getWriter().print(displayArr);// 주소값이 넘어감
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(dpCount);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
