package petopia.com.kh.jsp.match.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import petopia.com.kh.jsp.common.MyFileRenamePolicy;
import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.match.model.vo.Match;

/**
 * Servlet implementation class InsertMatchController
 */
@WebServlet("/Insert.pb")
public class InsertMatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMatchController() {
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
			String savePath = request.getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			
			MultipartRequest multiRequest = 
			new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String meetBoardTitle = multiRequest.getParameter("meetBoardTitle");
			String petInfo = multiRequest.getParameter("petInfo");
			String hopeActivity = multiRequest.getParameter("hopeActivity");
			String userNo = multiRequest.getParameter("userNo");
			String petNo = multiRequest.getParameter("petNo");
			
			Match m = new Match();
			m.setMeetBoardTitle(meetBoardTitle);
			m.setPetInfo(petInfo);
			m.setHopeActivity(hopeActivity);
			m.setUserNo(userNo); 
			m.setPetInfo(petInfo);
			
			for(int i = 1; i <= 2; i++) {
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					File fi = new File();
					fi.setOriginalName(multiRequest.getOriginalFileName(key));
					fi.setUploadName(multiRequest.getFilesystemName(key));
					fi.setFilePath("resources/thumbnail_upfiles");
					
					
				}
				
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
