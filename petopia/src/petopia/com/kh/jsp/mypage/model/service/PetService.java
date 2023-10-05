package petopia.com.kh.jsp.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static petopia.com.kh.jsp.common.JDBCTemplate.*;
import petopia.com.kh.jsp.mypage.model.dao.PetDao;
import petopia.com.kh.jsp.mypage.model.vo.PageInfo;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
import petopia.com.kh.jsp.user.model.vo.User;

public class PetService {

	public ArrayList<Pet> selectPetList(User loginUser) {
		Connection conn = getConnection();
		ArrayList<Pet> list = new PetDao().selectPetList(conn, loginUser);
		close(conn);
		return list;
	}

	

}
