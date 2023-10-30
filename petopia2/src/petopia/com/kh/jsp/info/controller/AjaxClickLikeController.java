package petopia.com.kh.jsp.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.board.model.vo.Like;
import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class AjaxUpdateLike
 */
@WebServlet("/clickLike.in")
public class AjaxClickLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxClickLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		int infoNo = Integer.parseInt(request.getParameter("ino")); // 게시글 번호
		int userNo = 0;
		if((User)request.getSession().getAttribute("userInfo") != null) {
			userNo = ((User)request.getSession().getAttribute("userInfo")).getUserNo(); // 회원 번호
		}
		
		int result = 0;
		int check = new InfoService().checkLike(infoNo, userNo); // Y인 좋아요의 개수
		int checkNo = new InfoService().checkNoLike(infoNo, userNo); // N인 좋아요의 개수
		
		// System.out.println(check);❤
		// System.out.println(checkNo);
		
		
		if(check == 1) { // 게시글에 좋아요가 클릭되어있는 경우 (LIKE_YN == 'Y')
			result = new InfoService().deleteLike(infoNo, userNo); // LIKE_YN = 'N'으로 변경 (성공 1, 실패 0)
			result += 1; // result + 1 (성공 2)
			
		} else { // check == 0 (LIKE_YN = 'N' OR 좋아요 처음 클릭)
			
			if(checkNo == 1) { // 이전에 좋아요를 클릭했다 취소한 경우 (LIKE_YN == 'N')
				result = new InfoService().updateLike(infoNo, userNo); // LIKE_YN = 'Y'로 변경
				
			} else { // 처음 좋아요를 클릭하는 경우
				Like like = new Like();
				like.setBoardNo(infoNo);
				like.setUserNo(userNo);
				
				result = new InfoService().insertLike(like); // 성공 1, 실패 0
			}
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
