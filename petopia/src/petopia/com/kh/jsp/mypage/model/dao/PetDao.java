package petopia.com.kh.jsp.mypage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petopia.com.kh.jsp.mypage.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.user.model.vo.User;

import static petopia.com.kh.jsp.common.JDBCTemplate.*;

public class PetDao {
	
	private Properties prop = new Properties();
	public PetDao() {
		String filePath = PetDao.class.getResource("/sql/mypage/mypage-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Pet> selectPetList(Connection conn, User loginUser) {
		ArrayList<Pet> list = new ArrayList<Pet>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPetList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Pet p = new Pet();
				p.setPetNo(rset.getInt("PET_NO"));
				p.setPetName(rset.getString("PET_NAME"));
				p.setPetSpecies(rset.getString("PET_SPECIES"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertPet(Connection conn, Pet p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPet");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getPetName());
			pstmt.setString(2, p.getPetSpecies());
			pstmt.setString(3, p.getPetSpecific());
			pstmt.setInt(4, p.getPetWeight());
			pstmt.setString(5, p.getPetGender());
			pstmt.setString(6, p.getPetPersonality());
			pstmt.setString(7, p.getPetEtc());
			pstmt.setInt(8, p.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int insertPetImg(Connection conn, PetFile pt) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPetImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pt.getOriginalName());
			pstmt.setString(2, pt.getUploadName());
			pstmt.setString(3, pt.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	

	

}
