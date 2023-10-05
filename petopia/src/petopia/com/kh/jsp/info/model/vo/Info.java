package petopia.com.kh.jsp.info.model.vo;

import java.sql.Date;

public class Info {
	
	private int infoNo; // BOARD_NO	NUMBER
	private String infoTitle; // BOARD_TITLE	VARCHAR2(100 BYTE)
	private String infoContent; // BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private int infoViews; // BOARD_VIEWS	NUMBER
	private Date infoCreateDate; // BOARD_CREATE_DATE	DATE
	private Date infoUpdateDate; // BOARD_UPDATE_DATE	DATE
	private int userNo; // USER_NO	NUMBER
	private int fileNo; // FILE_NO	NUMBER
	private int categoryNo; // CTG_NO	NUMBER
	private int petCategoryNo; // PET_CTG_NO	NUMBER
	private String category;
	
	public Info() {
		super();
	}

	public Info(int infoNo, String infoTitle, String infoContent, int infoViews, Date infoCreateDate,
			Date infoUpdateDate, int userNo, int fileNo, int categoryNo, int petCategoryNo, String category) {
		super();
		this.infoNo = infoNo;
		this.infoTitle = infoTitle;
		this.infoContent = infoContent;
		this.infoViews = infoViews;
		this.infoCreateDate = infoCreateDate;
		this.infoUpdateDate = infoUpdateDate;
		this.userNo = userNo;
		this.fileNo = fileNo;
		this.categoryNo = categoryNo;
		this.petCategoryNo = petCategoryNo;
		this.category = category;
	}

	public int getInfoNo() {
		return infoNo;
	}

	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}

	public String getInfoTitle() {
		return infoTitle;
	}

	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}

	public String getInfoContent() {
		return infoContent;
	}

	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}

	public int getInfoViews() {
		return infoViews;
	}

	public void setInfoViews(int infoViews) {
		this.infoViews = infoViews;
	}

	public Date getInfoCreateDate() {
		return infoCreateDate;
	}

	public void setInfoCreateDate(Date infoCreateDate) {
		this.infoCreateDate = infoCreateDate;
	}

	public Date getInfoUpdateDate() {
		return infoUpdateDate;
	}

	public void setInfoUpdateDate(Date infoUpdateDate) {
		this.infoUpdateDate = infoUpdateDate;
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

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getPetCategoryNo() {
		return petCategoryNo;
	}

	public void setPetCategoryNo(int petCategoryNo) {
		this.petCategoryNo = petCategoryNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Info [infoNo=" + infoNo + ", infoTitle=" + infoTitle + ", infoContent=" + infoContent + ", infoViews="
				+ infoViews + ", infoCreateDate=" + infoCreateDate + ", infoUpdateDate=" + infoUpdateDate + ", userNo="
				+ userNo + ", fileNo=" + fileNo + ", categoryNo=" + categoryNo + ", petCategoryNo=" + petCategoryNo
				+ ", category=" + category + "]";
	}
	
}
