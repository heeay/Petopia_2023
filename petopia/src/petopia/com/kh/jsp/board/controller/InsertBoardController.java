package petopia.com.kh.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import petopia.com.kh.jsp.board.model.service.BoardService;
import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.common.MyFileRenamePolicy;
import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.user.model.vo.User;

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
			// 제목/내용/카테고리/이미지/글슨이/
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			int ctgNo = Integer.parseInt(multiRequest.getParameter("category"));
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			/* 이게 아니라 반복문
			int file1 = Integer.parseInt(multiRequest.getParameter("file1"));
			int file1 = Integer.parseInt(multiRequest.getParameter("file1"));
			int file1 = Integer.parseInt(multiRequest.getParameter("file1"));
			int file1 = Integer.parseInt(multiRequest.getParameter("file1"));
			*/
			

			// 변수 = input의 name속성명에서 추출한 값
			
			
			// 3_1. VO로 가공 : Board와 ArrayList<File>
			Board board = new Board();
			board.setBoardTitle(boardTitle);
			board.setBoardContent(boardContent);
			board.setCtgNo(ctgNo);
			board.setUserNo(userNo);
	
			
			// 3_2. VO로 가공하되 값은 multiRequest에서 뽑기
			ArrayList<File> fList = new ArrayList();
			
			for(int i = 1; i <= 4 ; i++) {
				
				String fNum = "file" + i;
				
				// 파일업로드부터확인해야(조회수증가확인하는것처럼)
				if(multiRequest.getOriginalFileName(fNum) != null) {
					
					// 업로드된거면 VO에 담아주기
					File file = new File();
					
					// fileNum을 통한 mutlRequest의 메소드를 이용해서 값을 담아준다.
					file.setOriginalName(multiRequest.getOriginalFileName(fNum));
					file.setUploadName(multiRequest.getFilesystemName(fNum));
					file.setFilePath("resources/board_upfiles");
					
					// 파일레벨 : 썸네일이냐 아니냐에 따라 file.setFileLevel을 1/2로 설정할 건데....
					// 사실 inputFile.files[0]을 mainBoard.jsp에서 썸네일로 추출하면 fileLevel은 필요가 없을지도?
					// 그래도 혹시 모르니 설정하자
					if(i == 1) {
						file.setFileLevel(1);
					} else {
						file.setFileLevel(2);
					}
					
					fList.add(file);

				}  /*else { // getApplication은 없음
					request.getSession().setAttribute("errorPage", "파일을 업로드 해야 합니다");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
				}*/
				
			} // 반복문 끝
			
			// 4. DB에 요청
			int insert = new BoardService().insertBoard(board, fList);
			
			
			if(insert > 0) { // 게시글 작성 성공
				
				// 트랜잭션이 끝난뒤 결과값을 main.bo에 되돌려준다.
				
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공!");
				response.sendRedirect(request.getContextPath() + "/main.bo");
			
				/*여기다 붙여넣기*/
				
				User loginUser = ((User)session.getAttribute("userInfo"));
				String bcount = new PetService().selectBoardCount(loginUser);
				int bGrade = Integer.valueOf(bcount);
				
				if(loginUser.getRoleId() == "관리자") {	// 관리자는 업그레이드 x
					String getRoleId = "관리자";
					
					//System.out.println(getRoleId);
					
					request.setAttribute("getRoleId", getRoleId);
					request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
					
				} else if(loginUser.getRoleId() == "초급") {
					if(bGrade>10) {
						
						int result = new PetService().updateGradeR1(loginUser);
						
						String getRoleId = new PetService().selectR2(loginUser);
						
						//System.out.println(getRoleId);
						
						request.setAttribute("getRoleId", getRoleId);
						request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
					} 
					
				}else if(loginUser.getRoleId() == "중급") {
					if(bGrade>30) {
						int result = new PetService().updateGradeR2(loginUser);
						
						String getRoleId = new PetService().selectR3(loginUser);
						
						//System.out.println(getRoleId);
						
						request.setAttribute("getRoleId", getRoleId);
						request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
					}
				}else if(loginUser.getRoleId() == "고급") {// 고급단계는 더이상 업그레이드 할 수 없음
					String getRoleId = "고급";
					
					//System.out.println(getRoleId);
					
					request.setAttribute("getRoleId", getRoleId);
					request.getRequestDispatcher("views/mypage/mygradeView.jsp").forward(request, response);
				}
				request.setAttribute("bcount", bcount);
				
			} else {
				request.getSession().setAttribute("errorPage", "게시글이나 파일에 문제가 있습니다");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			
			
		} // multiPart등 입력값이 없다는 뜻
		else {
			request.getSession().setAttribute("errorPage", "값을 모두 입력해주세요");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
