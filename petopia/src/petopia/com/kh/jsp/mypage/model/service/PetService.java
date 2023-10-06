package petopia.com.kh.jsp.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static petopia.com.kh.jsp.common.JDBCTemplate.*;
import petopia.com.kh.jsp.mypage.model.dao.PetDao;
import petopia.com.kh.jsp.mypage.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.mypage.model.vo.PetFile;
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
		
		int result1 = new PetDao().insertPet(conn, p);
		
		// 프로필 사진 넣을수도 안넣을 수도 있음
		int result2 = 1;
		
		if(pt != null) {
			result2 = new PetDao().insertPetImg(conn, pt);
		}
		
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

	

}
