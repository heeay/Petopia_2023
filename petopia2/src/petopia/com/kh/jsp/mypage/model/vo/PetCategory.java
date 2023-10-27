package petopia.com.kh.jsp.mypage.model.vo;

public class PetCategory {

	private int petCtgNo;		//PET_CTG_NO	NUMBER
	private String petCtgName;	//PET_CTG_NAME	VARCHAR2(50 BYTE)
	
	public PetCategory() {
		super();
	}
	
	public PetCategory(int petCtgNo, String petCtgName) {
		super();
		this.petCtgNo = petCtgNo;
		this.petCtgName = petCtgName;
	}
	public int getPetCtgNo() {
		return petCtgNo;
	}
	public void setPetCtgNo(int petCtgNo) {
		this.petCtgNo = petCtgNo;
	}
	public String getPetCtgName() {
		return petCtgName;
	}
	public void setPetCtgName(String petCtgName) {
		this.petCtgName = petCtgName;
	}
	
	@Override
	public String toString() {
		return "PetCategory [petCtgNo=" + petCtgNo + ", petCtgName=" + petCtgName + "]";
	}
	
}
