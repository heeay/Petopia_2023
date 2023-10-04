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
}
