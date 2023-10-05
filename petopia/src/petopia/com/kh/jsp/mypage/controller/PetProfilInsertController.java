package petopia.com.kh.jsp.mypage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.sun.xml.internal.ws.api.message.Attachment;

import petopia.com.kh.jsp.board.model.service.BoardService;
import petopia.com.kh.jsp.common.MyFileRenamePolicy;
import petopia.com.kh.jsp.mypage.model.vo.Pet;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PetProfilInsertController
 */
@WebServlet("/petInsert.my")
public class PetProfilInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetProfilInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			String savePath = application.getRealPath("/resources/board_upfiles/");
			
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// -------------------------- 파일 업로드 작업 끝 --------------------------
			
			// 값뽑기 => 카테고리번호, 제목, 내용, 회원번호
			String petName = multiRequest.getParameter("catpetNameegory");
			String petSpecies = multiRequest.getParameter("petSpecies");
			String petSpecific = multiRequest.getParameter("petSpecific");
			int petWeight = Integer.parseInt(multiRequest.getParameter("petWeight"));
			String petGender = multiRequest.getParameter("petGender");
			String petPersonality = multiRequest.getParameter("petPersonality");
			String petEtc = multiRequest.getParameter("petEtc");
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			
			
			// vo객체로 가공
			Pet p = new Pet();
			p.setPetName(petName);
			p.setPetSpecies(petSpecies);
			p.setPetSpecific(petSpecific);
			p.setPetWeight(petWeight);
			p.setPetGender(petGender);
			p.setPetPersonality(petPersonality);
			p.setPetEtc(petEtc);
			p.setUserNo(userNo);

			// 두번째 INSERT => 선택적(첨부파일이 존재할때만 INSERT)
			Attachment at = null;
			
			// 첨부파일의 유무 파악
			// multirequest.getOriginalFileName("키값");
			// 첨부파일이 존재한다면 "원본파일명" 반환 / 첨부파일이 존재하지 않는다면 null값 반환
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				// 첨부파일이 있다 => vo 객체로 가공
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				
				// 파일경로
				at.setFilePath("resources/board_upfiles");
				
				// 수정된 파일명
				// multiReqeust.getFilesystemName("키값");
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
			}
			
			// 서비스요청
			int result = new BoardService().insertBoard(b, at);
			
			if(result>0) { // 성공시 일반게시글 목록
				request.getSession().setAttribute("alertMsg", "게시글 등록 성공");
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
			} else { // 실패
				// 첨부파일이 있었는데 Table에 INSERT를 실패
				// => 이미 가지고 있는 파일을 삭제해야함
				if(at != null) {
					// delete()호출
					new File(savePath + at.getChangeName()).delete();
				}
				request.setAttribute("errorMsg", "게시글 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
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
