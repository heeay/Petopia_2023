package petopia.com.kh.jsp.mypage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import petopia.com.kh.jsp.common.MyFileRenamePolicy;
import petopia.com.kh.jsp.mypage.model.service.PetService;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class UserProfilController
 */
@WebServlet(description = "/userProfil.my", urlPatterns = { "/userProfil.my" })
public class UserProfilController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfilController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User loginUser = ((User)session.getAttribute("userInfo"));
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String savePath = request.getServletContext().getRealPath("/resources/user_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			PetFile pt = null;
			
			if(multiRequest.getOriginalFileName("userProfil") != null) {
				pt = new PetFile();
				
				pt.setOriginalName(multiRequest.getOriginalFileName("userProfil"));
				pt.setUploadName(multiRequest.getFilesystemName("userProfil"));
				pt.setFilePath("resources/user_upfiles");
			}
			
			int result1 = new PetService().insertUserProfil(pt);
			int result2 = new PetService().updateUserProfil(loginUser);
			
			if(result1*result2>0) {
				request.getSession().setAttribute("alertMsg", "유저프로필 등록 성공");
				response.sendRedirect(request.getContextPath()+"/pet.my?cpage=1");
			}else {
				// 첨푸파일을 넣었지만 insert 실패했을때
				if(pt != null) {
					new File(savePath + pt.getUploadName()).delete();
				}
				request.setAttribute("errorMsg", "프로필 등록 실패");
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
