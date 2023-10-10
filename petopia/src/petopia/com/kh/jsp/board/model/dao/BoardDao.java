package petopia.com.kh.jsp.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.common.JDBCTemplate;
import petopia.com.kh.jsp.common.model.vo.PageInfo;

public class BoardDao {

	// 왜 private 붙이지?
	private Properties prop = new Properties();
	
	// 기본생성자
	public BoardDao() {
		
		// BoardDao의 클래스에서 xml소스코드를 얻는 경로를 filePath 변수에 담음
		String filePath = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			// 스트림 통해 경로전달해 XML파일 로드
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(conn);
		}

		return listCount;
	}
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Board> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 위치홀더는 sql값을 넣는 게 아니라 계산식을 변수에 담아서 그 변수를 넣기
			int startRow = ((pi.getCurrentPage()) - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				
				Board b = new Board();
				
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardViews(rset.getInt("BOARD_VIEWS"));
				b.setBoardCreateDate(rset.getDate("BOARD_CREATE_DATE"));
				b.setUserNo(rset.getInt("USER_NO"));
				b.setFileNo(rset.getInt("FILE_NO"));
				b.setCtgNo(rset.getInt("CTG_NO"));
				b.setPetCtgNo(rset.getInt("PET_CTG_NO"));
			
				list.add(b);
			}

			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(conn);
			
		}
		
		return list;
		
		
	}
	
	
	
	
	
	
	
	
}
