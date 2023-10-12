package petopia.com.kh.jsp.info.model.vo;

public class HospitalData {
	/*
	사업장명,
	좌표정보_x,
    좌표정보_y
    */
	private String hospitalName;
	private double posX;
	private double posY;
	public HospitalData() {
		super();
	}
	public HospitalData(String hospitalName, double posX, double posY) {
		super();
		this.hospitalName = hospitalName;
		this.posX = posX;
		this.posY = posY;
	}
	
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public double getPosX() {
		return posX;
	}
	public void setPosX(double posX) {
		this.posX = posX;
	}
	public double getPosY() {
		return posY;
	}
	public void setPosY(double posY) {
		this.posY = posY;
	}
	@Override
	public String toString() {
		return "HospitalData [hospitalName=" + hospitalName + ", posX=" + posX + ", posY=" + posY + "]";
	}
}
