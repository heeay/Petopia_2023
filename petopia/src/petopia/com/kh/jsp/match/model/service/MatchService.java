package petopia.com.kh.jsp.match.model.service;


import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.match.model.dao.MatchDao;
import petopia.com.kh.jsp.match.model.vo.Match;
public class MatchService {

	public int insertThumbnailBoard(Match m, ArrayList<File> list) {

		Connection conn = getConnection();

		int result1 = new MatchDao().insertThumbnailBoard(conn, m);
		int result2 = new MatchDao().insertFileList(conn, list);
		
		
		if((result1 * result2) > 0) {
			commit(conn);
			System.out.println("성공");
		} else {
			rollback(conn);
			System.out.println("실패");
		}
		close(conn);
		return (result1 * result2);
	}
	
	
}
