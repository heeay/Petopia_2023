package petopia.com.kh.jsp.user.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginFormController
 */
@WebServlet("/login")
public class LoginFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("userInfo") == null) {
			//네이버로그인
			String clientId = "8ZYnqypIAIHZc2Ycz4px";//애플리케이션 클라이언트 아이디값";
        	String redirectURI = URLEncoder.encode("http://localhost/petopia/naverLogin", "UTF-8");
        	SecureRandom random = new SecureRandom();
        	String state = new BigInteger(130, random).toString();
        	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        	apiURL += "&client_id=" + clientId;
        	apiURL += "&redirect_uri=" + redirectURI;
        	apiURL += "&state=" + state;
			request.setAttribute("apiURL", apiURL);
        	request.getSession().setAttribute("state", state);

			String cookieEmail = "";
			Cookie[] cookies = request.getCookies();
			if(cookies!=null){
				for(int i=0;i<cookies.length;i++){
					if(cookies[i].getName().equals("rememberEmail")){
						cookieEmail = cookies[i].getValue();
					}
				}
			}
			request.setAttribute("cookieEmail",cookieEmail);
			request.getRequestDispatcher("views/user/loginView.jsp").forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
