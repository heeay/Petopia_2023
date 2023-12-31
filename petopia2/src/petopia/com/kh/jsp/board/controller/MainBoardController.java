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
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;

/**
 * Servlet implementation class MainBoard
 */
@WebServlet("/main.bo")
public class MainBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    // 새로 만들었어요!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿼리스트링요청 /jsp/list.bo?cpage=1 GET방식 -> 인코딩 X
		request.setCharacterEncoding("UTF-8");
		
		// 2) request값 뽑기
		
		// -- 페이징 처리 --
		// 필요한 변수들
		int listCount; // 현재 일반게시판의 게시글 '총 개수' => BOARD테이블로부터 COUNT(*)활용(STATUS = 'Y')해서 조회
		int currentPage; // 현재 페이지(사용자가 요청한 페이지) => request.getParameter("cpage")
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 개수 => 5개로 고정
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 9개로 고정  
		
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지의 개수) => Math.ceil(listCount/boardLimit) ???
		int startPage; // 페이지 하단에 보여질 페이징바의 시작 수 => ((currentPage/pageLimit) -1)*pageLimit + 1 = startPage
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수 => startPage + pageLimit - 1
		
		
/*여기서부턴 각 변수마다 예외경우의 수 분석 */ 
		
		// * listCount : 총 게시글의 수
		listCount = new BoardService().selectListCount(); // 107
		
		// * currentPage : 현재 페이지(사용자가 요청한페이지) : 서블릿에서 getParameter할수있는것은 사용자가 요청한 값뿐
		
		try {
			currentPage = Integer.parseInt(request.getParameter("cpage")); // int 혹은 ""
		} catch(NumberFormatException e) { // 예외case) ""일 때
			currentPage = 1;
		}
		System.out.println("총게시글수 : " + listCount); 
		System.out.println("사용자가 요청한 페이지 : " + currentPage);
		
		// * pageLimit : 페이징바 최대 개수
		pageLimit = 5;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 개수

