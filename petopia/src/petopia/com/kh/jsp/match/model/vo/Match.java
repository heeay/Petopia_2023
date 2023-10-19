package petopia.com.kh.jsp.match.model.vo;

import java.sql.Date;

public class Match {
	
	private int meetBoardNo; 
	private String meetBoardTitle;
	private String petInfo;
	private String hopeActivity;
	private int meetBoardViews;
	private Date meetBoardCreateDate;
	private Date meetBoardUpdateDate;
	private String status;
	private int userNo;
	private int petNo;
	private int fileNo;
	private String titleImg;
	private String userNickname;
	private String PetName;
	
	public String getPetName() {
		return PetName;
	}
	public void setPetName(String petName) {
		PetName = petName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public Match() {
		super();
	}
	public Match(int meetBoardNo, String meetBoardTitle, String petInfo, String hopeActivity, int meetBoardViews,
			Date meetBoardCreateDate, Date meetBoardUpdateDate, String status, int userNo, int petNo, int fileNo) {
		super();
		this.meetBoardNo = meetBoardNo;
		this.meetBoardTitle = meetBoardTitle;
		this.petInfo = petInfo;
		this.hopeActivity = hopeActivity;
		this.meetBoardViews = meetBoardViews;
		this.meetBoardCreateDate = meetBoardCreateDate;
		this.meetBoardUpdateDate = meetBoardUpdateDate;
		this.status = status;
		this.userNo = userNo;
		this.petNo = petNo;
		this.fileNo = fileNo;
	}
	public int getMeetBoardNo() {
		return meetBoardNo;
	}
	public void setMeetBoardNo(int meetBoardNo) {
		this.meetBoardNo = meetBoardNo;
	}
	public String getMeetBoardTitle() {
		return meetBoardTitle;
	}
	public void setMeetBoardTitle(String meetBoardTitle) {
		this.meetBoardTitle = meetBoardTitle;
	}
	public String getPetInfo() {
		return petInfo;
	}
	public void setPetInfo(String petInfo) {
		this.petInfo = petInfo;
	}
	public String getHopeActivity() {
		return hopeActivity;
	}
	public void setHopeActivity(String hopeActivity) {
		this.hopeActivity = hopeActivity;
	}
	public int getMeetBoardViews() {
		return meetBoardViews;
	}
	public void setMeetBoardViews(int meetBoardViews) {
		this.meetBoardViews = meetBoardViews;
	}
	public Date getMeetBoardCreateDate() {
		return meetBoardCreateDate;
	}
	public void setMeetBoardCreateDate(Date meetBoardCreateDate) {
		this.meetBoardCreateDate = meetBoardCreateDate;
	}
	public Date getMeetBoardUpdateDate() {
		return meetBoardUpdateDate;
	}
	public void setMeetBoardUpdateDate(Date meetBoardUpdateDate) {
		this.meetBoardUpdateDate = meetBoardUpdateDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
		return "Match [meetBoardNo=" + meetBoardNo + ", meetBoardTitle=" + meetBoardTitle + ", petInfo=" + petInfo
				+ ", hopeActivity=" + hopeActivity + ", meetBoardViews=" + meetBoardViews + ", meetBoardCreateDate="
				+ meetBoardCreateDate + ", meetBoardUpdateDate=" + meetBoardUpdateDate + ", status=" + status
				+ ", userNo=" + userNo + ", petNo=" + petNo + ", fileNo=" + fileNo + "]";
	}
		
}