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
 * Servlet implementation class petUpdateController
 */
@WebServlet("/petUpdate.my")
public class PetUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetUpdateController() {
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
			
			// 펫프로필 등록 시 올라갈 파일경로
			String savePath = request.getServletContext().getRealPath("/resources/pet_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int petNo = Integer.parseInt(multiRequest.getParameter("pno"));
			
			String petName = multiRequest.getParameter("petName");
			String petSpecies = multiRequest.getParameter("petSpecies");
			String petSpecific = multiRequest.getParameter("petSpecific");
			int petWeight = Integer.parseInt(multiRequest.getParameter("petWeight"));
			String petGender = multiRequest.getParameter("petGender");
			String petPersonality = multiRequest.getParameter("petPersonality");
			String petEtc = multiRequest.getParameter("petEtc");
			int petFileNo = Integer.parseInt(multiRequest.getParameter("petFileNo"));
			
			Pet p = new Pet();
			p.setPetNo(petNo);
			p.setPetName(petName);
			p.setPetSpecies(petSpecies);
			p.setPetSpecific(petSpecific);
			p.setPetWeight(petWeight);
			p.setPetGender(petGender);
			p.setPetPersonality(petPersonality);
			p.setPetEtc(petEtc);
			
			// 파일이 있을수도 없을수도
			PetFile pt = null;
			
			if(multiRequest.getOriginalFileName("petImgFile") != null) {
				pt = new PetFile();
				
				pt.setOriginalName(multiRequest.getOriginalFileName("petImgFile"));
				pt.setUploadName(multiRequest.getFilesystemName("petImgFile"));
				pt.setFilePath("resources/pet_upfiles");
				pt.setFileNo(petFileNo);
			}
			
			int result = new PetService().updatePetProfil(p, pt);
			
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "프로필 등록 성공");
				response.sendRedirect(request.getContextPath()+"/pet.my?cpage=1");
				return;
			} else {
				// 첨푸파일을 넣었지만 insert 실패했을때
				if(pt != null) {
					new File(savePath + pt.getUploadName()).delete();
				}
				
			}
			request.setAttribute("errorMsg", "프로필 등록 실패");
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
