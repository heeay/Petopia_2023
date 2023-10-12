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
import static petopia.com.kh.jsp.common.JDBCTemplate.*;
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
			
			close(rset);
			close(pstmt);

		}
		
		System.out.println("난 게시글 총 개수 : " + listCount);
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
				System.out.println("내가보인다면 reset은 null도, []도 아니야");
				Board b = new Board();
				
				// 메인게시판에 보여줄 컬럼은 총 8개 // board 필드는 총 11개  // sql은 8개 + rownum = 9개
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
			System.out.println("나는 resultSet : " + rset);

			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);

			
		}
		
		System.out.println("난 리스트 : " + list);
		return list;
		
		
	}
	
	public int increaseViewsCount(Connection conn, int boardNo) {
		
		int increaseCount = 0;
		PreparedStatement pstmt = null;
		Board b = new Board();
		
		String sql = prop.getProperty("increaseViewsCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b.getBoardNo());
			
			increaseCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return increaseCount;
		
	}
	
	
	public Board selectBoard(Connection conn, int boardNo) {
		
		Board b = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
		
			b.setBoardTitle(rset.getString("BOARD_TITLE"));
			b.setBoardContent(rset.getString("BOARD_CONTENT"));
			b.setBoardViews(rset.getInt("BOARD_VIEWS"));
			b.setBoardCreateDate(rset.getDate("BOARD_CREATE_DATE"));
			b.setUserNo(rset.getInt("USER_NO"));
			b.setFileNo(rset.getInt("FILE_NO"));
			b.setCtgNo(rset.getInt("CTG_NO"));
			b.setPetCtgNo(rset.getInt("PET_CTG_NO"));
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return b;
	}
	
	
	
	
}
