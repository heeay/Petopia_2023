package petopia.com.kh.jsp.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.board.model.dao.BoardDao;
import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.board.model.vo.Category;

import static petopia.com.kh.jsp.common.JDBCTemplate.*;

import petopia.com.kh.jsp.common.JDBCTemplate;
import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.user.model.dao.UserDao;

public class BoardService {

	// 여기서부터 boardList뽑기
	// 게시글 수 아는방법
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		 close(conn);
		
		return listCount;
	}

	
	// 게시글 리스트 뽑기
	public ArrayList<Board> selectList(PageInfo pageInfo) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> bList = new BoardDao().selectList(conn, pageInfo);
		
		 close(conn);
		
		 return bList;
		
	}
	// boardDetail뽑기 '전'에 조회수 증가시키키!!!
	public int increaseViewCount(int bno) {
		
		Connection conn = getConnection();
		
		int viewCount = new BoardDao().increaseViewCount(conn, bno);
		
		if(viewCount > 0)  close(conn); 
		else  rollback(conn); 
		
		 return viewCount;
	}
	
	// 여기서부터 boardDetail 뽑기

	public ArrayList<File> selectFile(int bno){
		
		Connection conn = getConnection();
		
		ArrayList<File> fList = new BoardDao().selectFile(conn, bno);
		
		 close(conn);
		
		 return fList;
	}
/*
	public int selectLikeCount(int bno){
		
		Connection conn = getConnection();
		
		int likeCount = new BoardDao().selectLikeCount(conn, bno);
		
		 close(conn);
		
		 return likeCount;
	}
*/	
		public Category selectCategory(int bno) {
			
		Connection conn = getConnection();
		
		Category category = new BoardDao().selectCategory(conn, bno);
		
		 close(conn);
		
		 return category;
	}


	
		public Board selectBoard(int bno) {
		
		Connection conn = getConnection();
		
		Board board = new BoardDao().selectBoard(conn, bno);
		
		 close(conn);
		
		 return board;
	}
		
		public ArrayList<Category> selectCategoryList() {
			
			Connection conn = getConnection();
			
			ArrayList<Category> cList = new BoardDao().selectCategoryList(conn);
			
			 close(conn);
			
			 return cList;
		}
		
	public ArrayList<Board> selectSwiperBestBoardList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectSwiperBestBoardList(conn);
		close(conn);
		
		return list;
	}
	
	public int insertBoard(Board board, ArrayList<File> fList) {
		
		Connection conn = getConnection();
		
		int boardInsert = new BoardDao().insertBoard(conn, board);
		int fileInsert = new BoardDao().insertFileList(conn, fList);
		
		// 둘은 동시에 성공해야 commit
		if(boardInsert*fileInsert > 0) commit(conn);
		else rollback(conn);

		return (boardInsert*fileInsert);
	}
	
/*	
	public int checkClickLike(int boardNo, int userNo) {
		
		
		Connection conn = getConnection();
		
		int clickLike = new BoardDao().checkClickLike(conn, boardNo, userNo);
		
		 close(conn);
		
		 return clickLike;
		 
	}
	
	public int increaseLikeCount(int boardNo, int userNo) {
		
		
		Connection conn = getConnection();
		
		int increasedCount = new BoardDao().increaseLikeCount(conn, boardNo, userNo);
		
		 if(increasedCount > 0) commit(conn);
		 else rollback(conn);

		close(conn);
		
		 return increasedCount;

	}
	
	public int decreaseLikeCount(int boardNo, int userNo) {
		
		
		Connection conn = getConnection();
		
		int decreasedCount = new BoardDao().decreaseLikeCount(conn, boardNo, userNo);
		
		 if(decreasedCount > 0) commit(conn);
		 else rollback(conn);

		close(conn);
		
		 return decreasedCount;
		
		
	}
*/	


}
