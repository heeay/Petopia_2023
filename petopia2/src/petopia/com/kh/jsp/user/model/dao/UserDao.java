package petopia.com.kh.jsp.user.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.user.model.vo.User;

public class UserDao {
	
	public User loginUser(SqlSession sqlSession, User u) {
		return sqlSession.selectOne("userMapper.loginUser", u);
	}
	public User reloadUser(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("userMapper.reloadUser", userNo);
	}
	
	public int insertUser(SqlSession sqlSession, User user) {
		return sqlSession.insert("userMapper.insertUser", user);
	}
	public int insertUserAndProfile(SqlSession sqlSession, User user) {
		return sqlSession.insert("userMapper.insertUserAndProfile", user);
	}
	
	public String checkUserNo(SqlSession sqlSession, int userNo) {
		return sqlSession.selectOne("userMapper.checkUserNo", userNo);
	}
	public int checkUserEmail(SqlSession sqlSession, String userEmail) {
		return sqlSession.selectOne("userMapper.checkUserEmail", userEmail);
	}
	public int checkUserNickname(SqlSession sqlSession, User user) {
		return sqlSession.selectOne("userMapper.checkUserNickname", user);
	}
	public int selectUserNo(SqlSession sqlSession, String userEmail) {
		return sqlSession.selectOne("userMapper.selectUserNo", userEmail);
	}
	/*
	public boolean checkUserNickname(SqlSession sqlSession, String nickname, int userNo) {
		return sqlSession.selectOne("userMapper.checkUserNickname", nickname);
	}*/
	
	public int updateEmailAuth(SqlSession sqlSession, HashMap map){
		return sqlSession.update("userMapper.updateEmailAuth", map);
	}
	public int insertEmailAuth(SqlSession sqlSession, HashMap map){
		return sqlSession.insert("userMapper.insertEmailAuth", map);
	}
	public java.util.Date selectEmailAuth(SqlSession sqlSession, HashMap map) {
		System.out.println(map.get("emailAuthCode"));
		System.out.println(map.get("emailAuthEmail"));
		java.util.Date date = sqlSession.selectOne("userMapper.selectEmailAuth", map);
		System.out.println(date);
		return date;
	}
	public java.util.Date selectToken(SqlSession sqlSession, String token) {
		return sqlSession.selectOne("userMapper.selectToken", token);
	}
	public int deleteEmailAuth(SqlSession sqlSession, String email) {
		return sqlSession.delete("userMapper.deleteEmailAuth", email);
	}
	
	public User loginSimpleAuth(SqlSession sqlSession, User u) {
		return sqlSession.selectOne("userMapper.loginSimpleAuth", u);
	}
	public int insertKakaoUser(SqlSession sqlSession, User user) {
		return sqlSession.insert("userMapper.insertKakaoUser", user);
	}
	public int insertKakaoUserAndProfile(SqlSession sqlSession, User user) {
		return sqlSession.insert("userMapper.insertKakaoUserAndProfile", user);
	}
	
	public int insertOAuthProfile(SqlSession sqlSession, PetFile pf) {
		return sqlSession.insert("userMapper.insertOAuthProfile", pf);
	}
	public int currProfileNo(SqlSession sqlSession) {
		return sqlSession.selectOne("userMapper.currProfileNo");
	}
	
	public int updateUserPw(SqlSession sqlSession, User user) {
		return sqlSession.update("userMapper.updateUserPw", user);
	}
	
	public int updateUserInfo(SqlSession sqlSession, User u) {
		return sqlSession.update("userMapper.updateUserInfo", u);
	}
	public int deleteUser(SqlSession sqlSession, int userNo) {
		return sqlSession.delete("userMapper.deleteUser", userNo);
	}
	
	public int deleteOAuthUser(SqlSession sqlSession, int userNo) {
		return sqlSession.delete("userMapper.deleteOAuthUser", userNo);
	}
}
