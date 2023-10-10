package petopia.com.kh.jsp.match.model.dao;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.match.model.vo.Match;

public class MatchDao {

	private Properties prop = new Properties();
	
	public MatchDao() {
		String filePath = MatchDao.class.getResource("/sql/match/match-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	public int insertThumbnailBoard(Connection conn, Match m) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertThumbnailBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMeetBoardTitle());
			pstmt.setString(2, m.getPetInfo());
			pstmt.setString(3, m.getHopeActivity());
			pstmt.setString(4, (m.getUserNo()));
			pstmt.setString(5, (m.getPetNo()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertFileList(Connection conn, ArrayList<File> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFileList");
		
		try {
			
			for(File fi : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, fi.getOriginalName());
				pstmt.setString(2, fi.getUploadName());
				pstmt.setString(3, fi.getFilePath());
				pstmt.setInt(4, fi.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list.size() == result ? 1 : 0;
	}
	
}
