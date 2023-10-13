package petopia.com.kh.jsp.board.model.vo;

public class Category {
	
	private int ctgNo;
	private String ctgName;
	
	public Category() {
		super();
	}

	public Category(int ctgNo, String ctgName) {
		super();
		this.ctgNo = ctgNo;
		this.ctgName = ctgName;
	}

	public int getCtgNo() {
		return ctgNo;
	}

	public void setCtgNo(int ctgNo) {
		this.ctgNo = ctgNo;
	}

	public String getCtgName() {
		return ctgName;
	}

	public void setCtgName(String ctgName) {
		this.ctgName = ctgName;
	}

	@Override
	public String toString() {
		return "Category [ctgNo=" + ctgNo + ", ctgName=" + ctgName + "]";
	}
	
	
	
}
