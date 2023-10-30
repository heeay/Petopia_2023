package petopia.com.kh.jsp.info.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoService;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoFile;

/**
 * Servlet implementation class ShareUpdateFormController
 */
@WebServlet("/updateForm.in")
public class ShareUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		ArrayList<InfoCategory> ctgList = new InfoService().selectInfoCategory();
		
		int infoNo = Integer.parseInt(request.getParameter("ino"));
		
		Info in = new InfoService().selectShare(infoNo);
		
		ArrayList<InfoFile> fileList = new InfoService().selectInfoFileList(infoNo);
		
		request.setAttribute("ctgList", ctgList);
		request.setAttribute("in", in);
		request.setAttribute("fileList", fileList);
		
		request.getRequestDispatcher("views/info/shareUpdateForm.jsp").forward(request, response);
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
