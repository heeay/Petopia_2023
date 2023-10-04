package petopia.com.kh.jsp.mypage.model.vo;

import java.sql.Date;

public class WalkRecords {
	
	private int walkNo;			//WALK_NO	NUMBER
	private Date walkDate;		//WALK_DATE	DATE
	private String walkContent;	//WALK_CONTENT	VARCHAR2(4000 BYTE)
	private String walkTitle;	//WALK_TITLE	VARCHAR2(300 BYTE)
	private int petNo;			//PET_NO	NUMBER
	private int fileNo;			//FILE_NO	NUMBER
	
	public WalkRecords() {
		super();
	}
	
	public WalkRecords(int walkNo, Date walkDate, String walkContent, String walkTitle, int petNo, int fileNo) {
		super();
		this.walkNo = walkNo;
		this.walkDate = walkDate;
		this.walkContent = walkContent;
		this.walkTitle = walkTitle;
		this.petNo = petNo;
		this.fileNo = fileNo;
	}
	
	public int getWalkNo() {
		return walkNo;
	}
	public void setWalkNo(int walkNo) {
		this.walkNo = walkNo;
	}
	public Date getWalkDate() {
		return walkDate;
	}
	public void setWalkDate(Date walkDate) {
		this.walkDate = walkDate;
	}
	public String getWalkContent() {
		return walkContent;
	}
	public void setWalkContent(String walkContent) {
		this.walkContent = walkContent;
	}
	public String getWalkTitle() {
		return walkTitle;
	}
	public void setWalkTitle(String walkTitle) {
		this.walkTitle = walkTitle;
	}
	public int getPetNo() {
		return petNo;
	}
	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	
	@Override
	public String toString() {
		return "WalkRecords [walkNo=" + walkNo + ", walkDate=" + walkDate + ", walkContent=" + walkContent
				+ ", walkTitle=" + walkTitle + ", petNo=" + petNo + ", fileNo=" + fileNo + "]";
	}
	
}
