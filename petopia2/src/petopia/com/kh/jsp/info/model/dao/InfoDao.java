package petopia.com.kh.jsp.info.model.dao;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoFile;

public class InfoDao {

	// 게시글 작성 폼에서 카테고리 리스트를 보여줄 메소드
	public ArrayList<InfoCategory> selectInfoCategory(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("infoMapper.selectInfoCategory");
	}
	
	//게시글을 INSERT할 메소드
	public int insertShareInfo(SqlSession sqlSession, Info in) {
		return sqlSession.insert("infoMapper.insertShareInfo", in);
	}
	
	// 별점을 INSERT할 메소드
	public int insertStar(SqlSession sqlSession, int star) {
		return sqlSession.insert("infoMapper.insertStar", star);
	}
	
	// 첨부파일을 INSERT하는 메소드
	public int insertFileList(SqlSession sqlSession, ArrayList<InfoFile> list) {
		return sqlSession.insert("infoMapper.insertFileList", list);
	}
	
	// 게시글 수를 돌려줄 메소드
	public int selectListCount(SqlSession sqlSession, int ctgNo) {
		return sqlSession.selectOne("infoMapper.selectListCount", ctgNo);
	}
	
	public ArrayList<Info> selectList(SqlSession sqlSession, int ctgNo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("infoMapper.selectList", ctgNo, rowBounds);
	}
	
	/*
	public Info selectShare(Connection conn, int infoNo) {
		
		Info in = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShare");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				in = new Info();
				in.setInfoNo(rset.getInt("BOARD_NO"));
				in.setCategoryNo(rset.getInt("CTG_NO"));
				in.setInfoTitle(rset.getString("BOARD_TITLE"));
				in.setInfoContent(rset.getString("BOARD_CONTENT"));
				in.setInfoCreateDate(rset.getDate("BOARD_CREATE_DATE"));
				in.setInfoWriter(rset.getString("USER_NICKNAME"));
				in.setStarScore(rset.getInt("STAR_SCORE"));
				in.setCategory(rset.getString("CTG_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return in;
	}
	
	public ArrayList<InfoFile> selectInfoFileList(Connection conn, int infoNo) {
		
		ArrayList<InfoFile> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInfoFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				InfoFile infoFile = new InfoFile();
				infoFile.setFileNo(rset.getInt("FILE_NO"));
				infoFile.setOriginalName(rset.getString("ORIGINAL_NAME"));
				infoFile.setUploadName(rset.getString("UPLOAD_NAME"));
				infoFile.setFilePath(rset.getString("FILE_PATH"));
				list.add(infoFile);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int deleteShare(Connection conn, int infoNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteShare");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int checkLike(Connection conn, int infoNo, int userNo) {
		
		int check = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, infoNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return check;
	}
	
	public int checkNoLike(Connection conn, int infoNo, int userNo) {
		
		int checkNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkNoLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, infoNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				checkNo = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return checkNo;
	}
	
	public int insertLike(Connection conn, Like like) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, like.getBoardNo());
			pstmt.setInt(2, like.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteLike(Connection conn, int infoNo, int userNo) {
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteLike");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, infoNo);
				pstmt.setInt(2, userNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	
	public int updateLike(Connection conn, int infoNo, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			pstmt.setInt(2, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int countLike(Connection conn, int infoNo) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("countLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, infoNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}
	
	public int updateInfo(Connection conn, Info in) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, in.getInfoTitle());
			pstmt.setString(2, in.getInfoContent());
			pstmt.setInt(3, Integer.parseInt(in.getCategory()));
			pstmt.setInt(4, in.getInfoNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 기존 게시글 작성 시 첨부했던 파일들 삭제
	public int deleteOriginFile(Connection conn, int infoNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteOriginFile");
		
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, infoNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 게시글 수정 시 새로 첨부한 파일 insert
	public int insertNewFile(Connection conn, ArrayList<InfoFile> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewFile");
		
		try {
			for(InfoFile infoFile : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, infoFile.getRefBno());
				pstmt.setString(2, infoFile.getOriginalName());
				pstmt.setString(3, infoFile.getUploadName());
				pstmt.setString(4, infoFile.getFilePath());
				pstmt.setInt(5, infoFile.getFileLevel());
				
				result *= pstmt.executeUpdate();	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateStar(Connection conn, int star, int infoNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateStar");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, star);
			pstmt.setInt(2, infoNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertComment(Connection conn, InfoComment comment) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, comment.getCommentContent());
			pstmt.setInt(2, comment.getUserNo());
			pstmt.setInt(3, comment.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;	
	}
	
	public ArrayList<InfoComment> selectCommentList(Connection conn, int infoNo) {
		
		ArrayList<InfoComment> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, infoNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				InfoComment comment = new InfoComment();
				comment.setCommentNo(rset.getInt("COMMENT_NO"));
				comment.setCommentContent(rset.getString("COMMENT_CONTENT"));
				comment.setCommentCreateDate(rset.getDate("COMMENT_CREATE_DATE"));
				comment.setUserNickname(rset.getString("USER_NICKNAME"));
				
				list.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	*/
	
}
