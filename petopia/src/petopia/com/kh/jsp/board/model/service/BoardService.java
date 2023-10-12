package petopia.com.kh.jsp.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.board.model.dao.BoardDao;
import petopia.com.kh.jsp.board.model.vo.Board;
import static petopia.com.kh.jsp.common.JDBCTemplate.*;
import petopia.com.kh.jsp.common.model.vo.PageInfo;

public class BoardService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		 close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn =  getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		 close(conn);
		
		return list;
	}
	
	public int increaseViewsCount(int bno) {
		
		Connection conn = getConnection();
		
		int increaseCount = new BoardDao().increaseViewsCount(conn, bno);
		
		
		if(increaseCount > 0) commit(conn);
		else rollback(conn);
		close(conn);
		
		return increaseCount;
	}
	
	public Board selectBoard(int bno) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, bno);
		
		close(conn);
		
		return b;
	}
	
	

	
	
	
	
	
	
	
	
}