/*
		이거아님
		if( ) {
		
			boardLimit = Integer.parseInt(request.getParameter("display"));
		} else {
			boardLimit = 4;
		}
*/		
		// 한페이지에 보여질 게시글수
		boardLimit = 4;
		
		// a태그 href에서 ?display= 로 받은 String형 게시글수(==레이아웃을 위한 boardLimit개념)
		String dpCount = request.getParameter("display");
		
		// n개씩 보기 클릭X시(초기화면) display값이 null인 문제 => try/catch로 해결
		try {
			if(dpCount != null) {
				switch(Integer.parseInt(dpCount)) {
				case 1 : boardLimit = 1; break;
				case 9 : boardLimit = 9; break;
				// 처음 메인게시판 들어왔을 땐 '이벤트없이' #content-items에 .four클래스 추가
				default : boardLimit = 4; 
				}
			}
		} catch(NumberFormatException e) { // 예외case) ""일 때
			boardLimit = 4;
		}
	
			
		// main.bo?display=n은 페이지바가 pageLimit내에서 이동해도 변화가 없어야 함
		 
		
		// * maxPage : 가장 마지막페이지가 몇 번 페이지인지(총 페이지 개수)
		/*
		 * listCount, boardLimit에 영향을 받음
		 * 
		 * - 공식 구하기
		 *   단, boardLimit이 10이라는 가정하에 규칙을 찾아보자
		 *   
		 *   총 개수(listCount)		boardLimit(10개)		maxPage(마지막페이지)
		 *   100개			/			10개				= 10.0  10 페이지
		 *   107개			/			10개				= 10.7	11페이지
		 *   111개			/			10개				= 11.1  12페이지
		 *   
		 *   => 나눗셈결과(listCount/boardLimit)를 올림처리를 할 경우 maxPage가 됨
		 *   
		 *   
		 *   스텝
		 *   1. listCount를 double로 변환
		 *   2. listCount / boardLimit
		 *   3. Math.ceil() => 결과를 올림처리
		 * 	 4. 결과값을 int로 형변환
		 */
		//listCount = 302;
		//boardLimit = 15;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); // 단순히 Math.ceil(listCount/boardLimit)
		// listCount == 0이면 maxPage도 0
		
		System.out.println("총페이지개수 : " + maxPage);
		
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작 수
		/*
		 * pageLimit, currentPage에 영향을 받음
		 * 
		 * - 공식 구하기
		 *    단, pageLimit이 10이라는 가정하에 규칙을 구해보자
		 *    
		 * startPage : 1, 11, 21, 31, 41..  => n * 10 + 1
		 * 
		 * 만약에 pageLimit이 5였다??
		 * 
		 * startPage : 1, 6, 11, 16..       => n * 5 + 1
		 * 
		 * 즉, startPage = n * pageLimit + 1;
		 * 
		 * currentPage				startPage
		 * 		1						1
		 * 		5						1
		 * 	   10						1 currentPage/pageLimit <=1 startPage = 1
		 * 	   13						11						
		 * 	   20						11 currentPage/pageLimit <=2 startPage = 11
		 * 	   29						21 currentPage/pageLimit <=3 startPage = 21
		 * 					((currentPage/pageLimit) -1)*pageLimit + 1 = startPage
		 * 					
		 * 
		 * =>  1 ~ 10 : n * 10 + 1 => n == 0
		 * => 11 ~ 20 : n * 10 + 1 => n == 1
		 * => 21 ~ 30 : n * 10 + 1 => n == 2
		 * 
		 *  1 ~ 10 / 10 => 0 ~ 1
		 * 11 ~ 20 / 10 => 1 ~ 2
		 * 21 ~ 30 / 10 => 2 ~ 3
		 * 
		 *   0 ~ 9 / 10 => 0
		 * 10 ~ 19 / 10 => 1
		 * 20 ~ 29 / 10 => 2
		 * 
		 * n = (currentPage - 1) / pageLimit = 총 page바 수?
		 * 
		 * 
		 * startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;// 내 방법 : ((currentPage/pageLimit) -1)*pageLimit + 1 = startPage
		// lsitCount가 0일때 'currentPage -1'은 0 == startPage는 1
		
		System.out.println("시작페이지 : " + startPage);
		// * endPage : 페이지 하단에 보여질 페이징바의 끝 수
		/*
		 * startPage, pageLimit에 영향을 받음 (단, maxPage도 마지막 페이징 바에 대해 영향을 끼침)
		 * 
		 * - 공식 구하기
		 * 단, pageLimit이 10이라는 가정하에
		 * 
		 * startPage : 1 => endPage : 10
		 * startPage : 11 => endPage : 20
		 * startPage : 21 => endPage : 30
		 * 
		 * => endPage = startPage + pageLimit - 1;
		 */
		endPage = startPage + pageLimit - 1;
		//listCount가 0일때 startPage는 1 == endPage는 pageLimit
		// ==> pageLimit은 5이므로 endPage는 5
		
		System.out.println("끝 페이지 : " +  endPage);
		
		
		// startPage가 21이라서 endPage에는 30이 들어갔는데
		// maxPage가 23이라면??
		// endPage값을 maxPage값으로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
			// endpage는 0 
		
		}
		
		
		// 여기까지 총 8개의 변수를 만들었음!
		// 3) VO로 가공
		PageInfo pageInfo = new PageInfo(listCount, currentPage, pageLimit, 
								   boardLimit, maxPage, startPage, endPage, dpCount);
	
		// 4) Service로 가자~ // pageInfo를 넘기는 이유 : select할 때 pageInfo이용하니까
		ArrayList<Board> bList = new BoardService().selectList(pageInfo);
		
		System.out.println(bList);
		
		// 5) 응답화면 지정
		
		/* 이거는 view에서 할 것
		if(bList != null) {
			
		} else {
			request.getParameter()
		}
		*/
		
		//
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("bList", bList);
		request.getRequestDispatcher("views/board/mainBoardView.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
