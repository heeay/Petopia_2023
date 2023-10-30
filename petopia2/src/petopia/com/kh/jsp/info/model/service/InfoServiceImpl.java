package petopia.com.kh.jsp.info.model.service;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import petopia.com.kh.jsp.board.model.vo.Like;
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.common.template.Template;
import petopia.com.kh.jsp.info.model.dao.InfoDao;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoComment;
import petopia.com.kh.jsp.info.model.vo.InfoFile;
public class InfoServiceImpl implements InfoService {
    
    private InfoDao infoDao = new InfoDao();
    @Override
    public ArrayList<InfoCategory> selectInfoCategory() {
        SqlSession sqlSession = Template.getSqlSession();
        
        ArrayList<InfoCategory> list = infoDao.selectInfoCategory(sqlSession);
        
        sqlSession.close();
        
        return list;
    }
    @Override
    public int insertShareInfo(Info in, int star, ArrayList<InfoFile> list) {
        SqlSession sqlSession = Template.getSqlSession();
        
        int result1 = infoDao.insertShareInfo(sqlSession, in);
        int result2 = infoDao.insertStar(sqlSession, star);
        int result3 = infoDao.insertFileList(sqlSession, list);
        
        if((result1 * result2 * result3) > 0) {
            sqlSession.commit();
        } else {
            sqlSession.rollback();
        }
        
        sqlSession.close();
        
        return (result1 * result2 * result3);
    }
    @Override
    public int selectListCount(int ctgNo) {
        SqlSession sqlSession = Template.getSqlSession();
        
        int result = infoDao.selectListCount(sqlSession, ctgNo);
        
        sqlSession.close();
        
        return result;
    }
    @Override
    public ArrayList<Info> selectList(int ctgNo, PageInfo pi) {
        SqlSession sqlSession = Template.getSqlSession();
        
        RowBounds rowBounds = new RowBounds(((pi.getCurrentPage() - 1) * pi.getBoardLimit()), pi.getBoardLimit());
        ArrayList<Info> list = infoDao.selectList(sqlSession, ctgNo, rowBounds);
        
        sqlSession.close();
        
        return list;
    }
    @Override
    public Info selectShare(int infoNo) {
        SqlSession sqlSession = Template.getSqlSession();
        Info info = infoDao.selectShare(sqlSession, infoNo);
        sqlSession.close();
        return info;
    }
    @Override
    public ArrayList<InfoFile> selectInfoFileList(int infoNo) {
        SqlSession sqlSession = Template.getSqlSession();
        ArrayList<InfoFile> list = infoDao.selectInfoFileList(sqlSession, infoNo);
        sqlSession.close();
        return list;
    }
    @Override
    public int deleteShare(int infoNo) {
        SqlSession sqlSession = Template.getSqlSession();
        int result = infoDao.deleteShare(sqlSession, infoNo);
        if(result > 0) sqlSession.commit();
        
        sqlSession.close();
        return result;
    }
    @Override
    public int checkLike(HashMap<String, Integer> map) {
        SqlSession sqlSession = Template.getSqlSession();
        int check = infoDao.checkLike(sqlSession, map);
        sqlSession.close();
        return check;
    }
    @Override
    public int checkNoLike(HashMap<String, Integer> map) {
        SqlSession sqlSession = Template.getSqlSession();
        int checkNo = infoDao.checkNoLike(sqlSession, map);
        sqlSession.close();
        return checkNo;
    }
    @Override
    public int insertLike(Like like) {
        SqlSession sqlSession = Template.getSqlSession();
        int result = infoDao.insertLike(sqlSession, like);
        
        if(result > 0) sqlSession.commit();
        sqlSession.close();
        return result;
    }
    @Override
    public int deleteLike(HashMap<String, Integer> map) {
        SqlSession sqlSession = Template.getSqlSession();
        int result = infoDao.deleteLike(sqlSession, map);
        if(result > 0) sqlSession.commit();
        sqlSession.close();
        return result;
    }
    @Override
    public int updateLike(HashMap<String, Integer> map) {
        SqlSession sqlSession = Template.getSqlSession();
        int result = infoDao.updateLike(sqlSession, map);
        if(result > 0) sqlSession.commit();
        sqlSession.close();
        return result;
    }
    @Override
    public int countLike(int infoNo) {
        SqlSession sqlSession = Template.getSqlSession();
        int count = infoDao.countLike(sqlSession, infoNo);
        sqlSession.close();
        return count;
    }
    @Override
    public int updateInfo(Info in, ArrayList<InfoFile> list, int infoNo, HashMap<String, Integer> map) {
        SqlSession sqlSession = Template.getSqlSession();
        int result1 = infoDao.updateInfo(sqlSession, in);
        int result2 = infoDao.deleteOriginFile(sqlSession, infoNo);
        int result3 = infoDao.insertNewFile(sqlSession, list);
        int result4 = infoDao.updateStar(sqlSession, map);
        
        if((result1 * result2 * result3 * result4) > 0) {
            sqlSession.commit();
        } else {
            sqlSession.rollback();
        }
        
        sqlSession.close();
        
        return (result1 * result2 * result3 * result4);
    }
    @Override
    public int insertComment(InfoComment comment) {
        SqlSession sqlSession = Template.getSqlSession();
        int result = infoDao.insertComment(sqlSession, comment);
        if(result > 0) sqlSession.commit();
        sqlSession.close();
        return result;
    }
    @Override
    public ArrayList<InfoComment> selectCommentList(int infoNo) {
        SqlSession sqlSession = Template.getSqlSession();
        ArrayList<InfoComment> list = infoDao.selectCommentList(sqlSession, infoNo);
        
        sqlSession.close();
        
        return list;
    }
    
}
