package petopia.com.kh.jsp.info.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static petopia.com.kh.jsp.common.JDBCTemplate.*;
import petopia.com.kh.jsp.info.model.dao.InfoDao;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;

public class InfoService {
	
	public ArrayList<InfoCategory> selectInfoCategory() {
		
		Connection conn = getConnection();
		
		ArrayList<InfoCategory> list = new InfoDao().selectInfoCategory(conn);
		
		close(conn);
		
		return list;
		
		
	}

}
