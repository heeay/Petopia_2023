package petopia.com.kh.jsp.match.model.vo;

public class Match {
	
	private int meetBoardNo; 
	private String meetBoardTitle;
	private String petInfo;
	private String hopeActivity;
	private int meetBoardViews;
	private String meetBoardCreateDate;
	private String meetBoardUpdateDate;
	private String status;
	private int userNo;
	private int petNo;
	public Match() {
		super();
	}
	public Match(int meetBoardNo, String meetBoardTitle, String petInfo, String hopeActivity, int meetBoardViews,
			String meetBoardCreateDate, String meetBoardUpdateDate, String status, int userNo, int petNo) {
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
	@Override
	public String toString() {
		return "Match [meetBoardNo=" + meetBoardNo + ", meetBoardTitle=" + meetBoardTitle + ", petInfo=" + petInfo
				+ ", hopeActivity=" + hopeActivity + ", meetBoardViews=" + meetBoardViews + ", meetBoardCreateDate="
				+ meetBoardCreateDate + ", meetBoardUpdateDate=" + meetBoardUpdateDate + ", status=" + status
				+ ", userNo=" + userNo + ", petNo=" + petNo + "]";
	}
	
	
	
	
}
