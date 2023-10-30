package petopia.com.kh.jsp.info.model.dao;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.board.model.vo.Like;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoComment;
import petopia.com.kh.jsp.info.model.vo.InfoFile;
public class InfoDao {
	
    // 게시글 작성 폼에서 카테고리 리스트를 보여줄 메소드
    public ArrayList<InfoCategory> selectInfoCategory(SqlSession sqlSession) {
        return (ArrayList)sqlSession.selectList("infoMapper.selectInfoCategory");
    }
    
    //  현재까지 등록된 마지막 파일 번호를 알려줄 메소드
    public int selectFileNo(SqlSession sqlSession) {
    	return sqlSession.selectOne("infoMapper.selectFileNo");
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
    
    // 게시글 리스트 조회
    public ArrayList<Info> selectList(SqlSession sqlSession, int ctgNo, RowBounds rowBounds) {
        return (ArrayList)sqlSession.selectList("infoMapper.selectList", ctgNo, rowBounds);
    }
    
    // 상세게시글 조회
    public Info selectShare(SqlSession sqlSession, int infoNo) {
        return sqlSession.selectOne("infoMapper.selectShare", infoNo);
    }
    
    // 상세게시글에 있는 파일리스트 조회
    public ArrayList<InfoFile> selectInfoFileList(SqlSession sqlSession, int infoNo) {
        return (ArrayList)sqlSession.selectList("infoMapper.selectInfoFileList", infoNo);
    }
    
    // 게시글 삭제
    public int deleteShare(SqlSession sqlSession, int infoNo) {
        return sqlSession.update("infoMapper.deleteShare", infoNo);
    }
    
    // 좋아요 Y인지
    public int checkLike(SqlSession sqlSession, HashMap<String, Integer> map) {
        return sqlSession.selectOne("infoMapper.checkLike", map);
    }
    
    // 좋아요 N인지
    public int checkNoLike(SqlSession sqlSession, HashMap<String, Integer> map) {
        return sqlSession.selectOne("infoMapper.checkNoLike", map);
    }
    
    // 좋아요 insert
    public int insertLike(SqlSession sqlSession, Like like) {
        return sqlSession.insert("infoMapper.insertLike", like);
    }
    
    // like Y -> N으로 update
    public int deleteLike(SqlSession sqlSession, HashMap<String, Integer> map) {
        return sqlSession.update("infoMapper.deleteLike", map);
    }
    
    // like N -> Y로 update
    public int updateLike(SqlSession sqlSession, HashMap<String, Integer> map) {
        return sqlSession.update("infoMapper.updateLike", map);
    }
    // 해당 게시글의 좋아요 수
    public int countLike(SqlSession sqlSession, int infoNo) {
        return sqlSession.selectOne("infoMapper.countLike", infoNo);
    }
    
    // 게시글 수정
    public int updateInfo(SqlSession sqlSession, Info in) {
        return sqlSession.update("infoMapper.updateInfo", in);
    }
    
    // 기존 게시글 작성 시 첨부했던 파일들 삭제
    public int deleteOriginFile(SqlSession sqlSession, int infoNo) {
        return sqlSession.delete("infoMapper.deleteOriginFile", infoNo);
    }
    
    // 게시글 수정 시 새로 첨부한 파일 insert
    public int insertNewFile(SqlSession sqlSession, ArrayList<InfoFile> list) {
        return sqlSession.insert("infoMapper.insertNewFile", list);
    }
    
    // 게시글 수정 시 별점 수정
    public int updateStar(SqlSession sqlSession, HashMap<String, Integer> map) {
        return sqlSession.update("infoMapper.updateStar", map);
    }
    
    // 댓글 작성
    public int insertComment(SqlSession sqlSession, InfoComment comment) {
        return sqlSession.insert("infoMapper.insertComment", comment);
    }
    
    // 댓글 리스트 조회
    public ArrayList<InfoComment> selectCommentList(SqlSession sqlSession, int infoNo) {
        return (ArrayList)sqlSession.selectList("infoMapper.selectCommentList", infoNo);
    }
    
}
