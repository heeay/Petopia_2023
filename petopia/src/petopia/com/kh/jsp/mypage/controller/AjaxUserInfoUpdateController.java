package petopia.com.kh.jsp.mypage.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import petopia.com.kh.jsp.user.model.service.UserService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class UserInfoUpdateController
 */
@WebServlet("/mypage.userUpdate")
public class AjaxUserInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUserInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int userNo = ((User)request.getSession().getAttribute("userInfo")).getUserNo();
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		
		User u = new User();
		u.setUserNo(userNo);
		u.setUserNickname(nickname);
		u.setUserPhone(phone);
		int result = new UserService().updateUserInfo(u);
		User user = new UserService().reloadUser(userNo);
		if(result>0) {
			request.getSession().setAttribute("userInfo", user);
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("code", String.valueOf(result));
		map.put("nickname", user.getUserNickname());
		map.put("phone", user.getUserPhone());
		JSONObject jObject = new JSONObject(map);
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObject);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
