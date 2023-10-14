package petopia.com.kh.jsp.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.user.model.service.UserService;
import petopia.com.kh.jsp.user.model.vo.User;

/**
 * Servlet implementation class NaverLoginController
 */
@WebServlet("/naverLogin")
public class NaverLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NaverLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		//System.out.println(request.getParameter("code"));
		//System.out.println(request.getParameter("state"));
		String clientId = "8ZYnqypIAIHZc2Ycz4px";
		String clientSecret = "wd7mxCBxd2";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost/petopia/naverLogin","UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		//System.out.println();
		//System.out.println("apiURL="+apiURL);

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			//System.out.println("responseCode="+responseCode);
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if(responseCode==200) {
				//System.out.println("===========인증토큰===========");
				//System.out.println(res.toString());
				JSONParser parser = new JSONParser();
				JSONObject jObj = (JSONObject)parser.parse(res.toString());
				access_token = (String)jObj.get("access_token");
				refresh_token = (String)jObj.get("refresh_token");
				//System.out.println(access_token);
				//System.out.println(refresh_token);
			} else {
				System.out.println(res.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(!access_token.isEmpty()) {
			String header = "Bearer "+access_token;
			apiURL = "https://openapi.naver.com/v1/nid/me";

			Map<String, String> requestHeaders = new HashMap<>();
			requestHeaders.put("Authorization", header);
			String responseBody = get(apiURL,requestHeaders);
			String id = "";
			String email = "";
			String nickname = "";
			String phone = "";
			String profile = "";
			//System.out.println();
			//System.out.println("===========유저프로필===========");
			//System.out.println(responseBody);
			try {
				JSONParser parser = new JSONParser();
				JSONObject jObj = (JSONObject)parser.parse(responseBody);
				JSONObject responseJObj = (JSONObject) jObj.get("response");
				id = (String)responseJObj.get("id");
				email = (String)responseJObj.get("email");
				nickname = (String)responseJObj.get("nickname");
				phone = (String)responseJObj.get("mobile");
				profile = (String)responseJObj.get("profile_image");
				//System.out.println(id);
				//System.out.println(email);
				//System.out.println(nickname);
				//System.out.println(phone);
				//System.out.println(profile);
			} catch (ParseException e) {
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
			u.setUserMethod(1);
			u.setUserEmail(email);
			u.setUserPass(id);
			u.setUserNickname(nickname);
			u.setUserPhone(phone);
			u.setFileMypageNo(profile);
			
			User user = new UserService().simpleAuth(u);
			
			if(user == null) {
				request.setAttribute("errorMsg", "간편 로그인 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} else {
				request.getSession().setAttribute("userInfo", user);
				response.sendRedirect(request.getContextPath());
			}
		} else {
			request.setAttribute("errorMsg", "인증토큰 생성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders){
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}


			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl){
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body){
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
