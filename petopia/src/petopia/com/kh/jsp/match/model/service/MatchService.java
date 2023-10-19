package petopia.com.kh.jsp.match.model.service;


import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.common.JDBCTemplate;
import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.match.model.dao.MatchDao;
import petopia.com.kh.jsp.match.model.vo.Match;
import petopia.com.kh.jsp.mypage.model.vo.Pet;
public class MatchService {

	public int insertThumbnailBoard(Match m, ArrayList<File> list) {

		Connection conn = getConnection();

		int result1 = new MatchDao().insertThumbnailBoard(conn, m);
		int result2 = new MatchDao().insertFileList(conn, list);
		

		
		
		if((result1 * result2) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return (result1 * result2);
		 
	}
	
	public ArrayList<Pet> selectPetInfo() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Pet> list = new MatchDao().selectPetInfo(conn);
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Match> selectMainList() {
		
	

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Match> list = new MatchDao().selectMainList(conn);


		close(conn);
		
		return list;
		
	}
	
	public int increaseCount(int meetBoardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MatchDao().increaseCount(conn, meetBoardNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
	}
	
	
	
}








