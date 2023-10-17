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
	private String fileImg;
	private int ctgNo; // Category테이블과 연결
	private int petCtgNo; // Pet_Category테이블과 연결
	private String boardStatus;
	private int likeCount;// DEFAULT가 0인데 INSERT할 때 넣어야 하나?
	
	public Board() {
		super();
	}
	public Board(int boardNo, String boardTitle, String boardContent, int boardViews, Date boardCreateDate,
			Date boardUpdateDate, int userNo, String fileImg, int ctgNo, int petCtgNo, String boardStatus,
			int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardViews = boardViews;
		this.boardCreateDate = boardCreateDate;
		this.boardUpdateDate = boardUpdateDate;
		this.userNo = userNo;
		this.fileImg = fileImg;
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
	public String getFileImg() {
		return fileImg;
	}
	public void setFileImg(String fileImg) {
		this.fileImg = fileImg;
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
				+ boardUpdateDate + ", userNo=" + userNo + ", fileImg=" + fileImg + ", ctgNo=" + ctgNo + ", petCtgNo="
				+ petCtgNo + ", boardStatus=" + boardStatus + ", likeCount=" + likeCount + "]";
	}
	
	
}
	