package petopia.com.kh.jsp.board.model.dao;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.board.model.vo.Category;
import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.common.template.Template;

public class BoardDao {

	
	public int selectBoardCount() {

		
		
	}

	
	public ArrayList<Board> selectSwiperBestBoardList() {

		

		
	}
	
	
	public ArrayList<Board> selectBoardList() {
		
	}

	
	public int increaseViewCount(int boardNo) {

	}

	
	public Board selectBoard(int boardNo) {
		
	}

	
	public ArrayList<File> selectFileList(int boardNo) {
		
	}


	public Category selectCategory(int boardNo) {
		
	}

	
	public int insertBoard() {
		
	}


}//class
