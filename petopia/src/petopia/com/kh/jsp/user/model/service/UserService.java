package petopia.com.kh.jsp.user.model.service;

import java.sql.Connection;

import petopia.com.kh.jsp.common.JDBCTemplate;
import petopia.com.kh.jsp.user.model.dao.UserDao;
import petopia.com.kh.jsp.user.model.vo.User;

public class UserService {
	public User loginUser(User u) {
		Connection conn = JDBCTemplate.getConnection();
		
		User user = new UserDao().loginUser(conn, u);
		JDBCTemplate.close(conn);
		
		return user;
	}
	public User reloadUser(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		User user = new UserDao().reloadUser(conn, userNo);
		JDBCTemplate.close(conn);
		
		return user;
	}
	public int insertUser(User user) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().insertUser(conn, user);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public String checkUserNo(int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		String userEmail = new UserDao().checkUserNo(conn, userNo);
		JDBCTemplate.close(conn);
		
		return userEmail;
	}
	public int checkUserEmail(String email) {
		Connection conn = JDBCTemplate.getConnection();
		
		int userNo = new UserDao().checkUserEmail(conn, email);
		JDBCTemplate.close(conn);
		
		return userNo;
	}
	public boolean checkUserNickname(String nickname, int userNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		boolean isThere = true;
		System.out.println(userNo);
		if(userNo==0) {
			isThere = new UserDao().checkUserNickname(conn, nickname);
		} else {
			isThere = new UserDao().checkUserNickname(conn, nickname, userNo);
		}
		JDBCTemplate.close(conn);
		
		return isThere;
	}
	public int insertEmailAuth(String toEmail, String cNumber) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result=new UserDao().updateEmailAuth(conn, toEmail, cNumber);
		
		if(result==0) {
			result=new UserDao().insertEmailAuth(conn, toEmail, cNumber);
		}
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	public boolean selectEmailAuth(String email, String authCode) {
		Connection conn = JDBCTemplate.getConnection();
		
		boolean result = new UserDao().selectEmailAuth(conn, email, authCode);
		if(result) {
			if(new UserDao().deleteEmailAuth(conn, email)>0){
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	public boolean selectToken(String token) {
		Connection conn = JDBCTemplate.getConnection();
		
		boolean result = new UserDao().selectToken(conn, token);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public User simpleAuth(User u) {
		Connection conn = JDBCTemplate.getConnection();
		
		User user = new UserDao().loginSimpleAuth(conn, u);
		if(user == null) {
			if(new UserDao().insertUser(conn, u)>0) {
				JDBCTemplate.commit(conn);
				user = new UserDao().loginSimpleAuth(conn, u);
			} else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		JDBCTemplate.close(conn);
		
		return user;
	}
	public User simpleKakaoAuth(User u) {
		Connection conn = JDBCTemplate.getConnection();
		
		User user = new UserDao().loginSimpleAuth(conn, u);
		if(user == null) {
			if(new UserDao().insertKakaoUser(conn, u)>0) {
				JDBCTemplate.commit(conn);
				user = new UserDao().loginSimpleAuth(conn, u);
			} else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		JDBCTemplate.close(conn);
		
		return user;
	}
	
	public int updateUserPw(User user) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().updateUserPw(conn, user);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int updateUserInfo(User u) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().updateUserInfo(conn, u);
		if(result>0)
			JDBCTemplate.commit(conn);
		else
			JDBCTemplate.rollback(conn);
		JDBCTemplate.close(conn);
		return result;
	}
}
