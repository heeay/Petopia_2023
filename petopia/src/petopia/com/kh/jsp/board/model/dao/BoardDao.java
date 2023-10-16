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
	 
	// 여기서부턴 게시글 조회하는 메소드들
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
	

	
	
	public ArrayList<Board> selectList(Connection conn, PageInfo pageInfo) {
		
		ArrayList<Board> bList = new ArrayList();
 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
 
		try {
			

			int startRow = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit() + 1;
			int endRow = startRow + pageInfo.getBoardLimit() - 1;
			
			// 원래 sql셋팅하고 실행하는 거야 
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			 
 
			rset = pstmt.executeQuery();
			
			while(rset.next()){

				Board board = new Board();
				

				board.setBoardNo(rset.getInt("BOARD_NO"));
				board.setBoardTitle(rset.getString("BOARD_TITLE"));
				board.setBoardViews(rset.getInt("BOARD_VIEWS"));
				board.setBoardCreateDate(rset.getDate("BOARD_CREATE_DATE"));
				board.setUserNo(rset.getInt("USER_NO"));
				board.setFileImg(rset.getString("FILE_IMG"));
				board.setCtgNo(rset.getInt("CTG_NO"));
				board.setPetCtgNo(rset.getInt("PET_CTG_NO"));
				
				bList.add(board);
 
			}
			System.out.println("나는 resultSet : " + rset);

			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(rset);
			close(pstmt);

			
		}
		

		return bList;

 
	}
	
	// 여기서부턴 디테일
		public int increaseViewCount(Connection conn, int bno) {
			int viewCount = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("increaseViewCount");
			
			//int startRow = ((pi.getCurrentPage()) - 1) * pi.getBoardLimit() + 1;
			//int endRow = startRow + pi.getBoardLimit() - 1;
			
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
	
	
	
	
	
 //상세조회에서 카테고리 보이는 건 생략	
	// DB로부터 카테고리 리스트의 번호와 이름을 가져오는 메소드

}//class
