package petopia.com.kh.jsp.info.model.service;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.dao.InfoDao;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoFile;
import petopia.com.kh.jsp.user.model.vo.User;

public class InfoService {
	
	/**
	 * 게시글 작성 폼에서 카테고리 리스트를 보여줄 메소드
	 */
	public ArrayList<InfoCategory> selectInfoCategory() {
		
		// Connection 객체 생성 (JDBCTemplate을 import해서)
		Connection conn = getConnection();
		
		// InfoDao의 selectInfoCategory를 호출해서 받아온 값을 list에 담음
		ArrayList<InfoCategory> list = new InfoDao().selectInfoCategory(conn);
		
		// 사용이 끝난 Connection 객체 닫음
		close(conn);
		
		// list 반환
		return list;
	}
	/**
	 * 게시글을 INSERT하는 메소드
	 * @param in : 작성한 게시글 정보를 담은 Info VO
	 * @param star : 별점수 (1 ~ 5)
	 * @param list : 첨부한 파일 리스트
	 * @return : 세 개 다 성공했을 때만 1을 돌려줌
	 */
	public int insertShareInfo(Info in, int star, ArrayList<InfoFile> list) {
		
		Connection conn = getConnection();
		
		int result1 = new InfoDao().insertShareInfo(conn, in); // 게시글 INSERT
		
		int result2 = new InfoDao().insertStar(conn, star); // 별점 INSERT
		
		int result3 = new InfoDao().insertFileList(conn, list); // 첨부파일 INSERT
		
		if((result1 * result2 * result3) > 0) { // 세 개 다 성공했을 때만 commit
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn); // Connection 객체 반납
		
		return (result1 * result2 * result3);
	}

	/**
	 * 게시글 수를 돌려줄 메소드
	 * @return 게시글 수
	 */
	public int selectListCount(int ctgNo) {
		
		Connection conn = getConnection();
		
		int listCount = new InfoDao().selectListCount(conn, ctgNo);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Info> selectList(PageInfo pi, int ctgNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Info> list = new InfoDao().selectList(conn, pi, ctgNo);
		
		close(conn);
		
		return list;
	}
	
	public Info selectShare(int infoNo) {
		
		Connection conn = getConnection();
		
		Info in = new InfoDao().selectShare(conn, infoNo);
		
		close(conn);
		
		return in;
	}
	
	public ArrayList<InfoFile> selectInfoFileList(int infoNo) {
		
		Connection conn = getConnection();
		
		ArrayList<InfoFile> list = new InfoDao().selectInfoFileList(conn, infoNo);
		
		close(conn);
		
		return list;
	}
	
	public int deleteShare(int infoNo) {
		
		Connection conn = getConnection();
		
		int result = new InfoDao().deleteShare(conn, infoNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int selectUser(int infoNo, int userNo) {
		
		Connection conn = getConnection();
		
		int countUser = new InfoDao().selectUser(conn, infoNo, userNo);
		
		close(conn);
		
		return countUser;
	}
	
	public int insertLike(int infoNo, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new InfoDao().insertLike(conn, infoNo, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int deleteLike(int infoNo, int userNo) {
			
			Connection conn = getConnection();
			
			int result = new InfoDao().deleteLike(conn, infoNo, userNo);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}
	
	public int countLike(int infoNo) {
		
		Connection conn = getConnection();
		
		int count = new InfoDao().countLike(conn, infoNo);
		
		close(conn);
		
		return count;
	}
	
	
	
}
