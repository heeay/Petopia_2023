package petopia.com.kh.jsp.mypage.model.service;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.mypage.model.dao.PetDao;
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;
import petopia.com.kh.jsp.mypage.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.mypage.model.vo.Suggestion;
import petopia.com.kh.jsp.mypage.model.vo.WalkRecords;
import petopia.com.kh.jsp.user.model.vo.User;

public class PetService {

	public ArrayList<Pet> selectPetList(PageInfo pi, User loginUser) {
		Connection conn = getConnection();
		ArrayList<Pet> list = new PetDao().selectPetList(conn, pi ,loginUser);
		close(conn);
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

	public int selectHosListCount(User loginUser) {
		Connection conn = getConnection();
		int hosListCount = new PetDao().selectHosListCount(conn, loginUser);
		close(conn);
		return hosListCount;
	}

	public ArrayList<HosRecords> selectHosList(PageInfo pi, User loginUser, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<HosRecords> hosList = new PetDao().selectHosList(conn, pi, loginUser, startDate, endDate);
		//System.out.println(hosList);
		close(conn);
		return hosList;
	}

	public ArrayList<Pet> selectPetName(User loginUser) {
		Connection conn = getConnection();
		ArrayList<Pet> PetList = new PetDao().selectPetName(conn, loginUser);
		close(conn);
		return PetList;
	}

	public int insertHos(HosRecords hr) {
		Connection conn = getConnection();
		int result = new PetDao().insertHos(conn, hr);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
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


	public String selectBoardCount(User loginUser) {
		Connection conn = getConnection();
		String bcount = new PetDao().selectBoardCount(conn, loginUser);
		close(conn);
		return bcount;
	}

	public String selectBoardDate(User loginUser) {
		Connection conn = getConnection();
		String lastDate = new PetDao().selectBoardDate(conn, loginUser);
		close(conn);
		return lastDate;
	}

	
}
