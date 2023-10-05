package petopia.com.kh.jsp.info.model.service;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.info.model.dao.InfoDao;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoFile;
import petopia.com.kh.jsp.info.model.vo.Star;

public class InfoService {
	
	public ArrayList<InfoCategory> selectInfoCategory() {
		
		Connection conn = getConnection();
		
		ArrayList<InfoCategory> list = new InfoDao().selectInfoCategory(conn);
		
		close(conn);
		
		return list;
	}
	
	public int insertShareInfo(Info in, int star, ArrayList<InfoFile> list) {
		
		Connection conn = getConnection();
		
		int result1 = new InfoDao().insertShareInfo(conn, in);
		
		int result2 = new InfoDao().insertStar(conn, star);
		
		int result3 = new InfoDao().insertFileList(conn, list);
		
		if((result1 * result2 * result3) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2 * result3);
	}

	
	
}
