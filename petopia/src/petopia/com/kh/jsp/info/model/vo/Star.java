package petopia.com.kh.jsp.info.model.vo;

public class Star {

	private int boardNo;
	private int starScore;
	
	public Star() {
		super();
	}

	public Star(int boardNo, int starScore) {
		super();
		this.boardNo = boardNo;
		this.starScore = starScore;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getStarScore() {
		return starScore;
	}

	public void setStarScore(int starScore) {
		this.starScore = starScore;
	}

	@Override
	public String toString() {
		return "Star [boardNo=" + boardNo + ", starScore=" + starScore + "]";
	}
	
}
