package petopia.com.kh.jsp.user.model.vo;

import java.sql.Date;

public class User {
	/*
	"USER_NO"			NUMBER				NOT NULL,
	"USER_METHOD"		NUMBER	DEFAULT 0		NULL,
	"USER_EMAIL"		VARCHAR2(50)		NOT NULL,
	"USER_PASS"			VARCHAR2(64)		NOT NULL,
	"USER_NICKNAME"		VARCHAR2(50)		NOT NULL,
	"USER_PHONE"		VARCHAR2(11)		NOT NULL,
	"ROLE_ID"			CHAR(2)	DEFAULT 'R1'	NULL,
	"USER_CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_UPDATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_ENABLE_STATE"	CHAR(1)	DEFAULT 'Y',
	"FILE_MYPAGE_NO"	NUMBER	NULL
	*/
	private int userNo;
	private int userMethod;
	private String userEmail;
	private String userPass;
	private String userNickname;
	private String userPhone;
	private String roleId;
	private Date userCreateDate;
	private Date userUpdateDate;
	private String userEnableState;
	private String fileMypageNo;
	
	public User() {
		super();
	}

	public User(int userNo, int userMethod, String userEmail, String userPass, String userNickname, String userPhone,
			String roleId, Date userCreateDate, Date userUpdateDate, String userEnableState, String fileMypageNo) {
		super();
		this.userNo = userNo;
		this.userMethod = userMethod;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userNickname = userNickname;
		this.userPhone = userPhone;
		this.roleId = roleId;
		this.userCreateDate = userCreateDate;
		this.userUpdateDate = userUpdateDate;
		this.userEnableState = userEnableState;
		this.fileMypageNo = fileMypageNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserMethod() {
		return userMethod;
	}

	public void setUserMethod(int userMethod) {
		this.userMethod = userMethod;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public Date getUserCreateDate() {
		return userCreateDate;
	}

	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}

	public Date getUserUpdateDate() {
		return userUpdateDate;
	}

	public void setUserUpdateDate(Date userUpdateDate) {
		this.userUpdateDate = userUpdateDate;
	}

	public String getUserEnableState() {
		return userEnableState;
	}

	public void setUserEnableState(String userEnableState) {
		this.userEnableState = userEnableState;
	}

	public String getFileMypageNo() {
		return fileMypageNo;
	}

	public void setFileMypageNo(String fileMypageNo) {
		this.fileMypageNo = fileMypageNo;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userMethod=" + userMethod + ", userEmail=" + userEmail + ", userPass="
				+ userPass + ", userNickname=" + userNickname + ", userPhone=" + userPhone + ", roleId=" + roleId
				+ ", userCreateDate=" + userCreateDate + ", userUpdateDate=" + userUpdateDate + ", userEnableState="
				+ userEnableState + ", fileMypageNo=" + fileMypageNo + "]";
	}
	
	
}
