package petopia.com.kh.jsp.user.model.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.common.template.Template;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.user.model.dao.UserDao;
import petopia.com.kh.jsp.user.model.vo.User;

public class UserServiceImpl implements UserService {
private UserDao userDao = new UserDao();
	
	public User loginUser(User u) {
		SqlSession sqlSession = Template.getSqlSession();
		
		User user = userDao.loginUser(sqlSession, u);
		sqlSession.close();
		
		return user;
	}
	public User reloadUser(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		User user = userDao.reloadUser(sqlSession, userNo);
		sqlSession.close();
		
		return user;
	}
	public int insertUser(User user) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = userDao.insertUser(sqlSession, user);
		
		if(result > 0)
			sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}
	
	public String checkUserNo(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		
		String userEmail = userDao.checkUserNo(sqlSession, userNo);
		sqlSession.close();
		
		return userEmail;
	}
	public int checkUserEmail(String email) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int userNo = new UserDao().checkUserEmail(sqlSession, email);
		sqlSession.close();
		
		return userNo;
	}
	public int checkUserNickname(User user) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = userDao.checkUserNickname(sqlSession, user);
		
		if(result > 0)
			sqlSession.commit();
		sqlSession.close();
		
		return result;
	}
	public int selectUserNo(String email) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int userNo = new UserDao().selectUserNo(sqlSession, email);
		sqlSession.close();
		
		return userNo;
	}
	public int insertEmailAuth(HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result=userDao.updateEmailAuth(sqlSession, map);
		
		if(result==0) {
			result=userDao.insertEmailAuth(sqlSession, map);
		}
		
		if(result > 0)
			sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}
	public java.util.Date selectEmailAuth(HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		
		java.util.Date date = userDao.selectEmailAuth(sqlSession, map);
		if(date!=null)
			if(new UserDao().deleteEmailAuth(sqlSession, map.get("email"))>0)
				sqlSession.commit();
		
		sqlSession.close();
		
		return date;
	}
	public java.util.Date selectToken(String token) {
		SqlSession sqlSession = Template.getSqlSession();
		
		java.util.Date date = userDao.selectToken(sqlSession, token);
		
		sqlSession.close();
		
		return date;
	}
	
	public User simpleAuth(User u) {
		SqlSession sqlSession = Template.getSqlSession();
		
		User user = userDao.loginSimpleAuth(sqlSession, u);
		if(user == null) {
			String profile = u.getFileMypageNo();
			if(profile==null) {
				if(userDao.insertUser(sqlSession, u)>0) {
					sqlSession.commit();
					user = userDao.loginSimpleAuth(sqlSession, u);
				}
			} else {
				PetFile pf = new PetFile();
				int index = profile.lastIndexOf("/");
				pf.setFilePath(profile.substring(0, index));
				pf.setUploadName(profile.substring(index+1));
				u.setFileMypageNo(String.valueOf(new UserServiceImpl().insertOAuthProfile(pf)));
				
				if(userDao.insertUserAndProfile(sqlSession, u)>0) {
					sqlSession.commit();
					user = userDao.loginSimpleAuth(sqlSession, u);
				}
			}
		}
		sqlSession.close();
		
		return user;
	}
	public User simpleKakaoAuth(User u) {
		SqlSession sqlSession = Template.getSqlSession();
		
		User user = userDao.loginSimpleAuth(sqlSession, u);
		if(user == null) {
			String profile = u.getFileMypageNo();
			if(profile==null) {
				if(userDao.insertKakaoUser(sqlSession, u)>0) {
					sqlSession.commit();
					user = userDao.loginSimpleAuth(sqlSession, u);
				}
			} else {
				PetFile pf = new PetFile();
				int index = profile.lastIndexOf("/");
				pf.setFilePath(profile.substring(0, index));
				pf.setUploadName(profile.substring(index+1));
				u.setFileMypageNo(String.valueOf(new UserServiceImpl().insertOAuthProfile(pf)));
				
				if(userDao.insertKakaoUserAndProfile(sqlSession, u)>0) {
					sqlSession.commit();
					user = userDao.loginSimpleAuth(sqlSession, u);
				}
			}
		}
		
		sqlSession.close();
		
		return user;
	}
	public int insertOAuthProfile(PetFile pf) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = new UserDao().insertOAuthProfile(sqlSession, pf);
		int fileNo = 0;
		if(result>0) {
			sqlSession.commit();
			fileNo = userDao.currProfileNo(sqlSession);
		}
		sqlSession.close();
		return fileNo;
	}
	
	public int updateUserPw(User user) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = userDao.updateUserPw(sqlSession, user);
		if(result>0)
			sqlSession.commit();
		
		sqlSession.close();
		
		return result;
	}
	
	public int updateUserInfo(User u) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = userDao.updateUserInfo(sqlSession, u);
		if(result>0)
			sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int deleteUser(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = userDao.deleteUser(sqlSession, userNo);
		if(result>0)
			sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int deleteOAuthUser(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = userDao.deleteOAuthUser(sqlSession, userNo);
		if(result>0)
			sqlSession.commit();
		sqlSession.close();
		return result;
	}
}
