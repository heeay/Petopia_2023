package petopia.com.kh.jsp.info.model.vo;

public class InfoFile {
	
	private int fileNo; // FILE_NO	NUMBER
	private int refBno; // REF_BNO	NUMBER
	private String originalName; // ORIGINAL_NAME	VARCHAR2(500 BYTE)
	private String uploadName; // UPLOAD_NAME	VARCHAR2(500 BYTE)
	private String filePath; // FILE_PATH	VARCHAR2(1000 BYTE)
	private int fileLevel; // FILE_LEVEL	NUMBER
	
	public InfoFile() {
		super();
	}

	public InfoFile(int fileNo, int refBno, String originalName, String uploadName, String filePath, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.refBno = refBno;
		this.originalName = originalName;
		this.uploadName = uploadName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getUploadName() {
		return uploadName;
	}

	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "InfoFile [fileNo=" + fileNo + ", refBno=" + refBno + ", originalName=" + originalName + ", uploadName="
				+ uploadName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + "]";
	}
	
}
