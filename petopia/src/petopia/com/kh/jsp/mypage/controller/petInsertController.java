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
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;

/**
 * Servlet implementation class petInsertController
 */
@WebServlet("/petInsert.my")
public class petInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public petInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024*1024*10;
			
			// 펫프로필 등록 시 올라갈 파일경로
			String savePath = request.getServletContext().getRealPath("/resources/pet_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			String petName = multiRequest.getParameter("petName");
			String petSpecies = multiRequest.getParameter("petSpecies");
			String petSpecific = multiRequest.getParameter("petSpecific");
			int petWeight = Integer.parseInt(multiRequest.getParameter("petWeight"));
			String petGender = multiRequest.getParameter("petGender");
			String petPersonality = multiRequest.getParameter("petPersonality");
			String petEtc = multiRequest.getParameter("petEtc");
			
			Pet p = new Pet();
			p.setPetName(petName);
			p.setPetSpecies(petSpecies);
			p.setPetSpecific(petSpecific);
			p.setPetWeight(petWeight);
			p.setPetGender(petGender);
			p.setPetPersonality(petPersonality);
			p.setPetEtc(petEtc);
			p.setUserNo(userNo);
			
			// 파일이 있을수도 없을수도
			PetFile pt = null;
			
			if(multiRequest.getOriginalFileName("petImgFile") != null) {
				pt = new PetFile();
				
				pt.setOriginalName(multiRequest.getOriginalFileName("petImgFile"));
				pt.setUploadName(multiRequest.getFilesystemName("petImgFile"));
				pt.setFilePath("resources/pet_upfiles");
			}
			
			new PetService().insertPetProfil(p, pt);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
