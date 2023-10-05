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
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoFile;
import petopia.com.kh.jsp.info.model.vo.Star;

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
			Info i = new Info();
			i.setInfoTitle(title);
			i.setCategory(category);
			i.setInfoContent(content);
			i.setUserNo(userNo);
			
			// 별점 가공
			Star s = new Star();
			s.setStarScore(star);
			
			// 첨부파일
			ArrayList<InfoFile> list = new ArrayList();
			
			
			
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
