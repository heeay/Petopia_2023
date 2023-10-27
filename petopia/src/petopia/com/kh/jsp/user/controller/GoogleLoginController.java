package petopia.com.kh.jsp.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import petopia.com.kh.jsp.user.model.service.UserService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class GoogleLoginController
 */
@WebServlet("/googleLogin")
public class GoogleLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoogleLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://localhost:8001/petopia/googleLogin
		//?code=4%2F0AfJohXmXa9-cK3iUpwkjCJCk3Zrw8aQNee7E3G0bKrXnUsenizO_TQa_RXkIELiSClzsGA
		//&scope=email+profile+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile+openid
		//&authuser=0
		//&prompt=consent
		//String code = request.getParameter("code");
		//String clientId = "572625010116-htnd5pcq61kgorbli1cv0q5d724a7f5k.apps.googleusercontent.com";
		//String clientSecret = "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";
		//String redirectURI = URLEncoder.encode("http://localhost/petopia/google-callback","UTF-8");
		//String apiURL = "https://oauth2.googleapis.com/token";
		String access_token = request.getParameter("access_token");
		//String id_token = "";
		String apiURL = "https://www.googleapis.com/userinfo/v2/me?access_token="+access_token;
		/*
		Map<String,String> params = new HashMap<String, String>();
		params.put("code", code);
		params.put("client_id", clientId);
		params.put("client_secret", clientSecret);
		params.put("redirect_uri", redirectURI);
		params.put("grant_type", "authorization_code");

		JSONObject json = new JSONObject(params);

		String access_token = "";`
		String id_token = "";
		 */
		//System.out.println();
		//System.out.println("apiURL="+apiURL);
		//System.out.println(request.getRequestURI());
		String id = "";
		String email = "";
		String name = "";
		String picture = "";
		try {
			URL url = new URL(apiURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			//conn.setRequestMethod("POST");
			//conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; UTF-8");
			//conn.setRequestProperty("Content-Type", "application/json; utf-8");
			conn.setDoOutput(true);
			/*OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			osw.write(new Gson().toJson(json));
			osw.flush();
			osw.close();
			conn.connect();*/
			int responseCode = conn.getResponseCode();
			BufferedReader br;
			//System.out.println("responseCode="+responseCode);
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if(responseCode==200) {
				//System.out.println("===========유저프로필===========");
				//System.out.println(res.toString());
				JSONParser parser = new JSONParser();
				JSONObject jObj = (JSONObject)parser.parse(res.toString());
				id = (String)jObj.get("id");
				email = (String)jObj.get("email");
				name = (String)jObj.get("name");
				picture = (String)jObj.get("picture");
				//System.out.println(id);
				//System.out.println(email);
				//System.out.println(name);
				//System.out.println(picture);
			} else {
				System.out.println(res.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(id.getBytes());

			byte[] bytes = md.digest();
			StringBuilder builder = new StringBuilder();
			for(int i=0;i<bytes.length;i++) {
				builder.append(String.format("%02X", bytes[i]));
			}
			id = builder.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		User u = new User();
		u.setUserEmail(email);
		u.setUserPass(id);
		u.setUserNickname(name);
		u.setFileMypageNo(picture);
		u.setUserPhone("");
		u.setUserMethod(3);

		User user = new UserService().simpleAuth(u);
		if(user == null) {
			request.setAttribute("errorMsg", "간편 로그인 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			ServletContext application = request.getSession().getServletContext();
			
			if(application.getAttribute("accessCount")==null) {
				application.setAttribute("accessCount", 0);
			}
			int ac = (Integer)application.getAttribute("accessCount");
			application.setAttribute("accessCount", ++ac);
			
			request.getSession().setAttribute("userInfo", user);
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
