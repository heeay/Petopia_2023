package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;

/**
 * Servlet implementation class ShareEnrollFormController
 */
@WebServlet("/insertForm.in") // 글쓰기를 클릭하면 오는 화면
public class ShareEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareEnrollFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인포서비스의 selectInfoCategory메소드 호출해서 받아온 값을 InfoCategory만 담을 수 있는 ArrayList인 list에 담음
		// 게시글 작성 폼의 카테고리 리스트를 채울 list
		ArrayList<InfoCategory> list = new InfoService().selectInfoCategory();
		
		request.setAttribute("list", list);
		
		// list를 shareEnrollForm으로 보냄
		request.getRequestDispatcher("views/info/shareEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
