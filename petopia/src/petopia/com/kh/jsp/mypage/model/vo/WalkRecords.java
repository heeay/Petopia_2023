package petopia.com.kh.jsp.mypage.model.vo;

import java.sql.Date;

public class WalkRecords {
	
	private int walkNo;			//WALK_NO	NUMBER
	private String walkDate;		//WALK_DATE	DATE
	private String walkContent;	//WALK_CONTENT	VARCHAR2(4000 BYTE)
	private String walkTitle;	//WALK_TITLE	VARCHAR2(300 BYTE)
	private int petNo;			//PET_NO	NUMBER
	private int fileNo;			//FILE_NO	NUMBER
	
	private String startDate;
	private String endDate;
	private int rowNum;
	
	private String petName;
	
	public WalkRecords() {
		super();
	}

	public WalkRecords(int walkNo, String walkDate, String walkContent, String walkTitle, int petNo, int fileNo,
			String startDate, String endDate, int rowNum, String petName) {
		super();
		this.walkNo = walkNo;
		this.walkDate = walkDate;
		this.walkContent = walkContent;
		this.walkTitle = walkTitle;
		this.petNo = petNo;
		this.fileNo = fileNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.rowNum = rowNum;
		this.petName = petName;
	}


	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getWalkNo() {
		return walkNo;
	}
	public void setWalkNo(int walkNo) {
		this.walkNo = walkNo;
	}
	public String getWalkDate() {
		return walkDate;
	}
	public void setWalkDate(String walkDate) {
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
				+ ", walkTitle=" + walkTitle + ", petNo=" + petNo + ", fileNo=" + fileNo + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", rowNum=" + rowNum + ", petName=" + petName + "]";
	}

}
