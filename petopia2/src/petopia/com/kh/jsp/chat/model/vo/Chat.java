package petopia.com.kh.jsp.chat.model.vo;

public class Chat {
	
	private int chatNo;
	private int chatRoomNo;
	private int petNo;
	private String chatContent;
	private String chatSendDate;
	private String chatReadYn;
	public Chat() {
		super();
	}
	public Chat(int chatNo, int chatRoomNo, int petNo, String chatContent, String chatSendDate, String chatReadYn) {
		super();
		this.chatNo = chatNo;
		this.chatRoomNo = chatRoomNo;
		this.petNo = petNo;
		this.chatContent = chatContent;
		this.chatSendDate = chatSendDate;
		this.chatReadYn = chatReadYn;
	}
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getChatRoomNo() {
		return chatRoomNo;
	}
	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	public int getPetNo() {
		return petNo;
	}
	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatSendDate() {
		return chatSendDate;
	}
	public void setChatSendDate(String chatSendDate) {
		this.chatSendDate = chatSendDate;
	}
	public String getChatReadYn() {
		return chatReadYn;
	}
	public void setChatReadYn(String chatReadYn) {
		this.chatReadYn = chatReadYn;
	}
	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", chatRoomNo=" + chatRoomNo + ", petNo=" + petNo + ", chatContent="
				+ chatContent + ", chatSendDate=" + chatSendDate + ", chatReadYn=" + chatReadYn + "]";
	}
	
}
