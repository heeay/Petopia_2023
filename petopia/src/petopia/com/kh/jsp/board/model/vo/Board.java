package petopia.com.kh.jsp.board.model.vo;

import java.sql.Date;

public class Board {

	private int boardNo; // File테이블, count(Like테이블)과 연결
	// sql : select count(*) from tb_like where bno and like_yn = 'y' = ? 
	private String boardTitle;
	private String boardContent;
	private int boardViews;
	private Date boardCreateDate;
	private Date boardUpdateDate;
	private int userNo; // User테이블,(Like테이블과 연결 : 안해도 될듯)
	private int fileNo;
	private int ctgNo; // Category테이블과 연결
	private int petCtgNo; // Pet_Category테이블과 연결
	private String boardStatus;
	private int likeCount;
	
	public Board() {
		super();
	}

	public Board(int boardNo, String boardTitle, String boardContent, int boardViews, Date boardCreateDate,
			Date boardUpdateDate, int userNo, int fileNo, int ctgNo, int petCtgNo, String boardStatus,
			int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardViews = boardViews;
		this.boardCreateDate = boardCreateDate;
		this.boardUpdateDate = boardUpdateDate;
		this.userNo = userNo;
		this.fileNo = fileNo;
		this.ctgNo = ctgNo;
		this.petCtgNo = petCtgNo;
		this.boardStatus = boardStatus;
		this.likeCount = likeCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public Date getBoardUpdateDate() {
		return boardUpdateDate;
	}

	public void setBoardUpdateDate(Date boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getCtgNo() {
		return ctgNo;
	}

	public void setCtgNo(int ctgNo) {
		this.ctgNo = ctgNo;
	}

	public int getPetCtgNo() {
		return petCtgNo;
	}

	public void setPetCtgNo(int petCtgNo) {
		this.petCtgNo = petCtgNo;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardViews=" + boardViews + ", boardCreateDate=" + boardCreateDate + ", boardUpdateDate="
				+ boardUpdateDate + ", userNo=" + userNo + ", fileNo=" + fileNo + ", ctgNo=" + ctgNo + ", petCtgNo="
				+ petCtgNo + ", boardStatus=" + boardStatus + ", likeCount=" + likeCount + "]";
	}
	
	

			
	//	BOARD_NO		NUMBER				게시글번호
	//	BOARD_TITLE		VARCHAR2(100 BYTE)	게시판 제목
	//	BOARD_CONTENT	VARCHAR2(4000 BYTE)	게시글 내용
	//	BOARD_VIEWS			NUMBER			조회수
	//	BOARD_CREATE_DATE	DATE			작성일
	//	BOARD_UPDATE_DATE	DATE			수정일
	//	USER_NO				NUMBER			작성자번호
	//	FILE_NO				NUMBER			첨부파일번호
	//	CTG_NO				NUMBER			카테고리번호
	//	PET_CTG_NO			NUMBER			종카테고리번호
	
	
	
	
	
	
	
	
	
	
	
	
	
}
