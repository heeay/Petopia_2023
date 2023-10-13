package petopia.com.kh.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import petopia.com.kh.jsp.common.MyFileRenamePolicy;

/**
 * Servlet implementation class InsertBoardController
 */
@WebServlet("/insert.bo")
public class InsertBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post
		request.setCharacterEncoding("UTF-8");
		
		// 0. ENCTYPE속성이 MULTIPART/FORM-DATA로 잘 전송됐을 때 내용물 수정할 수 있도록 조건줌
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일업로드가 request를 가진 multipart내용물을 담고 있으면 스코프 안으로 들어옴
			
			// 1. 전송된 파일 처리작업 : 용량제한, 파일 저장 경로 알아내기
			
			int maxSize = 1024 * 1024 * 10;
			
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/board_upfiles/");
		
			// 2. 파일명 수정하며 서버에 업로드
			/*
			 * MultipartRequest multiRequest
			 * = new MultipartRequest(
			 * request, savePath, maxSize, 인코딩, 파일명을수정해주는객체
			 * );
			 */
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
//			userInfo.getter
			// 3. 이제서야 값 뽑기
			// : 카테고리
			
		}
		
		
		// 트랜잭션이 끝난뒤 결과값을 main.bo에 되돌려준다.
		response.sendRedirect(request.getContextPath() + "/main.bo");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
