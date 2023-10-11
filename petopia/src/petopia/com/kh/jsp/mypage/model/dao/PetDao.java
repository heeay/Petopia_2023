package petopia.com.kh.jsp.mypage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petopia.com.kh.jsp.mypage.model.vo.HosRecords;
import petopia.com.kh.jsp.mypage.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.mypage.model.vo.Suggestion;
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
	public ArrayList<Pet> selectPetList(Connection conn, PageInfo pi, User loginUser) {
		ArrayList<Pet> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPetList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endrow = startRow+pi.getBoardLimit()-1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endrow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Pet p = new Pet();
				p.setPetNo(rset.getInt("PET_NO"));
				p.setPetName(rset.getString("PET_NAME"));
				p.setPetSpecies(rset.getString("PET_SPECIES"));
				p.setFileNo(rset.getInt("FILE_MYPAGE_NO"));
				p.setRowNum(rset.getInt("IND"));
				
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
	public int selectPetListCount(Connection conn, User loginUser) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPetListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	public Pet selectPetProfil(Connection conn, int petNo) {
		Pet p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPetProfil");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1,  petNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Pet();
				p.setPetNo(rset.getInt("PET_NO"));
				p.setPetName(rset.getString("PET_NAME"));
				p.setPetSpecies(rset.getString("PET_SPECIES"));
				p.setPetSpecific(rset.getString("PET_SPECIFIC"));
				p.setPetWeight(rset.getInt("PET_WEIGHT"));
				p.setPetGender(rset.getString("PET_GENDER"));
				p.setPetPersonality(rset.getString("PET_PERSONALITY"));
				p.setPetEtc(rset.getString("PET_ETC"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	public PetFile selectPetFile(Connection conn, int petNo) {
		PetFile pt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPetFile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, petNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pt = new PetFile();
				pt.setFileNo(rset.getInt("FILE_MYPAGE_NO"));
				pt.setOriginalName(rset.getString("ORIGINAL_NAME"));
				pt.setUploadName(rset.getString("UPLOAD_NAME"));
				pt.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pt;
	}
	public int updatePetImg(Connection conn, PetFile pt) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePetImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pt.getOriginalName());
			pstmt.setString(2, pt.getUploadName());
			pstmt.setString(3, pt.getFilePath());
			pstmt.setInt(4, pt.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePet(Connection conn, Pet p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePet");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getPetName());
			pstmt.setString(2, p.getPetSpecies());
			pstmt.setString(3, p.getPetSpecific());
			pstmt.setInt(4, p.getPetWeight());
			pstmt.setString(5, p.getPetGender());
			pstmt.setString(6, p.getPetPersonality());
			pstmt.setString(7, p.getPetEtc());
			pstmt.setInt(8, p.getPetNo());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int petDelete(Connection conn, int petNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("petDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, petNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertSuggestion(Connection conn, Suggestion sug) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSuggestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sug.getSugTitle());
			pstmt.setString(2, sug.getSugContent());
			pstmt.setInt(3, sug.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertSuggestionFile(Connection conn, ArrayList<PetFile> list) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSuggestionFile");
		
		try {
			for(PetFile pt : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, pt.getOriginalName());
				pstmt.setString(2, pt.getUploadName());
				pstmt.setString(3, pt.getFilePath());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int insertUserProfil(Connection conn, PetFile pt) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUserProfil");
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
	public int updateUserProfil(Connection conn, User loginUser) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserProfil");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int selectHosListCount(Connection conn, User loginUser) {
		int hosListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHosListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hosListCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hosListCount;
	}
	public ArrayList<HosRecords> selectHosList(Connection conn, PageInfo pi, User loginUser) {
		ArrayList<HosRecords> hosList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHosList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endrow = startRow+pi.getBoardLimit()-1;
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endrow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				HosRecords hr = new HosRecords();
				hr.setHosNo(rset.getInt("HOS_NO"));
				hr.setHosDate(rset.getString("HOS_DATE"));
				hr.setPetName(rset.getString("PET_NAME"));
				hr.setRowNum(rset.getInt("IND"));
				
				hosList.add(hr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hosList;
	}
	public ArrayList<Pet> selectPetName(Connection conn, User loginUser) {
		ArrayList<Pet> PetList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPetName");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Pet p = new Pet();
				p.setPetName(rset.getString("PET_NAME"));
				p.setPetNo(rset.getInt("PET_NO"));
				PetList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return PetList;
	}
	public int insertHos(Connection conn, HosRecords hr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertHos");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hr.getHosDate());
			pstmt.setString(2, hr.getHosVaccination());
			pstmt.setString(3, hr.getHosMedicine());
			pstmt.setString(4, hr.getHosContent());
			pstmt.setString(5, hr.getHosIllness());
			pstmt.setInt(6, hr.getPetNo());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	/*public int petImgDelete(Connection conn, int petFileNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("petImgDelete");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, petFileNo);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}*/
}
