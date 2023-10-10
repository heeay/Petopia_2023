package petopia.com.kh.jsp.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.board.model.dao.BoardDao;
import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.common.JDBCTemplate;
import petopia.com.kh.jsp.common.model.vo.PageInfo;

public class BoardService {

	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new BoardDao().selectListCount(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, pi);
		
		return list;
	}
	
	
	
	
	
	
	
	
	
}
