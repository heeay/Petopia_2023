package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import petopia.com.kh.jsp.common.MyFileRenamePolicy;
import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoFile;

/**
 * Servlet implementation class ShareInsertController
 */
@WebServlet("/insert.in")
public class ShareInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식으로 받아왔음 => 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// enctype이 multipart/form-data로 잘 전송되었을 경우 내용들을 수정할 수 있도록 조건을 걸어줌
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송파일의 용량 제한 (10Mbyte)
			int maxSize = 1024 * 1024 * 100;
			
			// 전달될 파일을 저장할 서버의 폴더 경로 지정
			String savePath = request.getServletContext().getRealPath("/resources/info_upfiles/");
			
			// 서버에 파일 업로드 (MyFileRenamePolicy()를 사용해서 파일명 수정해서 업로드)
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 값 뽑기 => 게시글 제목, 카테고리, 게시글 내용, 작성자 번호, 별점
			String title = multiRequest.getParameter("title");
			String category = multiRequest.getParameter("category");
			String content = multiRequest.getParameter("content");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			int star = 0;
			
			// 별점을 클릭 안하고 넘어오는 경우 star = 0
			if(star != 0) {
				star = Integer.parseInt(multiRequest.getParameter("star"));
			}
				
			// VO로 가공 (Info)
			Info in = new Info();
			in.setInfoTitle(title);
			in.setCategory(category);
			in.setInfoContent(content);
			in.setUserNo(userNo);
			
			// 첨부파일은 여러 개 첨부할 수 있으므로 ArrayList 사용
			ArrayList<InfoFile> list = new ArrayList();
			
			// 키값 : file1 ~ file5
			for (int i = 1; i <= 5; i++) {
				String key = "file" + i;
				
				// 현재 반복하고 있는 키값을 통해 파일을 업로드했는지 파악
				if(multiRequest.getOriginalFileName(key) != null) { // 파일이 존재한다면
					
					InfoFile infoFile = new InfoFile(); // InfoFile 객체 생성
					infoFile.setOriginalName(multiRequest.getOriginalFileName(key)); // 파일 원본명
					infoFile.setUploadName(multiRequest.getFilesystemName(key)); // 파일 수정명
					infoFile.setFilePath("resources/info_upfiles"); // 파일을 올릴 경로
					
					// 파일 레벨을 지정하는 조건문
					if(i == 1) {
						infoFile.setFileLevel(1); // file1의 파일 레벨은 1 (썸네일로 사용)
					} else {
						infoFile.setFileLevel(2); // 나머지 파일의 파일 레벨은 2
					}
					list.add(infoFile);
				}
			}
			
			// InfoService의 insertShareInfo 메소드를 호출해서 받아온 값을 result에 담음
			int result = new InfoService().insertShareInfo(in, star, list); // Info VO와 별점수, 첨부파일 list 넘김
			
			// 결과에 따른 응답 뷰 지정
			if(result > 0) { // 성공
				// System.out.println(category);
				response.sendRedirect(request.getContextPath() + "/share.in?ictg=" + category + "&ipage=1"); // 정보공유 메인 화면으로 돌아감
			} else {
				request.setAttribute("errorMsg", "게시글 작성에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response); // 에러페이지로 가서 에러메시지 보여줌
			}
			
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
