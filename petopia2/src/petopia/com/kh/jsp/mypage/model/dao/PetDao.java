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
	
	public ArrayList<Pet> selectPetList(SqlSession sqlSession, int userNo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectPetList", userNo, rowBounds);
	}
	public int insertPet(SqlSession sqlSession, Pet p) {
		return sqlSession.insert("mypageMapper.insertPet", p);
	}
	public int insertPetImg(SqlSession sqlSession, PetFile pt) {
		return sqlSession.insert("mapageMapper.insertPetImg", pt);
	}
	public int selectPetListCount(SqlSession sqlSession, User loginUser) {
		return sqlSession.selectOne("mypageMapper.selectPetListCount", loginUser);
	}
	public Pet selectPetProfil(SqlSession sqlSession, int petNo) {
		return sqlSession.selectOne("mypageMapper.selectPetProfil", petNo);
	}
	public PetFile selectPetFile(SqlSession sqlSession, int petNo) {
		return sqlSession.selectOne("mypageMapper.selectPetFile", petNo);
	}
	public int updatePetImg(SqlSession sqlSession, PetFile pt) {
		return sqlSession.update("mypageMapper.updatePetImg", pt);
	}
	public int updatePet(SqlSession sqlSession, Pet p) {
		return sqlSession.update("mypageMapper.updatePet", p);
	}
	public int petDelete(SqlSession sqlSession, int petNo) {
		return sqlSession.delete("mypageMapper.petDelete", petNo);
	}
	
	public int insertSuggestion(SqlSession sqlSession, Suggestion sug) {
		return sqlSession.insert("mypageMapper.insertSuggestion", sug);
	}
	public int insertSuggestionFile(SqlSession sqlSession, ArrayList<PetFile> list) {
		return sqlSession.insert("mypageMapper.insertSuggestionFile", list);
	}
	
	public int insertUserProfil(SqlSession sqlSession, PetFile pt) {
		return sqlSession.insert("mypageMapper.insertUserProfil", pt);
	}
	public int updateUserProfil(SqlSession sqlSession, User loginUser) {
		return sqlSession.update("mypageMapper.updateUserProfil", loginUser);
	}
	
	public int selectHosListCount(SqlSession sqlSession, String userNo) {
		return sqlSession.selectOne("mypageMapper.selectHosListCount", userNo); 
	}
	public ArrayList<HosRecords> selectHosList(SqlSession sqlSession, PageInfo pi, String userNo) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectHosList", userNo, rowBounds);
	}
	
	public ArrayList<Pet> selectPetName(SqlSession sqlSession, User loginUser) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectPetName", loginUser);
	}
	
	public int insertHos(SqlSession sqlSession, HosRecords hr) {
		return sqlSession.insert("mypageMapper.insertHos", hr);
	}
	public HosRecords selectHosContent(SqlSession sqlSession, int hosNo) {
		return sqlSession.selectOne("mypageMapper.selectHosContent", hosNo);
	}
	public HosRecords selectHosMain(SqlSession sqlSession, User loginUser) {
		return sqlSession.selectOne("mypageMapper.selectHosMain", loginUser);
	}
	public int updateHos(SqlSession sqlSession, HosRecords hr) {
		return sqlSession.update("mypageMapper.updateHos", hr);
	}
	public int deleteHos(SqlSession sqlSession, int hosNo) {
		return sqlSession.delete("mypageMapper.deleteHos", hosNo);
	}
	public int selectWalkListCount(SqlSession sqlSession, User loginUser) {
		return sqlSession.selectOne("mypageMapper.selectWalkListCount", loginUser);
	}
	public ArrayList<WalkRecords> selectWalkList(SqlSession sqlSession, PageInfo pi, User loginUser) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectWalkList", loginUser, rowBounds);
	}
	
	
	public int insertWalk(SqlSession sqlSession, WalkRecords wr) {
		return sqlSession.insert("mypageMapper.insertWalk", wr);
	}
	public int insertWalkImg(SqlSession sqlSession, PetFile pf) {
		return sqlSession.insert("mypageMapper.insertPetImg", pf);
	}
	public WalkRecords selectWalkContent(SqlSession sqlSession, int walkNo) {
		return sqlSession.selectOne("mypageMapper.selectWalkContent", walkNo);
	}
	public PetFile selectWalkFile(SqlSession sqlSession, int walkNo) {
		return sqlSession.selectOne("mypageMapper.selectWalkFile", walkNo);
	}
	public int updateWalkImg(SqlSession sqlSession, PetFile pf) {
		return sqlSession.update("mypageMapper.updatePetImg", pf);
	}
	public int updateWalk(SqlSession sqlSession, WalkRecords wr) {
		return sqlSession.update("mypageMapper.updateWalk", wr);
	}
	public WalkRecords selectWalkMain(SqlSession sqlSession, User loginUser) {
		return sqlSession.selectOne("mypageMapper.selectWalkMain", loginUser);
	}
	public int deleteWalk(SqlSession sqlSession, int walkkNo) {
		return sqlSession.delete("mypageMapper.deleteWalk", walkkNo);
	}
	public String selectBoardCount(SqlSession sqlSession, int userNo) {
		String bcount = "작성된 게시글이 없습니다";
		return sqlSession.selectOne("mypageMapper.selectBoardCount", userNo);
	}
	public String selectBoardDate(SqlSession sqlSession, int userNo) {
		String lastDate = "작성된 게시글이 없습니다.";
		return sqlSession.selectOne("mypageMapper.selectBoardDate", userNo);
	}
	public ArrayList<Suggestion> selectSugList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectSugList", null, rowBounds);
	}
	public int selectSugListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("mypageMapper.selectSugListCount");
	}
	public Suggestion selectSugContent(SqlSession sqlSession, int sugNo) {
		return sqlSession.selectOne("mypageMapper.selectSugListCount", sugNo);
	}
	public ArrayList<PetFile> selectSugFile(SqlSession sqlSession, int sugNo) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectSugFile", sugNo);
	}
	public int deleteSug(SqlSession sqlSession, int sugNo) {
		return sqlSession.delete("mypageMapper.deleteSug", sugNo);
	}
	public int checkPetName(SqlSession sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("mypageMapper.checkPetName", map);
	}
	/*
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
	*/
	public ArrayList<HosRecords> selecthosDayList(SqlSession sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selecthosDayList", map, rowBounds);
	}

	public ArrayList<WalkRecords> selectWalkDayList(SqlSession sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("mypageMapper.selectWalkDayList", map, rowBounds);
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
