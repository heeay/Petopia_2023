package petopia.com.kh.jsp.info.model.service;

import java.util.ArrayList;

import petopia.com.kh.jsp.board.model.vo.Like;
import petopia.com.kh.jsp.common.model.vo.PageInfo;
import petopia.com.kh.jsp.info.model.vo.Info;
import petopia.com.kh.jsp.info.model.vo.InfoCategory;
import petopia.com.kh.jsp.info.model.vo.InfoComment;
import petopia.com.kh.jsp.info.model.vo.InfoFile;

public class InfoServiceImpl implements InfoService {

	@Override
	public ArrayList<InfoCategory> selectInfoCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertShareInfo(Info in, int star, ArrayList<InfoFile> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectListCount(int ctgNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Info> selectList(PageInfo pi, int ctgNo) {
		// TODO Auto-generated method stub
		return null;
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
