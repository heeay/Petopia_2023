package petopia.com.kh.jsp.mypage.controller;

import java.io.File;
import java.io.IOException;
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
import petopia.com.kh.jsp.mypage.model.vo.WalkRecords;

/**
 * Servlet implementation class WalkUpdateController
 */
@WebServlet("/walkUpdate.my")
public class WalkUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("userInfo")==null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*10;
			
			String savePath = request.getServletContext().getRealPath("/resources/walk_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int walkNo = Integer.parseInt(multiRequest.getParameter("wno"));
			
			int petNo = Integer.parseInt(multiRequest.getParameter("petNo"));
			String walkTitle = multiRequest.getParameter("walkTitle");
			String walkContent = multiRequest.getParameter("walkContent");
			String walkDate = multiRequest.getParameter("walkDate");
			int walkFileNo = Integer.parseInt(multiRequest.getParameter("walkFileNo"));
			
			WalkRecords wr = new WalkRecords();
			wr.setWalkNo(walkNo);
			wr.setWalkTitle(walkTitle);
			wr.setWalkContent(walkContent);
			wr.setWalkDate(walkDate);
			wr.setPetNo(petNo);
			
			PetFile pf = null;
			
			if(multiRequest.getOriginalFileName("walkFile") != null) {
				pf = new PetFile();
				
				pf.setOriginalName(multiRequest.getOriginalFileName("walkFile"));
				pf.setUploadName(multiRequest.getFilesystemName("walkFile"));
				pf.setFilePath("resources/walk_upfiles");
				pf.setFileNo(walkFileNo);
			}
			
			int result = new PetService().updateWalk(wr, pf);
			
			System.out.println(wr);
			System.out.println(pf);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "산책기록 수정 성공");
				response.sendRedirect(request.getContextPath()+"/walkList.my?cpage=1");
			} else {
				// 첨푸파일을 넣었지만 insert 실패했을때
				if(pf != null) {
					new File(savePath + pf.getUploadName()).delete();
				}
				request.setAttribute("errorMsg", "산책기록 수정 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
