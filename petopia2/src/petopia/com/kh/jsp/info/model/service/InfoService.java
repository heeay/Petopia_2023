package petopia.com.kh.jsp.info.model.service;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;
import static petopia.com.kh.jsp.common.JDBCTemplate.commit;
import static petopia.com.kh.jsp.common.JDBCTemplate.getConnection;
import static petopia.com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import petopia.com.kh.jsp.board.model.vo.Like;
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.dao.InfoDao;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoComment;
import petopia.com.kh.jsp.info.model.vo.InfoFile;

public interface InfoService {
	
	/**
	 * 게시글 작성 폼에서 카테고리 리스트를 보여줄 메소드
	 */
	ArrayList<InfoCategory> selectInfoCategory();
	
	// 게시글을 INSERT하는 메소드
	int insertShareInfo(Info in, int star, ArrayList<InfoFile> list);
	
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
	
	public int checkLike(int infoNo, int userNo) {
		
		Connection conn = getConnection();
		
		int check = new InfoDao().checkLike(conn, infoNo, userNo);
		
		close(conn);
		
		return check;
	}
	
	public int checkNoLike(int infoNo, int userNo) {
		
		Connection conn = getConnection();
		
		int checkNo = new InfoDao().checkNoLike(conn, infoNo, userNo);
		
		close(conn);
		
		return checkNo;
	}
	
	public int insertLike(Like like) {
		
		Connection conn = getConnection();
		
		int result = new InfoDao().insertLike(conn, like);
		
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
	
	public int updateLike(int infoNo, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new InfoDao().updateLike(conn, infoNo, userNo);
		
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
	
	public int updateInfo(Info in, ArrayList<InfoFile> list, int star, int infoNo) {
		
		Connection conn = getConnection();
		
		int result1 = new InfoDao().updateInfo(conn, in);
		
		int result2 = new InfoDao().deleteOriginFile(conn, infoNo);
		
		int	result3 = new InfoDao().insertNewFile(conn, list);
		
		int result4 = new InfoDao().updateStar(conn, star, infoNo);
		
		if((result1 * result2 * result3 * result4) > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2 * result3 * result4);
	}
	
	public int insertComment(InfoComment comment) {
		
		Connection conn = getConnection();
		
		int result = new InfoDao().insertComment(conn, comment);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<InfoComment> selectCommentList(int infoNo) {
		
		Connection conn = getConnection();
		
		ArrayList<InfoComment> list = new InfoDao().selectCommentList(conn, infoNo);
		
		close(conn);
		
		return list;
	}
	
}
