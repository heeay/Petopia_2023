package petopia.com.kh.jsp.mypage.model.dao;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.mypage.model.vo.Suggestion;
import petopia.com.kh.jsp.mypage.model.vo.WalkRecords;
import petopia.com.kh.jsp.user.model.vo.User;

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
	public int selectHosListCount(SqlSession sqlSession, int userNo) {
		
		return sqlSession.selectOne("mypageMapper.selectHosListCount", userNo); 
	}
	public ArrayList<HosRecords> selectHosList(SqlSession sqlSession, PageInfo pi, int userNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectHosList", userNo, rowBounds);
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
	public int insertHos(SqlSession sqlSession, HosRecords hr) {
		
		return sqlSession.insert("mypageMapper.insertHos", hr);
	}
	public HosRecords selectHosContent(Connection conn, int hosNo) {
		HosRecords hr = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHosContent");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1,  hosNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hr = new HosRecords();
				hr.setHosNo(rset.getInt("HOS_NO"));
				hr.setHosDate(rset.getString("HOS_DATE"));
				hr.setHosVaccination(rset.getString("HOS_VACCINATION"));
				hr.setHosIllness(rset.getString("HOS_ILLNESS"));
				hr.setHosMedicine(rset.getString("HOS_MEDICINE"));
				hr.setHosContent(rset.getString("HOS_CONTENT"));
				hr.setPetNo(rset.getInt("PET_NO"));
			}
			//System.out.println(hr.getHosNo());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hr;
	}
	public HosRecords selectHosMain(Connection conn, User loginUser) {
		HosRecords hr = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHosMain");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hr = new HosRecords();
				hr.setHosNo(rset.getInt("HOS_NO"));
				hr.setHosDate(rset.getString("HOS_DATE"));
				hr.setHosVaccination(rset.getString("HOS_VACCINATION"));
				hr.setHosIllness(rset.getString("HOS_ILLNESS"));
				hr.setHosMedicine(rset.getString("HOS_MEDICINE"));
				hr.setHosContent(rset.getString("HOS_CONTENT"));
				hr.setPetNo(rset.getInt("PET_NO"));
				hr.setPetName(rset.getString("PET_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hr;
	}
	public int updateHos(Connection conn, HosRecords hr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHos");
		
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, hr.getPetNo());
			pstmt.setString(2, hr.getHosDate());
			pstmt.setString(3, hr.getHosVaccination());
			pstmt.setString(4, hr.getHosIllness());
			pstmt.setString(5, hr.getHosMedicine());
			pstmt.setString(6, hr.getHosContent());
			pstmt.setInt(7, hr.getHosNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteHos(Connection conn, int hosNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteHos");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hosNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int selectWalkListCount(Connection conn, User loginUser) {
		int walkListCount=0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWalkListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				walkListCount =  rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return walkListCount;
	}
	public ArrayList<WalkRecords> selectWalkList(Connection conn, PageInfo pi, User loginUser, String startDate, String endDate) {
		ArrayList<WalkRecords> walkList= new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWalkList");
		String walkDate = "AND WALK_DATE BETWEEN TO_DATE(?) AND TO_DATE(?)+1      \r\n" + 
				"								  ORDER BY WALK_NO DESC)\r\n" + 
				"		  WHERE IND BETWEEN ? AND ?";
		
		String sql2 = " ORDER BY WALK_NO DESC)\r\n" + 
				"		  WHERE IND BETWEEN ? AND ?";
		
		if(startDate == null) {
			sql += sql2;
		}
		
		if(startDate != null) {
			sql += walkDate;
		}
		//System.out.println(sql);
		try {
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endRow = startRow+pi.getBoardLimit()-1;
			
			//System.out.println(startRow);
			//System.out.println(endRow);
			//System.out.println(pi.getBoardLimit());
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, loginUser.getUserNo());
			
			if(startDate == null) {
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			}
			if(startDate != null) {
				pstmt.setString(2, startDate);
				pstmt.setString(3, endDate);
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
			}
			
			//System.out.println(startRow);
			//System.out.println(endrow);
			//System.out.println(loginUser.getUserNo());
			//System.out.println(startDate);
			//System.out.println(endDate);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WalkRecords wr = new WalkRecords();
				wr.setWalkNo(rset.getInt("WALK_NO"));
				wr.setWalkDate(rset.getString("WALK_DATE"));
				wr.setWalkTitle(rset.getString("WALK_TITLE"));
				wr.setFileNo(rset.getString("PATH"));
				wr.setRowNum(rset.getInt("IND"));
				
				walkList.add(wr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return walkList;
	}
	
	
	public int insertWalk(Connection conn, WalkRecords wr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertWalk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wr.getWalkContent());
			pstmt.setString(2, wr.getWalkTitle());
			pstmt.setInt(3, wr.getPetNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//System.out.println(wr);
		return result;
	}
	public int insertWalkImg(Connection conn, PetFile pf) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		// sql 재활용(이미지 1개 업로드)
		String sql = prop.getProperty("insertPetImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pf.getOriginalName());
			pstmt.setString(2, pf.getUploadName());
			pstmt.setString(3, pf.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public WalkRecords selectWalkContent(Connection conn, int walkNo) {
		WalkRecords wr = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWalkContent");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1,  walkNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				wr = new WalkRecords();
				wr.setWalkNo(rset.getInt("WALK_NO"));
				wr.setWalkDate(rset.getString("WALK_DATE"));
				wr.setWalkContent(rset.getString("WALK_CONTENT"));
				wr.setWalkTitle(rset.getString("WALK_TITLE"));
				wr.setPetNo(rset.getInt("PET_NO"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return wr;
	}
	public PetFile selectWalkFile(Connection conn, int walkNo) {
		PetFile pf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWalkFile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, walkNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pf = new PetFile();
				pf.setFileNo(rset.getInt("FILE_MYPAGE_NO"));
				pf.setOriginalName(rset.getString("ORIGINAL_NAME"));
				pf.setUploadName(rset.getString("UPLOAD_NAME"));
				pf.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pf;
	}
	public int updateWalkImg(Connection conn, PetFile pf) {
		int result = 0;
		PreparedStatement pstmt = null;
		// sql 재활용
		String sql = prop.getProperty("updatePetImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pf.getOriginalName());
			pstmt.setString(2, pf.getUploadName());
			pstmt.setString(3, pf.getFilePath());
			pstmt.setInt(4, pf.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateWalk(Connection conn, WalkRecords wr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateWalk");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, wr.getWalkContent());
			pstmt.setString(2, wr.getWalkTitle());
			pstmt.setInt(3, wr.getPetNo());
			pstmt.setInt(4, wr.getWalkNo());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public WalkRecords selectWalkMain(Connection conn, User loginUser) {
		WalkRecords wr = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWalkMain");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				wr = new WalkRecords();
				wr.setWalkContent(rset.getString("WALK_CONTENT"));
				wr.setWalkTitle(rset.getString("WALK_TITLE"));
				wr.setFileNo(rset.getString("PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return wr;
		
	}
	public int deleteWalk(Connection conn, int walkkNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteWalk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, walkkNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public String selectBoardCount(Connection conn, User loginUser) {
		String bcount = "작성된 게시글이 없습니다";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bcount = rset.getString("COUNT(BOARD_NO)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return bcount;
	}
	public String selectBoardDate(Connection conn, User loginUser) {
		String lastDate = "작성된 게시글이 없습니다.";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoardDate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				lastDate = rset.getString("LASTDATE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return lastDate;
	}
	public ArrayList<Suggestion> selectSugList(Connection conn, PageInfo pi) {
		ArrayList<Suggestion> sugList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSugList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
			int endrow = startRow+pi.getBoardLimit()-1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endrow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Suggestion sug = new Suggestion();
				sug.setInd(rset.getInt("IND"));
				sug.setSugNo(rset.getInt("SUG_NO"));
				sug.setSugTitle(rset.getString("SUG_TITLE"));
				sug.setSugContent(rset.getString("SUG_CONTENT"));
				sug.setSugDate(rset.getString("SUG_DATE"));
				sug.setUserNo(rset.getInt("USER_NO"));
				sug.setUserEmail(rset.getString("USER_EMAIL"));
				
				sugList.add(sug);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sugList;
	}
	public int selectSugListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSugListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			
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
	public Suggestion selectSugContent(Connection conn, int sugNo) {
		Suggestion sug = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSugContent");
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1,  sugNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sug = new Suggestion();
				sug.setSugNo(rset.getInt("SUG_NO"));
				sug.setSugTitle(rset.getString("SUG_TITLE"));
				sug.setSugContent(rset.getString("SUG_CONTENT"));
				sug.setSugDate(rset.getString("SUG_DATE"));
				sug.setUserEmail(rset.getString("USER_EMAIL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sug;
	}
	public ArrayList<PetFile> selectSugFile(Connection conn, int sugNo) {
		ArrayList<PetFile> file = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSugFile");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sugNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				PetFile pf = new PetFile();
				pf.setFileNo(rset.getInt("FILE_MYPAGE_NO"));
				pf.setRefBno(rset.getInt("SUG_NO"));
				pf.setOriginalName(rset.getString("ORIGINAL_NAME"));
				pf.setUploadName(rset.getString("UPLOAD_NAME"));
				pf.setFilePath(rset.getString("FILE_PATH"));
				file.add(pf);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return file;
	}
	public int deleteSug(Connection conn, int sugNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSug");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sugNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int checkPetName(Connection conn, String petName, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkPetName");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, petName);
			
			rset = pstmt.executeQuery();
			if(rset.next() || petName.equals("")) {
				// 이미존재할때, 생성불가능
				result = 0;
			}else {
				// 존재하지 않을때, 생성가능
				result = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	public int updateGradeR1(Connection conn, User loginUser) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateGradeR1");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateGradeR2(Connection conn, User loginUser) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateGradeR2");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public String selectR2(Connection conn, User loginUser) {
		String result = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectR2");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("ROLE_NAME");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public String selectR3(Connection conn, User loginUser) {
		String result = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectR2");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, loginUser.getUserNo());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("ROLE_NAME");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<HosRecords> selectDayList(SqlSession sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectDayList", map, rowBounds);
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
