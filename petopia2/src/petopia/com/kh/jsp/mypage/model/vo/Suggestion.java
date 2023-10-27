package petopia.com.kh.jsp.mypage.model.vo;

import java.sql.Date;

public class Suggestion {

	private int sugNo;			//SUG_NO	NUMBER
	private String sugTitle;	//SUG_TITLE	VARCHAR2(100 BYTE)
	private String sugContent;	//SUG_CONTENT	VARCHAR2(2000 BYTE)
	private String sugDate;		//SUG_DATE	DATE
	private int userNo;			//USER_NO	NUMBER
	private int fileNo;			//FILE_NO	NUMBER
	private String userEmail;
	private int ind;	
	
	public Suggestion() {
		super();
	}
	
	public Suggestion(int sugNo, String sugTitle, String sugContent, String sugDate, int userNo, int fileNo,
			String userEmail, int ind) {
		super();
		this.sugNo = sugNo;
		this.sugTitle = sugTitle;
		this.sugContent = sugContent;
		this.sugDate = sugDate;
		this.userNo = userNo;
		this.fileNo = fileNo;
		this.userEmail = userEmail;
		this.ind = ind;
	}

	public int getInd() {
		return ind;
	}
	public void setInd(int ind) {
		this.ind = ind;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getSugNo() {
		return sugNo;
	}
	public void setSugNo(int sugNo) {
		this.sugNo = sugNo;
	}
	public String getSugTitle() {
		return sugTitle;
	}
	public void setSugTitle(String sugTitle) {
		this.sugTitle = sugTitle;
	}
	public String getSugContent() {
		return sugContent;
	}
	public void setSugContent(String sugContent) {
		this.sugContent = sugContent;
	}
	public String getSugDate() {
		return sugDate;
	}
	public void setSugDate(String sugDate) {
		this.sugDate = sugDate;
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

	@Override
	public String toString() {
		return "Suggestion [sugNo=" + sugNo + ", sugTitle=" + sugTitle + ", sugContent=" + sugContent + ", sugDate="
				+ sugDate + ", userNo=" + userNo + ", fileNo=" + fileNo + ", userEmail=" + userEmail + ", ind=" + ind
				+ "]";
	}

}
