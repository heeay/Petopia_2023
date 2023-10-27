package petopia.com.kh.jsp.info.controller;

import java.io.File;
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
 * Servlet implementation class ShareUpdateController
 */
@WebServlet("/update.in")
public class ShareUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 100;
			
			String savePath = request.getServletContext().getRealPath("/resources/info_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 값 뽑기 => 게시글 번호, 게시글 제목, 카테고리, 게시글 내용, 별점
			int infoNo = Integer.parseInt(multiRequest.getParameter("infoNo"));
			String title = multiRequest.getParameter("title");
			String category = multiRequest.getParameter("category");
			String content = multiRequest.getParameter("content");
			int star;
			
			// star를 클릭하지 않고 게시글을 작성한 경우 숫자가 아닌 null값이 넘어와서 NumberFormatExcpetion 발생
			// => try-catch문으로 해결
			try {
				star = Integer.parseInt(multiRequest.getParameter("star"));
			} catch (NumberFormatException e) {
				star = 0;
			}
			
			// VO로 가공 (Info)
			Info in = new Info();
			in.setInfoNo(infoNo);
			in.setInfoTitle(title);
			in.setCategory(category);
			in.setInfoContent(content);
			
			ArrayList<InfoFile> list = new ArrayList();
			
			for (int i = 1; i <= 5; i++) {
				String key = "reUpFile" + i;
				
				// 현재 반복하고 있는 키값을 통해 파일을 업로드했는지 파악
				if(multiRequest.getOriginalFileName(key) != null) { // 파일이 존재한다면
					
					InfoFile infoFile = new InfoFile(); // InfoFile 객체 생성
					infoFile.setOriginalName(multiRequest.getOriginalFileName(key)); // 파일 원본명
					infoFile.setUploadName(multiRequest.getFilesystemName(key)); // 파일 수정명
					infoFile.setFilePath("resources/info_upfiles"); // 파일을 올릴 경로
					infoFile.setRefBno(infoNo); // 현재 게시글 번호를 파일의 참조번호에 담음
					
					// 파일 레벨을 지정하는 조건문
					if(i == 1) {
						infoFile.setFileLevel(1); // file1의 파일 레벨은 1 (썸네일로 사용)
					} else {
						infoFile.setFileLevel(2); // 나머지 파일의 파일 레벨은 2
					}
					list.add(infoFile);
				}
			}
			
			// name이 originalFileNo인 파일들 삭제 (기존 게시글 작성 시 올렸던 파일들) => name 속성이 같은 여러 개 받아올 때는 getParameterValues 사용
			new File(savePath + multiRequest.getParameterValues("originalFileNo")).delete();
			
			int result = new InfoService().updateInfo(in, list, star, infoNo);
			
			if(result > 0) { // 게시글 수정 성공
				response.sendRedirect(request.getContextPath() + "/detailShare.in?ino=" + infoNo);
			} else { // 실패
				request.setAttribute("errorMsg", "게시글 수정에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
