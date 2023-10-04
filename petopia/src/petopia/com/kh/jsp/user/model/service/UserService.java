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
	public boolean checkUserEmail(String email) {
		Connection conn = JDBCTemplate.getConnection();
		
		boolean isThere = new UserDao().checkUserEmail(conn, email);
		JDBCTemplate.close(conn);
		
		return isThere;
	}
}
