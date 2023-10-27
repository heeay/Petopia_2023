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
		Connection conn = getConnection();
		
		int result2 = 1;
		
		if(pt != null) {
			result2 = new PetDao().insertPetImg(conn, pt);
		}
		int result1 = new PetDao().insertPet(conn, p);
		
		if((result1*result2)>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return (result1*result2);
	}

	public int selectPetListCount(User loginUser) {
		Connection conn = getConnection();
		int listCount = new PetDao().selectPetListCount(conn, loginUser);
		close(conn);
		return listCount;
	}

	public Pet selectPetProfil(int petNo) {
		Connection conn = getConnection();
		Pet p = new PetDao().selectPetProfil(conn, petNo);
		close(conn);
		return p;
	}

	public PetFile selectPetFile(int petNo) {
		Connection conn = getConnection();
		PetFile pt = new PetDao().selectPetFile(conn, petNo);
		close(conn);
		return pt;
	}

	public int updatePetProfil(Pet p, PetFile pt) {
		Connection conn = getConnection();
		
		int result2 = 1;
		
		if(pt != null) {
			result2 = new PetDao().updatePetImg(conn, pt);
		}
		
		int result1 = new PetDao().updatePet(conn, p);
		
		if((result1*result2)>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return (result1*result2);
	}

	public int petDelete(int petNo) {
		Connection conn = getConnection();
		//int result2 = new PetDao().petImgDelete(conn, petFileNo);
		int result1 = new PetDao().petDelete(conn, petNo);
		
		if(result1>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return (result1);
	}

	public int insertSuggestion(Suggestion sug, ArrayList<PetFile> list) {
		Connection conn = getConnection();
		int result1 = new PetDao().insertSuggestion(conn, sug);
		int result2 = new PetDao().insertSuggestionFile(conn, list);
		
		if((result1*result2) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return (result1*result2);
	}

	public int insertUserProfil(PetFile pt, User loginUser) {
		Connection conn = getConnection();
		int result1 = new PetDao().insertUserProfil(conn, pt);
		int result2 = new PetDao().updateUserProfil(conn, loginUser);
		
		if(result1*result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1*result2;
	}

	public int selectHosListCount(int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = petDao.selectHosListCount(sqlSession, userNo);
		sqlSession.close();
		return result;
	}

	public ArrayList<HosRecords> selectHosList(PageInfo pi, int userNo) {
		SqlSession sqlSession = Template.getSqlSession();
		ArrayList<HosRecords> hosList = petDao.selectHosList(sqlSession, pi, userNo);
		sqlSession.close();
		return hosList;
	}

	public ArrayList<Pet> selectPetName(User loginUser) {
		Connection conn = getConnection();
		ArrayList<Pet> PetList = new PetDao().selectPetName(conn, loginUser);
		close(conn);
		return PetList;
	}

	public int insertHos(HosRecords hr) {
		SqlSession sqlSession = Template.getSqlSession();
		int result = petDao.insertHos(sqlSession, hr);
		if(result>0) sqlSession.commit();
		return result;
	}

	public HosRecords selectHosContent(int hosNo) {
		Connection conn = getConnection();
		HosRecords hr = new PetDao().selectHosContent(conn, hosNo);
		close(conn);
		return hr;
	}

	public HosRecords selectHosMain(User loginUser) {
		Connection conn = getConnection();
		HosRecords hr = new PetDao().selectHosMain(conn, loginUser);
		close(conn);
		return hr;
	}

	public int updateHos(HosRecords hr) {
		Connection conn = getConnection();
		int result = new PetDao().updateHos(conn, hr);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int deleteHos(int hosNo) {
		Connection conn = getConnection();
		int result = new PetDao().deleteHos(conn, hosNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int selectWalkListCount(User loginUser) {
		Connection conn = getConnection();
		int walkListCount = new PetDao().selectWalkListCount(conn, loginUser);
		close(conn);
		return walkListCount;
	}

	public ArrayList<WalkRecords> selectWalkList(PageInfo pi, User loginUser, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<WalkRecords> walkRecords = new PetDao().selectWalkList(conn, pi, loginUser, startDate, endDate);
		//System.out.println(walkRecords);
		close(conn);
		return walkRecords;
	}

	public int insertWalk(WalkRecords wr, PetFile pf) {
		Connection conn = getConnection();
		
		int result2 = 1;
		
		if(pf != null) {
			result2 = new PetDao().insertWalkImg(conn, pf);
		}
		
		int result1 = new PetDao().insertWalk(conn, wr);
		
		if((result1*result2)>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return (result1*result2);
	}

	public WalkRecords selectWalkContent(int walkNo) {
		Connection conn = getConnection();
		WalkRecords wr = new PetDao().selectWalkContent(conn, walkNo);
		close(conn);
		return wr;
	}

	public PetFile selectWalkFile(int walkNo) {
		Connection conn = getConnection();
		PetFile pf = new PetDao().selectWalkFile(conn, walkNo);
		close(conn);
		return pf;
	}

	public int updateWalk(WalkRecords wr, PetFile pf) {
		Connection conn = getConnection();
		
		int result2 = 1;
		
		if(pf != null) {
			result2 = new PetDao().updateWalkImg(conn, pf);
		}
		
		int result1 = new PetDao().updateWalk(conn, wr);
		
		if((result1*result2)>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return (result1*result2);
	}

	public WalkRecords selectWalkMain(User loginUser) {
		Connection conn = getConnection();
		WalkRecords wr = new PetDao().selectWalkMain(conn, loginUser);
		close(conn);
		return wr;
	}

	public int deleteWalk(int walkkNo) {
		Connection conn = getConnection();
		int result = new PetDao().deleteWalk(conn, walkkNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
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
		Connection conn = getConnection();
		ArrayList<Suggestion> sugList = new PetDao().selectSugList(conn, pi);
		close(conn);
		return sugList;
	}

	public int selectSugListCount() {
		Connection conn = getConnection();
		int listCount = new PetDao().selectSugListCount(conn);
		close(conn);
		return listCount;
	}

	public Suggestion selectSugContent(int sugNo) {
		Connection conn = getConnection();
		Suggestion sug = new PetDao().selectSugContent(conn, sugNo);
		close(conn);
		return sug;
	}

	public ArrayList<PetFile> selectSugFile(int sugNo) {
		Connection conn = getConnection();
		ArrayList<PetFile> file = new PetDao().selectSugFile(conn, sugNo);
		close(conn);
		return file;
	}

	public int deleteSug(int sugNo) {
		Connection conn = getConnection();
		int result = new PetDao().deleteSug(conn, sugNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int checkPetName(String petName, int userNo) {
		Connection conn = getConnection();
		int result = new PetDao().checkPetName(conn, petName, userNo);
		close(conn);
		return result;
	}

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

	public ArrayList<HosRecords> selectDayList(PageInfo pi, HashMap<String, String> map) {
		SqlSession sqlSession = Template.getSqlSession();
		RowBounds rowBounds = new RowBounds(((pi.getCurrentPage()-1)*pi.getBoardLimit())
											 ,pi.getBoardLimit());
		ArrayList<HosRecords> searchList = petDao.selectDayList(sqlSession, map, rowBounds);
		sqlSession.close();
		return searchList;
	}

	
}
