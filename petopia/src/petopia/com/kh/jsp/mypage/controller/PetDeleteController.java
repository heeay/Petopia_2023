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
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;

/**
 * Servlet implementation class PetDeleteController
 */
@WebServlet("/deletePet.my")
public class PetDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetDeleteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
			
		int petNo = Integer.parseInt(request.getParameter("pno"));
		//int petFileNo = Integer.parseInt(multiRequest.getParameter("petFileNo"));
			
		// ON DELETE CASCADE사용으로 부모테이블 삭제 시 자식테이블도 자동 삭제 => 파일도 자동 삭제
		int result = new PetService().petDelete(petNo);
			
		if(result>0) {
			request.getSession().setAttribute("alertMsg", "프로필 삭제 성공");
			response.sendRedirect(request.getContextPath()+"/pet.my?cpage=1");
		} else {
		request.setAttribute("errorMsg", "프로필 삭제 실패");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
