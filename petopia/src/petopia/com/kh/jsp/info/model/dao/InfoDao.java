package petopia.com.kh.jsp.info.model.dao;

import static petopia.com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petopia.com.kh.jsp.board.model.vo.Like;
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoComment;
import petopia.com.kh.jsp.info.model.vo.InfoFile;

public class InfoDao {
	
	private Properties prop = new Properties();
	
	// 기본생성자
	public InfoDao() {
		String filePath = InfoDao.class.getResource("/sql/info/info-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	/**
	 * 게시글 작성 폼에서 카테고리 리스트를 보여줄 메소드
	 */
	public ArrayList<InfoCategory> selectInfoCategory(Connection conn) {
		
		ArrayList<InfoCategory> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInfoCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new InfoCategory(rset.getInt("CTG_NO"),
										  rset.getString("CTG_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**
	 * 게시글을 INSERT할 메소드
	 * @param in : 게시글에 대한 정보가 담긴 Info VO
	 * @return result (성공했을 때 1 / 실패했을 때 0 반환)
	 */
	public int insertShareInfo(Connection conn, Info in) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertShareInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, in.getInfoTitle()); // 작성한 게시글 제목
			pstmt.setString(2, in.getInfoContent()); // 작성한 게시글 내용
			pstmt.setInt(3, in.getUserNo()); // 작성자 번호
			pstmt.setInt(4, Integer.parseInt(in.getCategory())); // 카테고리 번호
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 별점을 INSERT할 메소드
	 * @param star : 별점 (1 ~ 5)
	 * @return 성공했을 때 1 반환
	 */
	public int insertStar(Connection conn, int star) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertStar");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, star); // 별점
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 첨부파일을 INSERT하는 메소드
	 * @param list : 여러 개의 첨부파일이 담겨있는 list
	 * @return 성공했을 때 1 반환
	 */
	public int insertFileList(Connection conn, ArrayList<InfoFile> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFileList");
		
		try {
			for(InfoFile infoFile : list) { // list의 요소를 순서대로 InfoFile 객체에 담음
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, infoFile.getOriginalName()); // 파일 원본명
				pstmt.setString(2, infoFile.getUploadName()); // 파일 수정명
				pstmt.setString(3, infoFile.getFilePath()); // 파일 경로
				pstmt.setInt(4, infoFile.getFileLevel()); // 파일 레벨(썸네일 1, 나머지 2)
				
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 게시글 수를 돌려줄 메소드
	 * @return 게시글 수
	 */
	public int selectListCount(Connection conn, int ctgNo) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ctgNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("BOARD_COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Info> selectList(Connection conn, PageInfo pi, int ctgNo) {
		
		ArrayList<Info> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, ctgNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Info i = new Info();
				i.setInfoNo(rset.getInt("BOARD_NO"));
				i.setInfoTitle(rset.getString("BOARD_TITLE"));
				i.setInfoContent(rset.getString("SUB_CONTENT"));
				i.setTitleImg(rset.getString("TITLE_IMG"));
				
				list.add(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
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
	
}
