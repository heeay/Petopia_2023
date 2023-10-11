package petopia.com.kh.jsp.mypage.model.service;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.mypage.model.dao.PetDao;
import petopia.com.kh.jsp.mypage.model.vo.HosRecords;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
import petopia.com.kh.jsp.mypage.model.vo.Suggestion;
import petopia.com.kh.jsp.user.model.vo.User;

public class PetService {

	public ArrayList<Pet> selectPetList(User loginUser) {
		Connection conn = getConnection();
		ArrayList<Pet> list = new PetDao().selectPetList(conn, loginUser);
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

	public ArrayList<HosRecords> selectHosList(User loginUser) {
		Connection conn = getConnection();
		ArrayList<HosRecords> hosList = new PetDao().selectHosList(conn, loginUser);
		close(conn);
		//System.out.println(hosList);
		return hosList;
	}

	
}
