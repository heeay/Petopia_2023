package petopia.com.kh.jsp.common.model.vo;

public class File {
	private int fileNo;
	private int refBno;
	private String originalName;
	private String uploadName;
	private String filePath;
	private int fileLevel;
	public File() {
		super();
	}
	public File(int fileNo, int refBno, String originalName, String uploadName, String filePath, int fileLevel) {
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
		return "File [fileNo=" + fileNo + ", refBno=" + refBno + ", originalName=" + originalName + ", uploadName="
				+ uploadName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + "]";
	}
}
