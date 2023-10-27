package petopia.com.kh.jsp.mypage.model.vo;

import java.sql.Date;

public class HosRecords {

	private int hosNo;				//HOS_NO	NUMBER
	private String hosDate;			//HOS_DATE	DATE
	private	String hosVaccination;	//HOS_VACCINATION	VARCHAR2(500 BYTE)
	private	String hosIllness;		//HOS_ILLNESS	VARCHAR2(1000 BYTE)
	private	String hosMedicine;
	private	String hosContent;		//HOS_CONTENT	VARCHAR2(4000 BYTE)
	private	int petNo;				//PET_NO	NUMBER
	
	private String petName;
	private int rowNum;
	
	private	int loginUserNo;
	
	private String startDate;
	private String endDate;
	
	public HosRecords() {
		super();
	}
	
	public HosRecords(int hosNo, String hosDate, String hosVaccination, String hosIllness, String hosMedicine,
			String hosContent, int petNo, String petName, int rowNum, int loginUserNo, String startDate,
			String endDate) {
		super();
		this.hosNo = hosNo;
		this.hosDate = hosDate;
		this.hosVaccination = hosVaccination;
		this.hosIllness = hosIllness;
		this.hosMedicine = hosMedicine;
		this.hosContent = hosContent;
		this.petNo = petNo;
		this.petName = petName;
		this.rowNum = rowNum;
		this.loginUserNo = loginUserNo;
		this.startDate = startDate;
		this.endDate = endDate;
	}


	public int getLoginUserNo() {
		return loginUserNo;
	}
	public void setLoginUserNo(int loginUserNo) {
		this.loginUserNo = loginUserNo;
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
	public String getHosMedicine() {
		return hosMedicine;
	}
	public void setHosMedicine(String hosMedicine) {
		this.hosMedicine = hosMedicine;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getHosNo() {
		return hosNo;
	}
	public void setHosNo(int hosNo) {
		this.hosNo = hosNo;
	}
	public String getHosDate() {
		return hosDate;
	}
	public void setHosDate(String hosDate) {
		this.hosDate = hosDate;
	}
	public String getHosVaccination() {
		return hosVaccination;
	}
	public void setHosVaccination(String hosVaccination) {
		this.hosVaccination = hosVaccination;
	}
	public String getHosIllness() {
		return hosIllness;
	}
	public void setHosIllness(String hosIllness) {
		this.hosIllness = hosIllness;
	}
	public String getHosContent() {
		return hosContent;
	}
	public void setHosContent(String hosContent) {
		this.hosContent = hosContent;
	}
	public int getPetNo() {
		return petNo;
	}
	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}

	@Override
	public String toString() {
		return "HosRecords [hosNo=" + hosNo + ", hosDate=" + hosDate + ", hosVaccination=" + hosVaccination
				+ ", hosIllness=" + hosIllness + ", hosMedicine=" + hosMedicine + ", hosContent=" + hosContent
				+ ", petNo=" + petNo + ", petName=" + petName + ", rowNum=" + rowNum + ", loginUserNo=" + loginUserNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}
