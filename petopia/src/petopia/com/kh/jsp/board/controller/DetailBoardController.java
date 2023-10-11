package petopia.com.kh.jsp.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.board.model.service.BoardService;
import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.common.model.vo.File;

/**
 * Servlet implementation class DetailBoard
 */
@WebServlet("/detail.bo")
public class DetailBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// mainBoard의 boardTitle을 클릭하면 detail.bo로 이동
		// 1. 인코딩 생략
		// 2. 값 뽑아내기 : PK인 boardNo만 뽑기 = 식별가능
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		BoardService bs = new BoardService();
		
		// 3. 기능 : 조회수 증가 : DML
		
		 int increaseCount = bs.increaseViewsCount(boardNo);
		 
		 // 서비스 갔다온 뒤 결과
		 if(increaseCount > 0) {
			 // 테이블 조회 파일 조회도 같이
			 Board b = bs.selectBoard(boardNo);
		
			 // 조회한 결과 담기
			 request.setAttribute("b", b);
	
		 } else {
			 request.getRequestDispatcher("views/common/errorPage.jsp");
		 }
		

		request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
