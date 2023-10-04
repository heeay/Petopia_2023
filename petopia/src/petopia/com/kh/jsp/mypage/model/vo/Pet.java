package petopia.com.kh.jsp.mypage.model.vo;

public class Pet {
	
	private int petNo;				//PET_NO	NUMBER
	private String petName;			//PET_NAME	VARCHAR2(20 BYTE)
	private String petSpecies;		//PET_SPECIES	VARCHAR2(50 BYTE)
	private String petSpecific;		//PET_SPECIFIC	VARCHAR2(100 BYTE)
	private int petWeight;			//PET_WEIGHT	NUMBER
	private String petGender;		//PET_GENDER	CHAR(1 BYTE)
	private String petPersonality;	//PET_PERSONALITY	VARCHAR2(300 BYTE)
	private String petEtc;			//PET_ETC	VARCHAR2(1000 BYTE)
	private int userNo;				//USER_NO	NUMBER
	private int fileNo;				//FILE_NO	NUMBER
	
	public Pet() {
		super();
	}
	
	public Pet(int petNo, String petName, String petSpecies, String petSpecific, int petWeight, String petGender,
			String petPersonality, String petEtc, int userNo, int fileNo) {
		super();
		this.petNo = petNo;
		this.petName = petName;
		this.petSpecies = petSpecies;
		this.petSpecific = petSpecific;
		this.petWeight = petWeight;
		this.petGender = petGender;
		this.petPersonality = petPersonality;
		this.petEtc = petEtc;
		this.userNo = userNo;
		this.fileNo = fileNo;
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
	public String getPetSpecies() {
		return petSpecies;
	}
	public void setPetSpecies(String petSpecies) {
		this.petSpecies = petSpecies;
	}
	public String getPetSpecific() {
		return petSpecific;
	}
	public void setPetSpecific(String petSpecific) {
		this.petSpecific = petSpecific;
	}
	public int getPetWeight() {
		return petWeight;
	}
	public void setPetWeight(int petWeight) {
		this.petWeight = petWeight;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public String getPetPersonality() {
		return petPersonality;
	}
	public void setPetPersonality(String petPersonality) {
		this.petPersonality = petPersonality;
	}
	public String getPetEtc() {
		return petEtc;
	}
	public void setPetEtc(String petEtc) {
		this.petEtc = petEtc;
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
		return "Pet [petNo=" + petNo + ", petName=" + petName + ", petSpecies=" + petSpecies + ", petSpecific="
				+ petSpecific + ", petWeight=" + petWeight + ", petGender=" + petGender + ", petPersonality="
				+ petPersonality + ", petEtc=" + petEtc + ", userNo=" + userNo + ", fileNo=" + fileNo + "]";
	}
	
}
