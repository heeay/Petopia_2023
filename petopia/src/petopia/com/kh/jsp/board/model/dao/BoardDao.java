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
	
<<<<<<< Updated upstream
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Board> list = new ArrayList();
=======
	
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pageInfo) {
		
		ArrayList<Board> bList = new ArrayList();
>>>>>>> Stashed changes
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
<<<<<<< Updated upstream
=======
	
		
>>>>>>> Stashed changes
		
		try {
			
<<<<<<< Updated upstream
			// 위치홀더는 sql값을 넣는 게 아니라 계산식을 변수에 담아서 그 변수를 넣기
			int startRow = ((pi.getCurrentPage()) - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			System.out.println("startRow:" + startRow);
			System.out.println("endRow:" +endRow);
			
=======
			int startRow = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1;
			int endRow = startRow + pageInfo.getBoardLimit() - 1;
			
			// 원래 sql셋팅하고 실행하는 거야 
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			 
		
>>>>>>> Stashed changes
			rset = pstmt.executeQuery();
			
			while(rset.next()){

				Board b = new Board();
				
<<<<<<< Updated upstream
				// 메인게시판에 보여줄 컬럼은 총 8개 // board 필드는 총 11개  // sql은 8개 + rownum = 9개
=======
>>>>>>> Stashed changes
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardViews(rset.getInt("BOARD_VIEWS"));
				b.setBoardCreateDate(rset.getDate("BOARD_CREATE_DATE"));
				b.setUserNo(rset.getInt("USER_NO"));
<<<<<<< Updated upstream
				b.setFileNo(rset.getInt("FILE_NO"));
				b.setCtgNo(rset.getInt("CTG_NO"));
				b.setPetCtgNo(rset.getInt("PET_CTG_NO"));
			
				list.add(b);
=======
				b.setFileImg(rset.getString("FILE_IMG"));
				b.setCtgNo(rset.getInt("CTG_NO"));
				b.setPetCtgNo(rset.getInt("PET_CTG_NO"));
				
				bList.add(b);
>>>>>>> Stashed changes
			}
			System.out.println("나는 resultSet : " + rset);

			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);

			
		}
		
<<<<<<< Updated upstream
		System.out.println("난 리스트 : " + list);
		return list;
		
		
	}
	
	public int increaseViewsCount(Connection conn, int bno) {
		
		int increaseCount = 0;
		PreparedStatement pstmt = null;

		
		String sql = prop.getProperty("increaseViewsCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 여기가 문제였음 : 파라미터로 bno가져왔으면 PSTMT에 bno 셋팅하기
			pstmt.setInt(1, bno);
			
			increaseCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return increaseCount;
		
=======
		return bList;
		//int startRow = ((pi.getCurrentPage()) - 1) * pi.getBoardLimit() + 1;
		//int endRow = startRow + pi.getBoardLimit() - 1;
>>>>>>> Stashed changes
	}
	
		public int increaseViewCount(Connection conn, int bno) {
			int viewCount = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("increaseViewCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bno);
				
				viewCount =  pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				
				close(pstmt);
			}
			
			System.out.println("나는 viewCount : " +viewCount);
			return viewCount;
			
		}
	
		public ArrayList<File> selectFile(Connection conn, int bno){
			
			ArrayList<File> fList = new ArrayList();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectFile");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bno);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					
					File file = new File();
					
					file.setFileNo(rset.getInt("FILE_NO"));
					file.setRefBno(rset.getInt("REF_BNO"));
					file.setOriginalName(rset.getString("ORIGINAL_NAME"));
					file.setUploadName(rset.getString("UPLOAD_NAME"));
					file.setFilePath(rset.getString("FILE_PATH"));
					file.setFileLevel(rset.getInt("FILE_LEVEL"));
					
					fList.add(file);
				}
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				
				close(rset);
				close(pstmt);
			}
			
			System.out.println("나는 fList : " + fList);
			return fList;
			
		}
	
	
	
	// 게시글 번호를 통해 그 게시글의 좋아요 수를 불러오는 메소드
		public int selectLikeCount(Connection conn, int bno) {
			
			int likeCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectLikeCount");
		
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bno);
				
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
			
			System.out.println("난 좋아요 총 개수 : " +likeCount);
			return likeCount;
		}
		
		
		
		
		public Board selectBoard(Connection conn, int bno){
			
			// *** Board board = null;이라고 하면 객체를 생성하지 않았기 때문에 board.setBoardNo 등이 불가 => 그대로 board는 null
			Board board = new Board();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectBoard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, bno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					
					board.setBoardNo(rset.getInt("BOARD_NO"));
					board.setBoardTitle(rset.getString("BOARD_TITLE"));
					board.setBoardContent(rset.getString("BOARD_CONTENT"));
					board.setBoardCreateDate(rset.getDate("BOARD_CREATE_DATE"));
					board.setUserNo(rset.getInt("USER_NO"));
					board.setFileImg(rset.getString("FILE_IMG"));
					board.setLikeCount(rset.getInt("LIKE_COUNT"));
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			System.out.println("난 게시판 board객체야 : " + board);
			return board;
		}
	
	
	
	public Board selectBoard(Connection conn, int bno) {
		
		Board b = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			b.setBoardNo(rset.getInt("BOARD_NO"));
			b.setBoardTitle(rset.getString("BOARD_TITLE"));
			b.setBoardContent(rset.getString("BOARD_CONTENT"));
			b.setBoardViews(rset.getInt("BOARD_VIEWS"));
			b.setBoardCreateDate(rset.getDate("BOARD_CREATE_DATE"));
			b.setBoardUpdateDate(rset.getDate("BOARD_UPDATE_DATE"));
			b.setUserNo(rset.getInt("USER_NO"));
			b.setFileNo(rset.getInt("FILE_NO"));
			b.setCtgNo(rset.getInt("CTG_NO"));
			b.setPetCtgNo(rset.getInt("PET_CTG_NO"));
			b.setLikeCount(rset.getInt("LIKE_COUNT"));
			}
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return b;
	}
	
 //상세조회에서 카테고리 보이는 건 생략	
	// DB로부터 카테고리 리스트의 번호와 이름을 가져오는 메소드

}//class
