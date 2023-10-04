package petopia.com.kh.jsp.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import petopia.com.kh.jsp.common.JDBCTemplate;
import petopia.com.kh.jsp.user.model.vo.User;

public class UserDao {
	
	Properties prop = new Properties();
	
	public UserDao() {
		String filePath = UserDao.class.getResource("/sql/user/user-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public User loginUser(Connection conn, User u) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserEmail());
			pstmt.setString(2, u.getUserPass());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new User();
				user.setUserNo(rset.getInt("USER_NO"));
				user.setUserEmail(rset.getString("USER_EMAIL"));
				user.setUserPass(rset.getString("USER_PASS"));
				user.setUserNickname(rset.getString("USER_NICKNAME"));
				user.setUserPhone(rset.getString("USER_PHONE"));
				user.setRoleId(rset.getString("ROLE_NAME"));
				user.setUserCreateDate(rset.getDate("USER_CREATE_DATE"));
				user.setUserUpdateDate(rset.getDate("USER_UPDATE_DATE"));
				user.setUserEnableState(rset.getString("USER_ENABLE_STATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return user;
	}
	
	public int insertUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserEmail());
			pstmt.setString(2, user.getUserPass());
			pstmt.setString(3, user.getUserNickname());
			pstmt.setString(4, user.getUserPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
}
