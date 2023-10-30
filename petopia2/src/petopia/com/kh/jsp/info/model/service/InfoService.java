package petopia.com.kh.jsp.info.model.service;
import java.util.ArrayList;
import java.util.HashMap;

import petopia.com.kh.jsp.board.model.vo.Like;
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoComment;
import petopia.com.kh.jsp.info.model.vo.InfoFile;
public interface InfoService {
    
    // 게시글 작성 폼에서 카테고리 리스트를 보여줄 메소드
    ArrayList<InfoCategory> selectInfoCategory();
    
    // 게시글을 INSERT하는 메소드
    int insertShareInfo(Info in, int star, ArrayList<InfoFile> list);
    
    // 게시글 수를 돌려줄 메소드
    int selectListCount(int ctgNo);
    
    // 게시글 리스트
    ArrayList<Info> selectList(int ctgNo, PageInfo pi);
    
    // 게시글 상세
    Info selectShare(int infoNo);
    
    // 사진 파일 리스트
    ArrayList<InfoFile> selectInfoFileList(int infoNo);
    
    // 게시글 삭제
    int deleteShare(int infoNo);
    
    // 좋아요 눌렀는지 체크 (눌렀으면 1 반환)
    int checkLike(HashMap<String, Integer> map);
    
    // 좋아요가 N인지 체크 (N이면 1 반환)
    int checkNoLike(HashMap<String, Integer> map);
    
    // 좋아요 insert
    int insertLike(Like like);
    
    // 좋아요 삭제
    int deleteLike(HashMap<String, Integer> map);
    
    // 좋아요 update
    int updateLike(HashMap<String, Integer> map);
    
    // 좋아요 수
    int countLike(int infoNo);
    
    // 게시글 업데이트
    int updateInfo(Info in, ArrayList<InfoFile> list, int infoNo, HashMap<String, Integer> map);
    
    // 댓글 작성
    int insertComment(InfoComment comment);
    
    // 댓글 리스트
    ArrayList<InfoComment> selectCommentList(int infoNo);
    
}
