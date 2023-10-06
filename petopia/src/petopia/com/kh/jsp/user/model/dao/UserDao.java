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
				user.setUserMethod(rset.getInt("USER_METHOD"));
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
			pstmt.setInt(1, user.getUserMethod());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserPass());
			pstmt.setString(4, user.getUserNickname());
			pstmt.setString(5, user.getUserPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public boolean checkUserEmail(Connection conn, String email) {
		boolean isThere = true;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkUserEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			isThere = rset.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return isThere;
	}
	public boolean checkUserNickname(Connection conn, String nickname) {
		boolean isThere = true;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkUserNickname");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rset = pstmt.executeQuery();
			isThere = rset.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return isThere;
	}
	
	public int updateEmailAuth(Connection conn, String toEmail, String cNumber){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEmailAuth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cNumber);
			pstmt.setString(2, toEmail);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public int insertEmailAuth(Connection conn, String toEmail, String cNumber){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEmailAuth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, toEmail);
			pstmt.setString(2, cNumber);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public boolean selectEmailAuth(Connection conn, String email, String authCode) {
		boolean isThere = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEmailAuth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, authCode);
			
			rset = pstmt.executeQuery();
			isThere = rset.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return isThere;
	}
	public int deleteEmailAuth(Connection conn, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteEmailAuth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public User loginSimpleAuth(Connection conn, User u) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginSimpleAuth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserEmail());
			pstmt.setString(2, u.getUserPass());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new User();
				user.setUserNo(rset.getInt("USER_NO"));
				user.setUserMethod(rset.getInt("USER_METHOD"));
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
}
