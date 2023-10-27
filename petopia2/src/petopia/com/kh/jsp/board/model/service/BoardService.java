package petopia.com.kh.jsp.board.model.service;

import java.util.ArrayList;

import petopia.com.kh.jsp.board.model.vo.Board;
import petopia.com.kh.jsp.board.model.vo.Category;
import petopia.com.kh.jsp.common.model.vo.File;

public interface BoardService {

	// 게시판 조회
	
		// 전체게시글수 알아내기
	 	int selectBoardCount();
	 	
	 	// index에서 전체게시글리스트 조회
	 	ArrayList<Board> selectSwiperBestBoardList();
	 	
	 	// 전체게시글리스트 조회
	 	ArrayList<Board> selectBoardList();
	
	
	// 세부 조회
		
		// 조회수 증가
		int increaseViewCount();
			
			// board객체조회
			Board selectBoard();
			// fileList조회
			ArrayList<File> selectFileList();
			// category조회
			Category selectCategory();
	
	
	// 게시글 작성
	int insertBoard();
	
}
