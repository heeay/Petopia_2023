package petopia.com.kh.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		// 3. 기능 : 조회수 증가 : DML
		
		 int increaseCount = new BoardService().increaseViewsCount(bno);
		 System.out.println(increaseCount);
		 
		 
		 // 서비스 갔다온 뒤 결과 조회수가 성공적으로 증가했다면 조회에 성공한 거임 이제 데이터 불러오면 됨
		 if(increaseCount > 0) {
			 // 보드 조회, 파일조회, 좋아요 조회도 같이
			 
			// 1. 보드 조회
			 Board b = new BoardService().selectBoard(bno);
			  
			// 2. 파일 조회
			 ArrayList<File> fList = new BoardService().selectFile(bno);
			 
			 // 3. 좋아요 조회
			 int likeCount = new BoardService().countLike(bno);
			 
			 // 조회한 결과 담기
			 request.setAttribute("b", b);
			 request.setAttribute("fList", fList);
			 request.setAttribute("likeCount", likeCount);
	
			 // 조회한 결과 화면에 dispatch
			 request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);
			 
			 
		 } else {
			 request.getRequestDispatcher("views/common/errorPage.jsp");
		 }
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
