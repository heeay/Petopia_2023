package petopia.com.kh.jsp.mypage.model.service;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.common.template.Template;
import petopia.com.kh.jsp.mypage.model.dao.PetDao;
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.mypage.model.vo.Suggestion;
import petopia.com.kh.jsp.mypage.model.vo.WalkRecords;
import petopia.com.kh.jsp.user.model.vo.User;

public class PetService {
	
	private PetDao petDao = new PetDao();
	


	public ArrayList<Pet> selectPetList(PageInfo pi, int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage()-1)*pi.getBoardLimit())
											,pi.getBoardLimit());
		ArrayList<Pet> list = new PetDao().selectPetList(sqlSession, userNo, rowBounds);

		sqlSession.close();
		return list;
	}

	public int insertPetProfil(Pet p, PetFile pt) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result2 = 1;
		if(pt != null) {
			result2 = new PetDao().insertPetImg(sqlSession, pt);
		}
		int result1 = new PetDao().insertPet(sqlSession, p);
		if((result1*result2)>0) sqlSession.commit();
		sqlSession.close();
		return (result1*result2);
	}

	public int selectPetListCount(User loginUser) {
		SqlSession sqlSession = Template.getSqlSession();
		int listCount = new PetDao().selectPetListCount(sqlSession, loginUser);
		sqlSession.close();
		return listCount;
	}

	public Pet selectPetProfil(int petNo) {
		SqlSession sqlSession = Template.getSqlSession();
		Pet p = new PetDao().selectPetProfil(sqlSession, petNo);
		sqlSession.close();
		return p;
	}

	public PetFile selectPetFile(int petNo) {
		SqlSession sqlSession = Template.getSqlSession();
		PetFile pt = new PetDao().selectPetFile(sqlSession, petNo);
		sqlSession.close();
		return pt;
	}

	public int updatePetProfil(Pet p, PetFile pt) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result2 = 1;
		
		if(pt != null) {
			result2 = new PetDao().updatePetImg(sqlSession, pt);
		}
		
		int result1 = new PetDao().updatePet(sqlSession, p);
		
		if((result1*result2)>0) sqlSession.commit();
		sqlSession.close();
		return (result1*result2);
	}

	public int petDelete(int petNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result1 = new PetDao().petDelete(sqlSession, petNo);
		if(result1>0) sqlSession.commit();
		sqlSession.close();
		return (result1);
	}

	public int insertSuggestion(Suggestion sug, ArrayList<PetFile> list) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result1 = new PetDao().insertSuggestion(sqlSession, sug);
		int result2 = new PetDao().insertSuggestionFile(sqlSession, list);
		
		if((result1*result2) > 0) sqlSession.commit();
		sqlSession.close();
		return (result1*result2);
	}

	public int insertUserProfil(PetFile pt, User loginUser) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result1 = new PetDao().insertUserProfil(sqlSession, pt);
		int result2 = new PetDao().updateUserProfil(sqlSession, loginUser);
		
		if(result1*result2>0) sqlSession.commit();
		sqlSession.close();
		return result1*result2;
	}

	public int selectHosListCount(String userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = petDao.selectHosListCount(sqlSession, userNo);
		sqlSession.close();
		return result;
	}

	public ArrayList<HosRecords> selectHosList(PageInfo pi, String userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<HosRecords> hosList = petDao.selectHosList(sqlSession, pi, userNo);
		sqlSession.close();
		return hosList;
	}

	public ArrayList<Pet> selectPetName(User loginUser) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Pet> PetList = new PetDao().selectPetName(sqlSession, loginUser);
		sqlSession.close();
		return PetList;
	}

	public int insertHos(HosRecords hr) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = new PetDao().insertHos(sqlSession, hr);
		if(result>0) sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public HosRecords selectHosContent(int hosNo) {
		SqlSession sqlSession = Template.getSqlSession();
		HosRecords hr = new PetDao().selectHosContent(sqlSession, hosNo);
		sqlSession.close();
		return hr;
	}

	public HosRecords selectHosMain(User loginUser) {
		SqlSession sqlSession = Template.getSqlSession();
		HosRecords hr = new PetDao().selectHosMain(sqlSession, loginUser);
		sqlSession.close();
		return hr;
	}

	public int updateHos(HosRecords hr) {
		SqlSession sqlSession = Template.getSqlSession();
		
		int result = new PetDao().updateHos(sqlSession, hr);
		
		if(result>0) sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public int deleteHos(int hosNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = new PetDao().deleteHos(sqlSession, hosNo);
		if(result>0) sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public int selectWalkListCount(User loginUser) {
		SqlSession sqlSession = Template.getSqlSession();
		int walkListCount = new PetDao().selectWalkListCount(sqlSession, loginUser);
		sqlSession.close();
		return walkListCount;
	}

	public ArrayList<WalkRecords> selectWalkList(PageInfo pi, User loginUser) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<WalkRecords> walkRecords = new PetDao().selectWalkList(sqlSession, pi, loginUser);
		//System.out.println(walkRecords);
		sqlSession.close();
		return walkRecords;
	}

	public int insertWalk(WalkRecords wr, PetFile pf) {
		SqlSession sqlSession = Template.getSqlSession();
		int result2 = 1;
		if(pf != null) {
			result2 = new PetDao().insertWalkImg(sqlSession, pf);
		}
		int result1 = new PetDao().insertWalk(sqlSession, wr);
		
		if((result1*result2)>0) sqlSession.commit();
		sqlSession.close();
		return (result1*result2);
	}

	public WalkRecords selectWalkContent(int walkNo) {
		SqlSession sqlSession = Template.getSqlSession();
		WalkRecords wr = new PetDao().selectWalkContent(sqlSession, walkNo);
		sqlSession.close();
		return wr;
	}

	public PetFile selectWalkFile(int walkNo) {
		SqlSession sqlSession = Template.getSqlSession();
		PetFile pf = new PetDao().selectWalkFile(sqlSession, walkNo);
		sqlSession.close();
		return pf;
	}

	public int updateWalk(WalkRecords wr, PetFile pf) {
		SqlSession sqlSession = Template.getSqlSession();		
		int result2 = 1;
		
		if(pf != null) {
			result2 = new PetDao().updateWalkImg(sqlSession, pf);
		}
		int result1 = new PetDao().updateWalk(sqlSession, wr);
		
		if((result1*result2)>0) sqlSession.commit();
		sqlSession.close();
		return (result1*result2);
	}

	public WalkRecords selectWalkMain(User loginUser) {
		SqlSession sqlSession = Template.getSqlSession();
		WalkRecords wr = new PetDao().selectWalkMain(sqlSession, loginUser);
		sqlSession.close();
		return wr;
	}

	public int deleteWalk(int walkkNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = new PetDao().deleteWalk(sqlSession, walkkNo);
		
		if(result>0) sqlSession.commit();
		sqlSession.close();
		return result;
	}


	public String selectBoardCount(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		String bcount = petDao.selectBoardCount(sqlSession, userNo);
		sqlSession.close();
		return bcount;
	}

	public String selectBoardDate(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		String lastDate = petDao.selectBoardDate(sqlSession, userNo);
		sqlSession.close();
		return lastDate;
	}

	public ArrayList<Suggestion> selectSugList(PageInfo pi) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<Suggestion> sugList = new PetDao().selectSugList(sqlSession, pi);
		sqlSession.close();
		return sugList;
	}

	public int selectSugListCount() {
		SqlSession sqlSession = Template.getSqlSession();
		int listCount = new PetDao().selectSugListCount(sqlSession);
		sqlSession.close();
		return listCount;
	}

	public Suggestion selectSugContent(int sugNo) {
		SqlSession sqlSession = Template.getSqlSession();
		Suggestion sug = new PetDao().selectSugContent(sqlSession, sugNo);
		sqlSession.close();
		return sug;
	}

	public ArrayList<PetFile> selectSugFile(int sugNo) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<PetFile> file = new PetDao().selectSugFile(sqlSession, sugNo);
		sqlSession.close();
		return file;
	}

	public int deleteSug(int sugNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = new PetDao().deleteSug(sqlSession, sugNo);
		
		if(result>0) sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public int checkPetName(HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = new PetDao().checkPetName(sqlSession, map);
		sqlSession.close();
		return result;
	}
	/*
	public int updateGradeR1(User loginUser) {
		Connection conn = getConnection();
		int result = new PetDao().updateGradeR1(conn, loginUser);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int updateGradeR2(User loginUser) {
		Connection conn = getConnection();
		int result = new PetDao().updateGradeR2(conn, loginUser);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public String selectR2(User loginUser) {
		Connection conn = getConnection();
		String result = new PetDao().selectR2(conn, loginUser);
		commit(conn);
		return result;
	}

	public String selectR3(User loginUser) {
		Connection conn = getConnection();
		String result = new PetDao().selectR3(conn, loginUser);
		commit(conn);
		return result;
	}
	 */
	public ArrayList<HosRecords> selecthosDayList(PageInfo pi, HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage()-1)*pi.getBoardLimit())
											 ,pi.getBoardLimit());
		ArrayList<HosRecords> searchList = petDao.selecthosDayList(sqlSession, map, rowBounds);
		sqlSession.close();
		return searchList;
	}

	public ArrayList<WalkRecords> selectWalkDayList(PageInfo pi, HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage()-1)*pi.getBoardLimit())
											 ,pi.getBoardLimit());
		ArrayList<WalkRecords> searchList = petDao.selectWalkDayList(sqlSession, map, rowBounds);
		sqlSession.close();
		return searchList;
	}

	
}
