package petopia.com.kh.jsp.info.model.service;

import java.util.ArrayList;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<InfoFile> selectInfoFileList(int infoNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteShare(int infoNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkLike(int infoNo, int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkNoLike(int infoNo, int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLike(int infoNo, int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLike(int infoNo, int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countLike(int infoNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInfo(Info in, ArrayList<InfoFile> list, int star, int infoNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertComment(InfoComment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<InfoComment> selectCommentList(int infoNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
