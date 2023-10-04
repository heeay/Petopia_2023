package petopia.com.kh.jsp.mypage.model.vo;

import java.sql.Date;

public class HosRecords {

	private int hosNo;				//HOS_NO	NUMBER
	private Date hosDate;			//HOS_DATE	DATE
	private	String hosVaccination;	//HOS_VACCINATION	VARCHAR2(500 BYTE)
	private	String hosIllness;		//HOS_ILLNESS	VARCHAR2(1000 BYTE)
	private	String hosContent;		//HOS_CONTENT	VARCHAR2(4000 BYTE)
	private	int petNo;				//PET_NO	NUMBER
	
	public HosRecords() {
		super();
	}
	
	public HosRecords(int hosNo, Date hosDate, String hosVaccination, String hosIllness, String hosContent, int petNo) {
		super();
		this.hosNo = hosNo;
		this.hosDate = hosDate;
		this.hosVaccination = hosVaccination;
		this.hosIllness = hosIllness;
		this.hosContent = hosContent;
		this.petNo = petNo;
	}

	public int getHosNo() {
		return hosNo;
	}
	public void setHosNo(int hosNo) {
		this.hosNo = hosNo;
	}
	public Date getHosDate() {
		return hosDate;
	}
	public void setHosDate(Date hosDate) {
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

	@Override
	public String toString() {
		return "HosRecords [hosNo=" + hosNo + ", hosDate=" + hosDate + ", hosVaccination=" + hosVaccination
				+ ", hosIllness=" + hosIllness + ", hosContent=" + hosContent + ", petNo=" + petNo + "]";
	}
	
}
