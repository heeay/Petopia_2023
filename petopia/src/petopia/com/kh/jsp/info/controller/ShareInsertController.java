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
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 100;
			
			String savePath = request.getServletContext().getRealPath("/resources/info_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String category = multiRequest.getParameter("category");
			String content = multiRequest.getParameter("content");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			int star = Integer.parseInt(multiRequest.getParameter("star"));
			
			// 인포 가공
			Info in = new Info();
			in.setInfoTitle(title);
			in.setCategory(category);
			in.setInfoContent(content);
			in.setUserNo(userNo);
			
			// 첨부파일
			ArrayList<InfoFile> list = new ArrayList();
			
			for (int i = 1; i <= 5; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					InfoFile iFile = new InfoFile();
					iFile.setOriginalName(multiRequest.getOriginalFileName(key));
					iFile.setUploadName(multiRequest.getFilesystemName(key));
					iFile.setFilePath("resources/info_upfiles");
					
					if(i == 1) {
						iFile.setFileLevel(1);
					} else {
						iFile.setFileLevel(2);
					}
					list.add(iFile);
				}
			}
			
			int result = new InfoService().insertShareInfo(in, star, list);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/share.in");
			} else {
				
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
