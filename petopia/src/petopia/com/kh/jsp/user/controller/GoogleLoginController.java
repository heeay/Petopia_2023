package petopia.com.kh.jsp.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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
		String code = request.getParameter("code");
		String clientId = "572625010116-htnd5pcq61kgorbli1cv0q5d724a7f5k.apps.googleusercontent.com";
		String clientSecret = "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";
		String redirectURI = URLEncoder.encode("http://localhost:8001/petopia/googleLogin","UTF-8");
		String apiURL = "https://oauth2.googleapis.com/token";
		
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("code", code);
		params.put("client_id", clientId);
		params.put("client_secret", clientSecret);
		params.put("redirect_uri", redirectURI);
		params.put("grant_type", "authorization_code");
		
		StringBuilder postData = new StringBuilder();
        for(Map.Entry<String,Object> param : params.entrySet()) {
            if(postData.length() != 0) postData.append('&');
            postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
            postData.append('=');
            postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
        }
        byte[] postDataBytes = postData.toString().getBytes("UTF-8");
		
		String access_token = "";
		String id_token = "";
		System.out.println();
		System.out.println("apiURL="+apiURL);
		
		try {
			URL url = new URL(apiURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
	        conn.setDoOutput(true);
	        conn.getOutputStream().write(postDataBytes);
			int responseCode = conn.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode="+responseCode);
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
				System.out.println("===========인증토큰===========");
				System.out.println(res.toString());
				JSONParser parser = new JSONParser();
				JSONObject jObj = (JSONObject)parser.parse(res.toString());
				access_token = (String)jObj.get("access_token");
				id_token = (String)jObj.get("id_token");
				System.out.println(access_token);
				System.out.println(id_token);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
