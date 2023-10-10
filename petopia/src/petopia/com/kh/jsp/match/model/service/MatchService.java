package petopia.com.kh.jsp.match.model.service;


import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.match.model.dao.MatchDao;
import petopia.com.kh.jsp.match.model.vo.Match;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.dao.InfoDao;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoFile;
public class MatchService {

	public int insertThumbnailBoard(Match m, ArrayList<File> list) {
		System.out.println("넘어감");

		Connection conn = getConnection();
		System.out.println("넘어감");

		int result1 = new MatchDao().insertThumbnailBoard(conn, m);
		System.out.println("넘어감");
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
