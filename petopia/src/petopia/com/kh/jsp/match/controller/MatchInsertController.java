package petopia.com.kh.jsp.match.controller;

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

import petopia.com.kh.jsp.common.MyFileRenamePolicy;
import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.match.model.service.MatchService;
import petopia.com.kh.jsp.match.model.vo.Match;

/**
 * Servlet implementation class InsertMatchController
 */
@WebServlet("/insert.pb")
public class MatchInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			 
			// 전송 용량 제한(10Mbyte)
			int maxSize = 1024 * 1024 * 10;
			
			// 저장 경로
			
			
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/thumbnail_upfiles/");
		
			//System.out.println(savePath);
			
			MultipartRequest multiRequest = 
			new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String meetBoardTitle = multiRequest.getParameter("meetBoardTitle");
			String hopeActivity = multiRequest.getParameter("hopeActivity");
			String petInfo = multiRequest.getParameter("petInfo");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			int petNo = Integer.parseInt(multiRequest.getParameter("petNo"));
			
			Match m = new Match();
			m.setMeetBoardTitle(meetBoardTitle);
			m.setPetInfo(petInfo);
			m.setHopeActivity(hopeActivity);
			m.setUserNo(userNo); 
			m.setPetNo(petNo);
			
			ArrayList<File> list = new ArrayList();
			
			for(int i = 1; i <= 2; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					File fi = new File();
					fi.setOriginalName(multiRequest.getOriginalFileName(key));
					fi.setUploadName(multiRequest.getFilesystemName(key));
					fi.setFilePath("resources/thumbnail_upfiles");
					
					if(i == 1) {
						fi.setFileLevel(1);
					} else {
						fi.setFileLevel(2);
					}
					
					list.add(fi);
					System.out.println(fi);
				}
				
			}
			
			int result = new MatchService().insertThumbnailBoard(m, list);
			
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/main.pb");
				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				
			} else {
				request.getSession().setAttribute("errorPage", "게시글 작성 실패");

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
