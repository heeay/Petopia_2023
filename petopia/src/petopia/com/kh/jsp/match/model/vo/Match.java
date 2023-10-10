package petopia.com.kh.jsp.match.model.vo;

public class Match {
	
	private String meetBoardNo; 
	private String meetBoardTitle;
	private String petInfo;
	private String hopeActivity;
	private String meetBoardViews;
	private String meetBoardCreateDate;
	private String meetBoardUpdateDate;
	private String status;
	private String userNo;
	private String petNo;
	public Match() {
		super();
	}
	public Match(String meetBoardNo, String meetBoardTitle, String petInfo, String hopeActivity, String meetBoardViews,
			String meetBoardCreateDate, String meetBoardUpdateDate, String status, String userNo, String petNo) {
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
	}
	
	public String getMeetBoardNo() {
		return meetBoardNo;
	}
	public void setMeetBoardNo(String meetBoardNo) {
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
	public String getMeetBoardViews() {
		return meetBoardViews;
	}
	public void setMeetBoardViews(String meetBoardViews) {
		this.meetBoardViews = meetBoardViews;
	}
	public String getMeetBoardCreateDate() {
		return meetBoardCreateDate;
	}
	public void setMeetBoardCreateDate(String meetBoardCreateDate) {
		this.meetBoardCreateDate = meetBoardCreateDate;
	}
	public String getMeetBoardUpdateDate() {
		return meetBoardUpdateDate;
	}
	public void setMeetBoardUpdateDate(String meetBoardUpdateDate) {
		this.meetBoardUpdateDate = meetBoardUpdateDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getPetNo() {
		return petNo;
	}
	public void setPetNo(String petNo) {
		this.petNo = petNo;
	}
	@Override
	public String toString() {
		return "Match [hopeActivity=" + hopeActivity + ", meetBoardCreateDate=" + meetBoardCreateDate + ", meetBoardNo="
				+ meetBoardNo + ", meetBoardTitle=" + meetBoardTitle + ", meetBoardUpdateDate=" + meetBoardUpdateDate
				+ ", meetBoardViews=" + meetBoardViews + ", petInfo=" + petInfo + ", petNo=" + petNo + ", status="
				+ status + ", userNo=" + userNo + "]";
	}
	
}