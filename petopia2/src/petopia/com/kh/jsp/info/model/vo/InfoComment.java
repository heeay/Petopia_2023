package petopia.com.kh.jsp.info.model.vo;

import java.sql.Date;

public class InfoComment {
	
	private int commentNo;
	private String commentContent;
	private Date commentCreateDate;
	private Date commentUpdateDate;
	private int userNo;
	private int boardNo;
	private int commentGroup;
	private int commentIndex;
	private int commentDepth;
	private String userNickname; // 유저 닉네임 가져오기 위한 변수
	
	public InfoComment() {
		super();
	}

	public InfoComment(int commentNo, String commentContent, Date commentCreateDate, Date commentUpdateDate, int userNo,
			int boardNo, int commentGroup, int commentIndex, int commentDepth, String userNickname) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentCreateDate = commentCreateDate;
		this.commentUpdateDate = commentUpdateDate;
		this.userNo = userNo;
		this.boardNo = boardNo;
		this.commentGroup = commentGroup;
		this.commentIndex = commentIndex;
		this.commentDepth = commentDepth;
		this.userNickname = userNickname;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentCreateDate() {
		return commentCreateDate;
	}

	public void setCommentCreateDate(Date commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}

	public Date getCommentUpdateDate() {
		return commentUpdateDate;
	}

	public void setCommentUpdateDate(Date commentUpdateDate) {
		this.commentUpdateDate = commentUpdateDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCommentGroup() {
		return commentGroup;
	}

	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
	}

	public int getCommentIndex() {
		return commentIndex;
	}

	public void setCommentIndex(int commentIndex) {
		this.commentIndex = commentIndex;
	}

	public int getCommentDepth() {
		return commentDepth;
	}

	public void setCommentDepth(int commentDepth) {
		this.commentDepth = commentDepth;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "InfoComment [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentCreateDate="
				+ commentCreateDate + ", commentUpdateDate=" + commentUpdateDate + ", userNo=" + userNo + ", boardNo="
				+ boardNo + ", commentGroup=" + commentGroup + ", commentIndex=" + commentIndex + ", commentDepth="
				+ commentDepth + ", userNickname=" + userNickname + "]";
	}
	
}
