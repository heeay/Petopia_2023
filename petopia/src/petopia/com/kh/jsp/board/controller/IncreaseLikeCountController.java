package petopia.com.kh.jsp.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.board.model.service.BoardService;

/**
 * Servlet implementation class IncreaseLikeCountController
 */
@WebServlet("/increaseLike.bo")
public class IncreaseLikeCountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncreaseLikeCountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		//int userNo = Integer.parseInt(request.getParameter("userNo"));
		//int likeCount = Integer.parseInt(request.getParameter("likeCount"));
		//System.out.println(likeCount);
		
		int increasedCount = new BoardService().increaseLikeCount(boardNo);
		//int decreasedCount = new BoardService().dereasedLikeCount(boardNo);
	
		request.setAttribute("increasedCount", increasedCount);//	이거 없으면 값이 넘어가지 않아서 404에러 뜸
		request.getRequestDispatcher("views/boardDetailView.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
