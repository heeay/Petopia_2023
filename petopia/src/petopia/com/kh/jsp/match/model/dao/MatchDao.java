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
import petopia.com.kh.jsp.mypage.model.vo.Pet;

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
			pstmt.setInt(4, (m.getUserNo()));
			pstmt.setInt(5, (m.getPetNo()));
			
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
		} finally {
			close(pstmt);
		}
		
		return list.size() == result ? 1 : 0;
	}
	
	public ArrayList<Pet> selectPetInfo(Connection conn) {
		
		ArrayList<Pet> list = new ArrayList();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPetInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Pet p = new Pet();
				p.setPetNo(rset.getInt("PET_NO"));
				p.setPetName(rset.getString("PET_NAME"));
				p.setPetSpecies(rset.getString("PET_SPECIES"));
				p.setPetGender(rset.getString("PET_GENDER"));
				p.setUserNo(rset.getInt("USER_NO"));

				list.add(p);
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
		
	}
	
	
	public ArrayList<Match> selectMainList(Connection conn) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Match> list = new ArrayList();
		String sql = prop.getProperty("selectMainList");
	
		try {
			
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Match m = new Match();
				m.setMeetBoardNo(rset.getInt("MEET_BOARD_NO"));
				m.setMeetBoardTitle(rset.getString("MEET_BOARD_TITLE"));
				m.setPetInfo(rset.getString("PET_INFO"));
				m.setHopeActivity(rset.getString("HOPE_ACTIVITY"));
				m.setUserNickname(rset.getString("USER_NICKNAME"));
				m.setPetNo(rset.getInt("PET_NO"));
				m.setMeetBoardViews(rset.getInt("MEET_BOARD_VIEWS"));
			    m.setTitleImg(rset.getString("FILE_PATH"));
			
		    
				list.add(m);
			
		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		} 
		return list;
		
		
	}
		
	
	
	
	
}









