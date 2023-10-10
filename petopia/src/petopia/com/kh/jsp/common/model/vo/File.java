package petopia.com.kh.jsp.common.model.vo;

public class File {
	private String fileNo;
	private String refBno;
	private String originalName;
	private String uploadName;
	private String filePath;
	private String fileLevel;
	public File() {
		super();
	}
	public File(String fileNo, String refBno, String originalName, String uploadName, String filePath,
			String fileLevel) {
		super();
		this.fileNo = fileNo;
		this.refBno = refBno;
		this.originalName = originalName;
		this.uploadName = uploadName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getRefBno() {
		return refBno;
	}
	public void setRefBno(String refBno) {
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
	public String getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}
	@Override
	public String toString() {
		return "File [fileNo=" + fileNo + ", refBno=" + refBno + ", originalName=" + originalName + ", uploadName="
				+ uploadName + ", filePath=" + filePath + ", fileLevel=" + fileLevel + "]";
	}
	
}
