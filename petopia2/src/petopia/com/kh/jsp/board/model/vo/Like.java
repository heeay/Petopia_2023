package petopia.com.kh.jsp.board.model.vo;

public class Like {

	private int boardNo;
	private int userNo;
	private String likeYN;
	
	public Like() {
		super();
	}
	public Like(int boardNo, int userNo, String likeYN) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.likeYN = likeYN;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getLikeYN() {
		return likeYN;
	}
	public void setLikeYN(String likeYN) {
		this.likeYN = likeYN;
	}
	@Override
	public String toString() {
		return "Like [boardNo=" + boardNo + ", userNo=" + userNo + ", likeYN=" + likeYN + "]";
	}
	

}
