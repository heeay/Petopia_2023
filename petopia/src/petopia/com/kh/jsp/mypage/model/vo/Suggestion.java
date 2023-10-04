package petopia.com.kh.jsp.mypage.model.vo;

import java.sql.Date;

public class Suggestion {

	private int sugNo;			//SUG_NO	NUMBER
	private String sugTitle;	//SUG_TITLE	VARCHAR2(100 BYTE)
	private String sugContent;	//SUG_CONTENT	VARCHAR2(2000 BYTE)
	private Date subDate;		//SUG_DATE	DATE
	private int userNo;			//USER_NO	NUMBER
	private int fileNo;			//FILE_NO	NUMBER
	
	public Suggestion() {
		super();
	}
	
	public Suggestion(int sugNo, String sugTitle, String sugContent, Date subDate, int userNo, int fileNo) {
		super();
		this.sugNo = sugNo;
		this.sugTitle = sugTitle;
		this.sugContent = sugContent;
		this.subDate = subDate;
		this.userNo = userNo;
		this.fileNo = fileNo;
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
	public Date getSubDate() {
		return subDate;
	}
	public void setSubDate(Date subDate) {
		this.subDate = subDate;
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
		return "Suggestion [sugNo=" + sugNo + ", sugTitle=" + sugTitle + ", sugContent=" + sugContent + ", subDate="
				+ subDate + ", userNo=" + userNo + ", fileNo=" + fileNo + "]";
	}
	
}
