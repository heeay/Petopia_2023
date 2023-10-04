package petopia.com.kh.jsp.info.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import static petopia.com.kh.jsp.common.JDBCTemplate.*;

public class InfoDao {
	
	private Properties prop = new Properties();
	
	public InfoDao() {
		String filePath = InfoDao.class.getResource("/sql/info/info-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	public ArrayList<InfoCategory> selectInfoCategory(Connection conn) {
		
		ArrayList<InfoCategory> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInfoCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new InfoCategory(rset.getInt("CTG_NO"),
										  rset.getString("CTG_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	
}
