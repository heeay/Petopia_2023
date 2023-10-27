package petopia.com.kh.jsp.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.board.model.dao.BoardDao;
import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.board.model.vo.Category;
import petopia.com.kh.jsp.common.model.vo.File;
import petopia.com.kh.jsp.common.template.Template;

public class BoardServiceImpl implements BoardService {

		BoardDao boardDao = new BoardDao();

		@Override
		public int selectBoardCount() {

			SqlSession sqlSession = Template.getSqlSession();
			
			int result = boardDao.selectBoardCount();
			
			sqlSession.close();
			
			return result;
		}

		@Override
		public ArrayList<Board> selectSwiperBestBoardList() {

			SqlSession sqlSession = Template.getSqlSession();
			
			ArrayList<Board>  list = boardDao.selectSwiperBestBoardList();
			
			sqlSession.close();
			
			return list;

			
		}
		
		@Override
		public ArrayList<Board> selectBoardList() {
			SqlSession sqlSession = Template.getSqlSession();
			
			ArrayList<Board> list = boardDao.selectBoardList();
			
			sqlSession.close();
			
			return list;
		}

		@Override
		public int increaseViewCount(int boardNo) {
			SqlSession sqlSession = Template.getSqlSession();
			
			int result = boardDao.increaseViewCount(boardNo);
			
			sqlSession.close();
			
			return result;
		}

		@Override
		public Board selectBoard(int boardNo) {
			SqlSession sqlSession = Template.getSqlSession();
			
			Board b = boardDao.selectBoard(boardNo);
			
			sqlSession.close();
			
			return b;
		}

		@Override
		public ArrayList<File> selectFileList(int boardNo) {
			SqlSession sqlSession = Template.getSqlSession();
			
			ArrayList<File> list = boardDao.selectFileList(boardNo);
			
			sqlSession.close();
			
			return list;
		}

		@Override
		public Category selectCategory(int boardNo) {
			SqlSession sqlSession = Template.getSqlSession();
			
			Category c = boardDao.selectCategory(boardNo);
			
			sqlSession.close();
			
			return c;
		}

		@Override
		public int insertBoard() {
			SqlSession sqlSession = Template.getSqlSession();
			
			int result = boardDao.insertBoard();
			
			sqlSession.close();
			
			return result;
		}


		
	


	
}
