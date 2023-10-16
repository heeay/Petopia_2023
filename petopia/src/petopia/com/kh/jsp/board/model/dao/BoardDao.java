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
import petopia.com.kh.jsp.board.model.vo.Category;


import static petopia.com.kh.jsp.common.JDBCTemplate.*;

import petopia.com.kh.jsp.common.model.vo.File;
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
	 
	// 게시글 수를 불러오는 메소드
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
		
		//System.out.println("난 게시글 총 개수 : " + listCount);
		return listCount;
	}
	
	// 게시글 번호를 통해 그 게시글의 좋아요 수를 불러오는 메소드
	public int selectLikeCount(Connection conn, int bno) {
		
		int likeCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLikeCount");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				likeCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			close(rset);
			close(pstmt);

		}
		
		//System.out.println("난 좋아요 총 개수 : " +likeCount);
		return likeCount;
	}
	
	public void selectList(Connection conn) {
		
		ArrayList<Board> bList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			
				Board b = new Board();
				
				b.set
				
				bList.add(b);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			close(rset);
			close(pstmt);

		}
		
		
		//int startRow = ((pi.getCurrentPage()) - 1) * pi.getBoardLimit() + 1;
		//int endRow = startRow + pi.getBoardLimit() - 1;
	}
	
	
}//class
