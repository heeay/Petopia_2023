package petopia.com.kh.jsp.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import petopia.com.kh.jsp.common.JDBCTemplate;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
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
				user.setFileMypageNo(rset.getString("PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return user;
	}
	public User reloadUser(Connection conn, int userNo) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reloadUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
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
				user.setFileMypageNo(rset.getString("PATH"));
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
	public int insertUserAndProfile(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUserAndProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserMethod());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserPass());
			pstmt.setString(4, user.getUserNickname());
			pstmt.setString(5, user.getUserPhone());
			pstmt.setInt(6, Integer.parseInt(user.getFileMypageNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public String checkUserNo(Connection conn, int userNo) {
		String userEmail = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkUserNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				userEmail = rset.getString("USER_EMAIL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return userEmail;
	}
	public int checkUserEmail(Connection conn, String email) {
		int userNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkUserEmail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				userNo = rset.getInt("USER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return userNo;
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
	public boolean checkUserNickname(Connection conn, String nickname, int userNo) {
		boolean isThere = true;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkUserNicknameUserNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setInt(2, userNo);
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
	public java.util.Date selectEmailAuth(Connection conn, String email, String authCode) {
		java.util.Date date = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectEmailAuth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, authCode);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				date = rset.getTimestamp("EMAIL_AUTH_DATE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return date;
	}
	public boolean selectToken(Connection conn, String token) {
		boolean isThere = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectToken");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, token);
			
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
				user.setFileMypageNo(rset.getString("PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return user;
	}
	public int insertKakaoUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertKakaoUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserMethod());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserPass());
			pstmt.setString(4, "KakaoUser");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public int insertKakaoUserAndProfile(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertKakaoUserAndProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserMethod());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserPass());
			pstmt.setString(4, "KakaoUser");
			pstmt.setInt(5, Integer.parseInt(user.getFileMypageNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public int insertOAuthProfile(Connection conn, PetFile pf) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertOAuthProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pf.getUploadName());
			pstmt.setString(2, pf.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public int currProfileNo(Connection conn) {
		int fileNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("currProfileNo");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				fileNo = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return fileNo;
	}
	
	public int updateUserPw(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserPw");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserPass());
			pstmt.setInt(2, user.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updateUserInfo(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserNickname());
			pstmt.setString(2, u.getUserPhone());
			pstmt.setInt(3, u.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int deleteUser(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteOAuthUser(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteOAuthUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
