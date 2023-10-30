package petopia.com.kh.jsp.info.controller;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import petopia.com.kh.jsp.info.model.service.InfoServiceImpl;
import petopia.com.kh.jsp.user.model.vo.User;
/**
 * Servlet implementation class AjaxSelectUser
 */
@WebServlet("/selectUser.in")
public class AjaxSelectUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectUserController() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int infoNo = Integer.parseInt(request.getParameter("ino"));
        
        int userNo = 0;
        if((User)request.getSession().getAttribute("userInfo") != null) {
            userNo = ((User)request.getSession().getAttribute("userInfo")).getUserNo(); // 회원 번호
        }
        HashMap<String, Integer> map = new HashMap();
        map.put("infoNo", infoNo);
        map.put("userNo", userNo);
        
        // 해당 게시글의 LIKE_YN = 'Y'인 사람 == 1
        int result = new InfoServiceImpl().checkLike(map);
        
        // 응답 데이터에 한글이 있을 수 있으니까 그에 따른 UTF-8 인코딩 설정, text/html : 응답할 데이터 타입
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().print(result);
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}