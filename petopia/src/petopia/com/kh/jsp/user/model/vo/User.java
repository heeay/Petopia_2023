package petopia.com.kh.jsp.user.model.vo;

import java.sql.Date;

public class User {
	/*
	"USER_NO"	NUMBER		NOT NULL,
	"USER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"USER_PASS"	VARCHAR2(50)		NOT NULL,
	"USER_NICKNAME"	VARCHAR2(50)		NOT NULL,
	"USER_PHONE"	VARCHAR2(11)		NOT NULL,
	"ROLE_ID"	CHAR(2)	DEFAULT 'R1'	NULL,
	"USER_CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_UPDATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_ENABLE_STATE"
	*/
	private int userNo;
	private String userEmail;
	private String userPass;
	private String userNickname;
	private String userPhone;
	private String roleId;
	private Date userCreateDate;
	private Date userUpdateDate;
	private String userEnableState;
}
