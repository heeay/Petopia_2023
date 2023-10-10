package petopia.com.kh.jsp.mypage.controller;

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
import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.mypage.model.vo.Suggestion;

/**
 * Servlet implementation class suggestionEnrollFormController
 */
@WebServlet("/sugEnroll.my")
public class suggestionEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suggestionEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			String savePath = request.getServletContext().getRealPath("/resources/sug_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			String sugTitle = multiRequest.getParameter("title");
			String sugContent = multiRequest.getParameter("content");
			
			Suggestion sug = new Suggestion();
			sug.setSugTitle(sugTitle);
			sug.setSugContent(sugContent);
			sug.setUserNo(userNo);
			
			// 첨부파일3개 있을수도 없을수도
			ArrayList<PetFile> list = new ArrayList();
			
			for(int i = 1; i<=3; i++) {
				// file1~file3
				String key = "file"+i;
				
				if(multiRequest.getFilesystemName(key) != null) { // 파일이 존재함
					PetFile pt = new PetFile();
					
					pt.setOriginalName(multiRequest.getOriginalFileName(key));
					pt.setUploadName(multiRequest.getFilesystemName(key));
					pt.setFilePath("resources/sug_upfiles");
					
					list.add(pt);
				}
			}
			int result = new PetService().insertSuggestion(sug, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				//response.sendRedirect(request.getContextPath() + "/suggestions.jsp");
				request.getRequestDispatcher("views/mypage/suggestions.jsp").forward(request, response);
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
