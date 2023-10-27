package petopia.com.kh.jsp.user.model.service;

import java.util.HashMap;

import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.user.model.vo.User;

public interface UserService {
	public User loginUser(User u);
	public User reloadUser(int userNo);
	public int insertUser(User user);
	
	public String checkUserNo(int userNo);
	public int checkUserEmail(String email);
	public int checkUserNickname(User user);
	public int selectUserNo(String email);
	public int insertEmailAuth(HashMap<String, String> map);
	public java.util.Date selectEmailAuth(HashMap<String, String> map);
	public java.util.Date selectToken(String token);
	
	public User simpleAuth(User u);
	public User simpleKakaoAuth(User u);
	public int insertOAuthProfile(PetFile pf);
	
	public int updateUserPw(User user);
	
	public int updateUserInfo(User u);
	public int deleteUser(int userNo);
	public int deleteOAuthUser(int userNo);
}
