DROP TABLE "TB_LIKE";
DROP TABLE "TB_STAR";
DROP TABLE "TB_MATCHING_FAVORITE";
DROP TABLE "TB_MEETUP_ATTEND";
DROP TABLE "TB_EMAIL_AUTH";

DROP TABLE "TB_ACCUSE";
DROP TABLE "TB_BOARD_ACCUSE";
DROP TABLE "TB_COMMENT_ACCUSE";

DROP TABLE "TB_MEETUP";
DROP TABLE "TB_COMMENT";
DROP TABLE "TB_BOARD";
DROP TABLE "TB_CATEGORY";
DROP TABLE "TB_PET_CATEGORY";

DROP TABLE "TB_MATCHING_REVIEW";
DROP TABLE "TB_CHAT";
DROP TABLE "TB_CHAT_ROOM";
DROP TABLE "TB_MATCHING";

DROP TABLE "TB_SUGGESTION";
DROP TABLE "TB_HOS_RECORDS";
DROP TABLE "TB_WALK_RECORDS";
DROP TABLE "TB_PET";

DROP TABLE "TB_FILE";

DROP TABLE "TB_USER";
DROP TABLE "TB_ROLE";
DROP TABLE "TB_MYPAGE_FILE";

CREATE TABLE "TB_USER" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_METHOD"	NUMBER	DEFAULT 0	NULL,
	"USER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"USER_PASS"	VARCHAR2(64)			NULL,
	"USER_NICKNAME"	VARCHAR2(50)		NOT NULL,
	"USER_PHONE"	VARCHAR2(13)		NULL,
	"ROLE_ID"	CHAR(2)	DEFAULT 'R1'	NULL,
	"USER_CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_UPDATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_ENABLE_STATE"	CHAR(1)	DEFAULT 'Y' CHECK(USER_ENABLE_STATE IN ('Y','N'))	NULL,
	"FILE_MYPAGE_NO"	NUMBER	NULL
);

COMMENT ON COLUMN "TB_USER"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_USER"."USER_METHOD" IS '가입정보';

COMMENT ON COLUMN "TB_USER"."USER_EMAIL" IS '회원이메일';

COMMENT ON COLUMN "TB_USER"."USER_PASS" IS '회원비밀번호';

COMMENT ON COLUMN "TB_USER"."USER_NICKNAME" IS '회원닉네임';

COMMENT ON COLUMN "TB_USER"."USER_PHONE" IS '회원전화번호';

COMMENT ON COLUMN "TB_USER"."ROLE_ID" IS '등급아이디';

COMMENT ON COLUMN "TB_USER"."USER_CREATE_DATE" IS '회원가입일';

COMMENT ON COLUMN "TB_USER"."USER_UPDATE_DATE" IS '회원수정일';

COMMENT ON COLUMN "TB_USER"."USER_ENABLE_STATE" IS '회원탈퇴상태';

CREATE TABLE "TB_ROLE" (
	"ROLE_ID"	CHAR(2)		NOT NULL,
	"ROLE_NAME"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "TB_ROLE"."ROLE_ID" IS '등급아이디';

COMMENT ON COLUMN "TB_ROLE"."ROLE_NAME" IS '등급명';

CREATE TABLE "TB_EMAIL_AUTH" (
	"EMAIL_AUTH_EMAIL"	VARCHAR2(50)		NOT NULL,
	"EMAIL_AUTH_CODE"	VARCHAR2(64)		NOT NULL,
	"EMAIL_AUTH_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "TB_EMAIL_AUTH"."EMAIL_AUTH_EMAIL" IS '대기이메일';

COMMENT ON COLUMN "TB_EMAIL_AUTH"."EMAIL_AUTH_CODE" IS '인증코드';

COMMENT ON COLUMN "TB_EMAIL_AUTH"."EMAIL_AUTH_DATE" IS '코드발송일';

CREATE TABLE "TB_HOS_RECORDS" (
	"HOS_NO"	NUMBER		NOT NULL,
	"HOS_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"HOS_VACCINATION"	VARCHAR2(500)		NULL,
	"HOS_ILLNESS"	VARCHAR2(1000)		NULL,
    "HOS_MEDICINE"	VARCHAR2(1000)		NULL,
	"HOS_CONTENT"	VARCHAR2(4000)		NULL,
	"PET_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_HOS_RECORDS"."HOS_NO" IS '기록번호';

COMMENT ON COLUMN "TB_HOS_RECORDS"."HOS_DATE" IS '날짜';

COMMENT ON COLUMN "TB_HOS_RECORDS"."HOS_VACCINATION" IS '예방접종';

COMMENT ON COLUMN "TB_HOS_RECORDS"."HOS_MEDICINE" IS '질병';

COMMENT ON COLUMN "TB_HOS_RECORDS"."HOS_ILLNESS" IS '약복용';

COMMENT ON COLUMN "TB_HOS_RECORDS"."HOS_CONTENT" IS '상세내용';

COMMENT ON COLUMN "TB_HOS_RECORDS"."PET_NO" IS '프로필번호';

CREATE TABLE "TB_WALK_RECORDS" (
	"WALK_NO"	NUMBER		NOT NULL,
	"WALK_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"WALK_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"WALK_TITLE"	VARCHAR2(300)		NOT NULL,
	"PET_NO"	NUMBER		NOT NULL,
	"FILE_MYPAGE_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "TB_WALK_RECORDS"."WALK_NO" IS '기록번호';

COMMENT ON COLUMN "TB_WALK_RECORDS"."WALK_DATE" IS '날짜';

COMMENT ON COLUMN "TB_WALK_RECORDS"."WALK_CONTENT" IS '상세내용';

COMMENT ON COLUMN "TB_WALK_RECORDS"."WALK_TITLE" IS '제목';

COMMENT ON COLUMN "TB_WALK_RECORDS"."PET_NO" IS '프로필번호';

COMMENT ON COLUMN "TB_WALK_RECORDS"."FILE_MYPAGE_NO" IS '마이페이지첨부파일번호';

CREATE TABLE "TB_PET" (
	"PET_NO"	NUMBER		NOT NULL,
	"PET_NAME"	VARCHAR2(20)		NOT NULL,
	"PET_SPECIES"	VARCHAR2(50)		NOT NULL,
	"PET_SPECIFIC"	VARCHAR2(100)		NOT NULL,
	"PET_WEIGHT"	NUMBER		NOT NULL,
	"PET_GENDER"	CHAR(1)	DEFAULT 'M' CHECK(PET_GENDER IN ('M','F','N'))	NULL,
	"PET_PERSONALITY"	VARCHAR2(300)		NOT NULL,
	"PET_ETC"	VARCHAR2(1000)		NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"FILE_MYPAGE_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "TB_PET"."PET_NO" IS '프로필번호';

COMMENT ON COLUMN "TB_PET"."PET_NAME" IS '이름';

COMMENT ON COLUMN "TB_PET"."PET_SPECIES" IS '종';

COMMENT ON COLUMN "TB_PET"."PET_SPECIFIC" IS '세부종';

COMMENT ON COLUMN "TB_PET"."PET_WEIGHT" IS '몸무게';

COMMENT ON COLUMN "TB_PET"."PET_GENDER" IS '성별';

COMMENT ON COLUMN "TB_PET"."PET_PERSONALITY" IS '성격';

COMMENT ON COLUMN "TB_PET"."PET_ETC" IS '기타사항';

COMMENT ON COLUMN "TB_PET"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_PET"."FILE_MYPAGE_NO" IS '마이페이지첨부파일번호';

CREATE TABLE "TB_ACCUSE" (
	"ACCUSE_NO"	NUMBER		NOT NULL,
	"ACCUSED_USER_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"ACCUES_RESON"	VARCHAR(1000)		NULL,
	"ACCUSE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"ACCUSE_ACCEPT"	CHAR(1)	DEFAULT 'N' CHECK(ACCUSE_ACCEPT IN ('Y','N'))	NULL
);

COMMENT ON COLUMN "TB_ACCUSE"."ACCUSE_NO" IS '신고번호';

COMMENT ON COLUMN "TB_ACCUSE"."ACCUSED_USER_NO" IS '피고';

COMMENT ON COLUMN "TB_ACCUSE"."USER_NO" IS '신고자';

COMMENT ON COLUMN "TB_ACCUSE"."ACCUES_RESON" IS '신고사유';

COMMENT ON COLUMN "TB_ACCUSE"."ACCUSE_DATE" IS '신고일';

COMMENT ON COLUMN "TB_ACCUSE"."ACCUSE_ACCEPT" IS '신고수락여부';

CREATE TABLE "TB_SUGGESTION" (
	"SUG_NO"	NUMBER		NOT NULL,
	"SUG_TITLE"	VARCHAR2(100)		NOT NULL,
	"SUG_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"SUG_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_SUGGESTION"."SUG_NO" IS '건의사항번호';

COMMENT ON COLUMN "TB_SUGGESTION"."SUG_TITLE" IS '제목';

COMMENT ON COLUMN "TB_SUGGESTION"."SUG_CONTENT" IS '내용';

COMMENT ON COLUMN "TB_SUGGESTION"."SUG_DATE" IS '날짜';

COMMENT ON COLUMN "TB_SUGGESTION"."USER_NO" IS '회원번호';

CREATE TABLE "TB_BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BOARD_VIEWS"	NUMBER	DEFAULT 0	NULL,
	"BOARD_CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"BOARD_UPDATE_DATE"	DATE		NULL,
	"USER_NO"	NUMBER		NOT NULL,
    --"LIKE_COUNT" NUMBER     DEFAULT 0 NULL,
 	--"FILE_IMG"	VARCHAR2(4000)		NOT NULL,
	"CTG_NO"	NUMBER		NOT NULL,
	"PET_CTG_NO"	NUMBER		NULL,
	"BOARD_STATUS" CHAR(1)	DEFAULT 'Y'	CHECK(BOARD_STATUS IN ('Y', 'N'))	NULL
);

COMMENT ON COLUMN "TB_BOARD"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "TB_BOARD"."BOARD_TITLE" IS '게시판 제목';

COMMENT ON COLUMN "TB_BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "TB_BOARD"."BOARD_VIEWS" IS '조회수';

COMMENT ON COLUMN "TB_BOARD"."BOARD_CREATE_DATE" IS '작성일';

COMMENT ON COLUMN "TB_BOARD"."BOARD_UPDATE_DATE" IS '수정일';

COMMENT ON COLUMN "TB_BOARD"."USER_NO" IS '작성자번호';

--COMMENT ON COLUMN "TB_BOARD"."LIKE_COUNT" IS '좋아요수';

--COMMENT ON COLUMN "TB_BOARD"."FILE_IMG" IS '첨부파일대표이미지';

COMMENT ON COLUMN "TB_BOARD"."CTG_NO" IS '카테고리번호';

COMMENT ON COLUMN "TB_BOARD"."PET_CTG_NO" IS '종카테고리번호';

COMMENT ON COLUMN "TB_BOARD"."BOARD_STATUS" IS '게시판활성화여부';

CREATE TABLE "TB_MEETUP" (
	"MEETUP_NO"	NUMBER		NOT NULL,
	"MEEUP_NAME"	VARCHAR2(100)		NULL,
	"MEEUP_CONTENT"	VARCHAR2(4000)		NULL,
	"MEEUP_START_DATE"	DATE		NOT NULL,
	"MEETUP_END_DATE"	DATE		NOT NULL,
	"MEETUP_PLACE"	VARCHAR2(1000)		NOT NULL,
	"MEMBER_LIMIT"	NUMBER		NULL
);

COMMENT ON COLUMN "TB_MEETUP"."MEETUP_NO" IS '행사번호';

COMMENT ON COLUMN "TB_MEETUP"."MEEUP_NAME" IS '행사명';

COMMENT ON COLUMN "TB_MEETUP"."MEEUP_CONTENT" IS '행사내용';

COMMENT ON COLUMN "TB_MEETUP"."MEEUP_START_DATE" IS '행사시작일';

COMMENT ON COLUMN "TB_MEETUP"."MEETUP_END_DATE" IS '행사종료일';

COMMENT ON COLUMN "TB_MEETUP"."MEETUP_PLACE" IS '행사장소';

COMMENT ON COLUMN "TB_MEETUP"."MEMBER_LIMIT" IS '제한인원수';

CREATE TABLE "TB_MATCHING" (
	"MEET_BOARD_NO"	NUMBER		NOT NULL,
	"MEET_BOARD_TITLE"	VARCHAR2(1000)		NOT NULL,
	"PET_INFO"	VARCHAR2(1000)		NOT NULL,
	"HOPE_ACTIVITY"	VARCHAR2(3000)		NOT NULL,
	"MEET_BOARD_VIEWS"	NUMBER	DEFAULT 0	NULL,
	"MEET_BOARD_CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MEET_BOARD_UPDATE_DATE"	DATE		NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y' CHECK(STATUS IN ('Y','N'))	NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PET_NO"	NUMBER		NOT NULL,
	"FILE_NO"	NUMBER	NULL/*<-제약조건 없음*/
);

COMMENT ON COLUMN "TB_MATCHING"."MEET_BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "TB_MATCHING"."MEET_BOARD_TITLE" IS '게시글제목';

COMMENT ON COLUMN "TB_MATCHING"."PET_INFO" IS '펫소개';

COMMENT ON COLUMN "TB_MATCHING"."HOPE_ACTIVITY" IS '회망교류활동';

COMMENT ON COLUMN "TB_MATCHING"."MEET_BOARD_VIEWS" IS '조회수';

COMMENT ON COLUMN "TB_MATCHING"."MEET_BOARD_CREATE_DATE" IS '작성일';

COMMENT ON COLUMN "TB_MATCHING"."MEET_BOARD_UPDATE_DATE" IS '수정일';

COMMENT ON COLUMN "TB_MATCHING"."STATUS" IS '게시글상태';

COMMENT ON COLUMN "TB_MATCHING"."USER_NO" IS '작성자번호';

COMMENT ON COLUMN "TB_MATCHING"."PET_NO" IS '동물프로필번호';

CREATE TABLE "TB_FILE" (
	"FILE_NO"	NUMBER		NOT NULL,
	"REF_BNO"	NUMBER		NOT NULL,
	"ORIGINAL_NAME"	VARCHAR2(500)		NOT NULL,
	"UPLOAD_NAME"	VARCHAR2(500)		NOT NULL,
	"FILE_PATH"	VARCHAR2(1000)		NOT NULL,
	"FILE_LEVEL"	NUMBER		NULL
);

COMMENT ON COLUMN "TB_FILE"."FILE_NO" IS '첨부파일번호';

COMMENT ON COLUMN "TB_FILE"."REF_BNO" IS '참조게시글번호';

COMMENT ON COLUMN "TB_FILE"."ORIGINAL_NAME" IS '파일원본이름';

COMMENT ON COLUMN "TB_FILE"."UPLOAD_NAME" IS '파일저장이름';

COMMENT ON COLUMN "TB_FILE"."FILE_PATH" IS '파일저장경로';

COMMENT ON COLUMN "TB_FILE"."FILE_LEVEL" IS '(1/2) 썸내일용';

CREATE TABLE "TB_MYPAGE_FILE" (
	"FILE_MYPAGE_NO"	NUMBER		NOT NULL,
	"SUG_NO"	NUMBER		NULL,
	"ORIGINAL_NAME"	VARCHAR2(500)		NOT NULL,
	"UPLOAD_NAME"	VARCHAR2(500)		NOT NULL,
	"FILE_PATH"	VARCHAR2(1000)		NOT NULL
);

COMMENT ON COLUMN "TB_MYPAGE_FILE"."FILE_MYPAGE_NO" IS '마이페이지첨부파일번호';

COMMENT ON COLUMN "TB_MYPAGE_FILE"."SUG_NO" IS '건의사항번호';

COMMENT ON COLUMN "TB_MYPAGE_FILE"."ORIGINAL_NAME" IS '마이페이지파일원본이름';

COMMENT ON COLUMN "TB_MYPAGE_FILE"."UPLOAD_NAME" IS '마이페이지파일저장이름';

COMMENT ON COLUMN "TB_MYPAGE_FILE"."FILE_PATH" IS '마이페이지파일저장경로';

CREATE TABLE "TB_COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"COMMENT_CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"COMMENT_UPDATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"COMMENT_GROUP"	NUMBER		NOT NULL,
	"COMMENT_INDEX"	NUMBER	DEFAULT 1	NULL,
	"COMMENT_DEPTH"	NUMBER	DEFAULT 0	NULL
);

COMMENT ON COLUMN "TB_COMMENT"."COMMENT_NO" IS '댓글번호';

COMMENT ON COLUMN "TB_COMMENT"."COMMENT_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "TB_COMMENT"."COMMENT_CREATE_DATE" IS '댓글작성일';

COMMENT ON COLUMN "TB_COMMENT"."COMMENT_UPDATE_DATE" IS '댓글수정일';

COMMENT ON COLUMN "TB_COMMENT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_COMMENT"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "TB_COMMENT"."COMMENT_GROUP" IS '댓글그룹';

COMMENT ON COLUMN "TB_COMMENT"."COMMENT_INDEX" IS '답글인덱스';

COMMENT ON COLUMN "TB_COMMENT"."COMMENT_DEPTH" IS '답글깊이';

CREATE TABLE "TB_MATCHING_REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"WRITE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"REVIEW_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"REVIEW_SCORE"	NUMBER		NOT NULL,
	"WRITER_NO"	NUMBER		NOT NULL,
	"CHAT_ROOM_NO"	NUMBER		NOT NULL,
	"RECEIVE_PET_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_MATCHING_REVIEW"."REVIEW_NO" IS '후기번호';

COMMENT ON COLUMN "TB_MATCHING_REVIEW"."WRITE_DATE" IS '작성일자';

COMMENT ON COLUMN "TB_MATCHING_REVIEW"."REVIEW_CONTENT" IS '후기내용';

COMMENT ON COLUMN "TB_MATCHING_REVIEW"."REVIEW_SCORE" IS '후기별점';

COMMENT ON COLUMN "TB_MATCHING_REVIEW"."WRITER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_MATCHING_REVIEW"."CHAT_ROOM_NO" IS '채팅방번호';

COMMENT ON COLUMN "TB_MATCHING_REVIEW"."RECEIVE_PET_NO" IS '받은프로필번호';

CREATE TABLE "TB_CATEGORY" (
	"CTG_NO"	NUMBER		NOT NULL,
	"CTG_NAME"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "TB_CATEGORY"."CTG_NO" IS '카테고리번호';

COMMENT ON COLUMN "TB_CATEGORY"."CTG_NAME" IS '카테고리이름';

CREATE TABLE "TB_PET_CATEGORY" (
	"PET_CTG_NO"	NUMBER		NOT NULL,
	"PET_CTG_NAME"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "TB_PET_CATEGORY"."PET_CTG_NO" IS '종카테고리번호';

COMMENT ON COLUMN "TB_PET_CATEGORY"."PET_CTG_NAME" IS '종카테고리이름';

CREATE TABLE "TB_LIKE" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"LIKE_YN"	CHAR(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "TB_LIKE"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "TB_LIKE"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_LIKE"."LIKE_YN" IS '좋아요여부';

CREATE TABLE "TB_STAR" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"STAR_SCORE"	NUMBER	DEFAULT 0 CHECK(0 <= STAR_SCORE AND STAR_SCORE <= 5)	NULL
);

COMMENT ON COLUMN "TB_STAR"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "TB_STAR"."STAR_SCORE" IS '점수';

CREATE TABLE "TB_MATCHING_FAVORITE" (
	"USER_NO"	NUMBER		NOT NULL,
	"MEET_BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TB_MATCHING_FAVORITE"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_MATCHING_FAVORITE"."MEET_BOARD_NO" IS '게시글번호';

CREATE TABLE "TB_MEETUP_ATTEND" (
	"MEETUP_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PERMISSION_YN"	CHAR(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "TB_MEETUP_ATTEND"."MEETUP_NO" IS '행사번호';

COMMENT ON COLUMN "TB_MEETUP_ATTEND"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "TB_MEETUP_ATTEND"."PERMISSION_YN" IS '참석승인여부';

CREATE TABLE "TB_BOARD_ACCUSE" (
	"BOARD_ACCUSE_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"BOARD_ACCUES_RESON"	VARCHAR(1000)		NULL,
	"BOARD_ACCUSE_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "TB_BOARD_ACCUSE"."BOARD_ACCUSE_NO" IS '신고번호';

COMMENT ON COLUMN "TB_BOARD_ACCUSE"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "TB_BOARD_ACCUSE"."USER_NO" IS '신고자';

COMMENT ON COLUMN "TB_BOARD_ACCUSE"."BOARD_ACCUES_RESON" IS '신고사유';

COMMENT ON COLUMN "TB_BOARD_ACCUSE"."BOARD_ACCUSE_DATE" IS '신고일';

CREATE TABLE "TB_COMMENT_ACCUSE" (
	"COMMENT_ACCUSE_NO"	NUMBER		NOT NULL,
	"COMMET_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"COMMENT_ACCUES_RESON"	VARCHAR(1000)		NULL,
	"COMMENT_ACCUSE_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "TB_COMMENT_ACCUSE"."COMMENT_ACCUSE_NO" IS '신고번호';

COMMENT ON COLUMN "TB_COMMENT_ACCUSE"."COMMET_NO" IS '댓글번호';

COMMENT ON COLUMN "TB_COMMENT_ACCUSE"."USER_NO" IS '신고자';

COMMENT ON COLUMN "TB_COMMENT_ACCUSE"."COMMENT_ACCUES_RESON" IS '신고사유';

COMMENT ON COLUMN "TB_COMMENT_ACCUSE"."COMMENT_ACCUSE_DATE" IS '신고일';

CREATE TABLE "TB_CHAT" (
	"CHAT_NO"	NUMBER		NOT NULL,
	"CHAT_ROOM_NO"	NUMBER		NOT NULL,
	"PET_NO"	NUMBER		NOT NULL,
	"CHAT_CONTENT"	VARCHAR2(1000)		NULL,
	"CHAT_SEND_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"CHAT_READ_YN"	CHAR(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "TB_CHAT"."CHAT_NO" IS '채팅내역번호';

COMMENT ON COLUMN "TB_CHAT"."CHAT_ROOM_NO" IS '채팅방번호';

COMMENT ON COLUMN "TB_CHAT"."PET_NO" IS '프로필번호';

COMMENT ON COLUMN "TB_CHAT"."CHAT_CONTENT" IS '채팅내용';

COMMENT ON COLUMN "TB_CHAT"."CHAT_SEND_DATE" IS '보낸시간';

COMMENT ON COLUMN "TB_CHAT"."CHAT_READ_YN" IS '읽음여부';

CREATE TABLE "TB_CHAT_ROOM" (
	"CHAT_ROOM_NO"	NUMBER		NOT NULL,
	"MEET_BOARD_NO"	NUMBER		NOT NULL,
	"HOST_PET_NO"	NUMBER		NOT NULL,
	"GUEST_PET_NO"	NUMBER		NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "TB_CHAT_ROOM"."CHAT_ROOM_NO" IS '채팅방번호';

COMMENT ON COLUMN "TB_CHAT_ROOM"."MEET_BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "TB_CHAT_ROOM"."HOST_PET_NO" IS '호스트프로필번호';

COMMENT ON COLUMN "TB_CHAT_ROOM"."GUEST_PET_NO" IS '게스트프로필번호';

COMMENT ON COLUMN "TB_CHAT_ROOM"."STATUS" IS '채팅방상태';

ALTER TABLE "TB_USER" ADD CONSTRAINT "PK_USER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "TB_ROLE" ADD CONSTRAINT "PK_ROLE" PRIMARY KEY (
	"ROLE_ID"
);

ALTER TABLE "TB_EMAIL_AUTH" ADD CONSTRAINT "PK_EMAIL_AUTH" PRIMARY KEY (
	"EMAIL_AUTH_EMAIL"
);

ALTER TABLE "TB_HOS_RECORDS" ADD CONSTRAINT "PK_HOS_RECORDS" PRIMARY KEY (
	"HOS_NO"
);

ALTER TABLE "TB_WALK_RECORDS" ADD CONSTRAINT "PK_WALK_RECORDS" PRIMARY KEY (
	"WALK_NO"
);

ALTER TABLE "TB_PET" ADD CONSTRAINT "PK_PET" PRIMARY KEY (
	"PET_NO"
);

ALTER TABLE "TB_ACCUSE" ADD CONSTRAINT "PK_ACCUSE" PRIMARY KEY (
	"ACCUSE_NO"
);

ALTER TABLE "TB_SUGGESTION" ADD CONSTRAINT "PK_SUGGESTION" PRIMARY KEY (
	"SUG_NO"
);

ALTER TABLE "TB_BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "TB_MEETUP" ADD CONSTRAINT "PK_MEETUP" PRIMARY KEY (
	"MEETUP_NO"
);

ALTER TABLE "TB_MATCHING" ADD CONSTRAINT "PK_MATCHING" PRIMARY KEY (
	"MEET_BOARD_NO"
);

ALTER TABLE "TB_FILE" ADD CONSTRAINT "PK_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "TB_MYPAGE_FILE" ADD CONSTRAINT "PK_MYPAGE_FILE" PRIMARY KEY (
	"FILE_MYPAGE_NO"
);

ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "TB_MATCHING_REVIEW" ADD CONSTRAINT "PK_MATCHING_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "TB_CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CTG_NO"
);

ALTER TABLE "TB_PET_CATEGORY" ADD CONSTRAINT "PK_PET_CATEGORY" PRIMARY KEY (
	"PET_CTG_NO"
);

ALTER TABLE "TB_LIKE" ADD CONSTRAINT "PK_LIKE" PRIMARY KEY (
	"BOARD_NO",
	"USER_NO"
);

ALTER TABLE "TB_STAR" ADD CONSTRAINT "PK_STAR" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "TB_MATCHING_FAVORITE" ADD CONSTRAINT "PK_MATCHING_FAVORITE" PRIMARY KEY (
	"USER_NO",
	"MEET_BOARD_NO"
);

ALTER TABLE "TB_MEETUP_ATTEND" ADD CONSTRAINT "PK_MEETUP_ATTEND" PRIMARY KEY (
	"MEETUP_NO",
	"USER_NO"
);

ALTER TABLE "TB_BOARD_ACCUSE" ADD CONSTRAINT "PK_BOARD_ACCUSE" PRIMARY KEY (
	"BOARD_ACCUSE_NO"
);

ALTER TABLE "TB_COMMENT_ACCUSE" ADD CONSTRAINT "PK_COMMENT_ACCUSE" PRIMARY KEY (
	"COMMENT_ACCUSE_NO"
);

ALTER TABLE "TB_CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY (
	"CHAT_NO"
);

ALTER TABLE "TB_CHAT_ROOM" ADD CONSTRAINT "PK_CHAT_ROOM" PRIMARY KEY (
	"CHAT_ROOM_NO"
);

ALTER TABLE "TB_USER" ADD CONSTRAINT "FK_ROLE_TO_USER_1" FOREIGN KEY (
	"ROLE_ID"
)
REFERENCES "TB_ROLE" (
	"ROLE_ID"
);

ALTER TABLE "TB_USER" ADD CONSTRAINT "FK_MYPAGE_FILE_TO_USER_1" FOREIGN KEY (
	"FILE_MYPAGE_NO"
)
REFERENCES "TB_MYPAGE_FILE" (
	"FILE_MYPAGE_NO"
);

ALTER TABLE "TB_HOS_RECORDS" ADD CONSTRAINT "FK_PET_TO_HOS_RECORDS_1" FOREIGN KEY (
	"PET_NO"
)
REFERENCES "TB_PET" (
	"PET_NO"
) ON DELETE CASCADE;

ALTER TABLE "TB_WALK_RECORDS" ADD CONSTRAINT "FK_PET_TO_WALK_RECORDS_1" FOREIGN KEY (
	"PET_NO"
)
REFERENCES "TB_PET" (
	"PET_NO"
) ON DELETE CASCADE;

ALTER TABLE "TB_WALK_RECORDS" ADD CONSTRAINT "FK_FILE_TO_WALK_RECORDS_1" FOREIGN KEY (
	"FILE_MYPAGE_NO"
)
REFERENCES "TB_MYPAGE_FILE" (
	"FILE_MYPAGE_NO"
);

ALTER TABLE "TB_PET" ADD CONSTRAINT "FK_USER_TO_PET_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_PET" ADD CONSTRAINT "FK_FILE_TO_PET_1" FOREIGN KEY (
	"FILE_MYPAGE_NO"
)
REFERENCES "TB_MYPAGE_FILE" (
	"FILE_MYPAGE_NO"
) ON DELETE CASCADE;

ALTER TABLE "TB_ACCUSE" ADD CONSTRAINT "FK_USER_TO_ACCUSE_1" FOREIGN KEY (
	"ACCUSED_USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_ACCUSE" ADD CONSTRAINT "FK_USER_TO_ACCUSE_2" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_SUGGESTION" ADD CONSTRAINT "FK_USER_TO_SUGGESTION_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_BOARD" ADD CONSTRAINT "FK_USER_TO_BOARD_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_BOARD" ADD CONSTRAINT "FK_FILE_TO_BOARD_1" FOREIGN KEY (
	"FILE_NO"
)
REFERENCES "TB_FILE" (
	"FILE_NO"
);

ALTER TABLE "TB_BOARD" ADD CONSTRAINT "FK_CATEGORY_TO_BOARD_1" FOREIGN KEY (
	"CTG_NO"
)
REFERENCES "TB_CATEGORY" (
	"CTG_NO"
);

ALTER TABLE "TB_BOARD" ADD CONSTRAINT "FK_PET_CATEGORY_TO_BOARD_1" FOREIGN KEY (
	"PET_CTG_NO"
)
REFERENCES "TB_PET_CATEGORY" (
	"PET_CTG_NO"
);

ALTER TABLE "TB_MATCHING" ADD CONSTRAINT "FK_USER_TO_MATCHING_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_MATCHING" ADD CONSTRAINT "FK_PET_TO_MATCHING_1" FOREIGN KEY (
	"PET_NO"
)
REFERENCES "TB_PET" (
	"PET_NO"
) ON DELETE CASCADE;

ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "FK_USER_TO_COMMENT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_COMMENT" ADD CONSTRAINT "FK_BOARD_TO_COMMENT_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "TB_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "TB_MATCHING_REVIEW" ADD CONSTRAINT "FK_USER_TO_REVIEW_1" FOREIGN KEY (
	"WRITER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_MATCHING_REVIEW" ADD CONSTRAINT "FK_CHAT_ROOM_TO_REVIEW_1" FOREIGN KEY (
	"CHAT_ROOM_NO"
)
REFERENCES "TB_CHAT_ROOM" (
	"CHAT_ROOM_NO"
);

ALTER TABLE "TB_MATCHING_REVIEW" ADD CONSTRAINT "FK_PET_TO_REVIEW_1" FOREIGN KEY (
	"RECEIVE_PET_NO"
)
REFERENCES "TB_PET" (
	"PET_NO"
) ON DELETE CASCADE;

ALTER TABLE "TB_LIKE" ADD CONSTRAINT "FK_BOARD_TO_LIKE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "TB_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "TB_LIKE" ADD CONSTRAINT "FK_USER_TO_LIKE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_STAR" ADD CONSTRAINT "FK_BOARD_TO_STAR_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "TB_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "TB_MATCHING_FAVORITE" ADD CONSTRAINT "FK_USER_TO_FAVORITE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_MATCHING_FAVORITE" ADD CONSTRAINT "FK_MATCHING_TO_FAVORITE_1" FOREIGN KEY (
	"MEET_BOARD_NO"
)
REFERENCES "TB_MATCHING" (
	"MEET_BOARD_NO"
);

ALTER TABLE "TB_MEETUP_ATTEND" ADD CONSTRAINT "FK_MEETUP_TO_MEETUP_ATTEND_1" FOREIGN KEY (
	"MEETUP_NO"
)
REFERENCES "TB_MEETUP" (
	"MEETUP_NO"
);

ALTER TABLE "TB_MEETUP_ATTEND" ADD CONSTRAINT "FK_USER_TO_MEETUP_ATTEND_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_BOARD_ACCUSE" ADD CONSTRAINT "FK_BOARD_TO_BOARD_ACCUSE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "TB_BOARD" (
	"BOARD_NO"
);

ALTER TABLE "TB_BOARD_ACCUSE" ADD CONSTRAINT "FK_USER_TO_BOARD_ACCUSE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_COMMENT_ACCUSE" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_ACCUSE_1" FOREIGN KEY (
	"COMMET_NO"
)
REFERENCES "TB_COMMENT" (
	"COMMENT_NO"
);

ALTER TABLE "TB_COMMENT_ACCUSE" ADD CONSTRAINT "FK_USER_TO_COMMENT_ACCUSE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "TB_CHAT" ADD CONSTRAINT "FK_CHAT_ROOM_TO_CHAT_1" FOREIGN KEY (
	"CHAT_ROOM_NO"
)
REFERENCES "TB_CHAT_ROOM" (
	"CHAT_ROOM_NO"
);

ALTER TABLE "TB_CHAT" ADD CONSTRAINT "FK_PET_TO_CHAT_1" FOREIGN KEY (
	"PET_NO"
)
REFERENCES "TB_PET" (
	"PET_NO"
) ON DELETE CASCADE;

ALTER TABLE "TB_CHAT_ROOM" ADD CONSTRAINT "FK_MATCHING_TO_CHAT_ROOM_1" FOREIGN KEY (
	"MEET_BOARD_NO"
)
REFERENCES "TB_MATCHING" (
	"MEET_BOARD_NO"
);

ALTER TABLE "TB_CHAT_ROOM" ADD CONSTRAINT "FK_PET_TO_CHAT_ROOM_1" FOREIGN KEY (
	"HOST_PET_NO"
)
REFERENCES "TB_PET" (
	"PET_NO"
) ON DELETE CASCADE;

ALTER TABLE "TB_CHAT_ROOM" ADD CONSTRAINT "FK_PET_TO_CHAT_ROOM_2" FOREIGN KEY (
	"GUEST_PET_NO"
)
REFERENCES "TB_PET" (
	"PET_NO"
) ON DELETE CASCADE;

DROP SEQUENCE SEQ_USER_NO;
DROP SEQUENCE SEQ_HOS_NO;
DROP SEQUENCE SEQ_WALK_NO;
DROP SEQUENCE SEQ_PET_NO;
DROP SEQUENCE SEQ_ACCUSE_NO;
DROP SEQUENCE SEQ_SUG_NO;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_MEETUP_NO;
DROP SEQUENCE SEQ_MEET_BOARD_NO;
DROP SEQUENCE SEQ_FILE_NO;
DROP SEQUENCE SEQ_MYPAGE_FILE_NO;
DROP SEQUENCE SEQ_COMMENT_NO;
DROP SEQUENCE SEQ_REVIEW_NO;
DROP SEQUENCE SEQ_CTG_NO;
DROP SEQUENCE SEQ_PET_CTG_NO;
DROP SEQUENCE SEQ_BOARD_ACCUSE_NO;
DROP SEQUENCE SEQ_COMMENT_ACCUSE_NO;
DROP SEQUENCE SEQ_CHAT_NO;
DROP SEQUENCE SEQ_CHAT_ROOM_NO;

CREATE SEQUENCE SEQ_USER_NO;
CREATE SEQUENCE SEQ_HOS_NO;
CREATE SEQUENCE SEQ_WALK_NO;
CREATE SEQUENCE SEQ_PET_NO;
CREATE SEQUENCE SEQ_ACCUSE_NO;
CREATE SEQUENCE SEQ_SUG_NO;
CREATE SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_MEETUP_NO;
CREATE SEQUENCE SEQ_MEET_BOARD_NO;
CREATE SEQUENCE SEQ_FILE_NO;
CREATE SEQUENCE SEQ_MYPAGE_FILE_NO;
CREATE SEQUENCE SEQ_COMMENT_NO;
CREATE SEQUENCE SEQ_REVIEW_NO;
CREATE SEQUENCE SEQ_CTG_NO;
CREATE SEQUENCE SEQ_PET_CTG_NO;
CREATE SEQUENCE SEQ_BOARD_ACCUSE_NO;
CREATE SEQUENCE SEQ_COMMENT_ACCUSE_NO;
CREATE SEQUENCE SEQ_CHAT_NO;
CREATE SEQUENCE SEQ_CHAT_ROOM_NO;

INSERT INTO TB_ROLE VALUES('R0','관리자');
INSERT INTO TB_ROLE VALUES('R1','초급');
INSERT INTO TB_ROLE VALUES('R2','중급');
INSERT INTO TB_ROLE VALUES('R3','고급');

INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'베스트');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'공지사항');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'실종동물');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'신고하기');

INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'꿀팁공유');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'QnA');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'수제간식레시피');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'전국동물자랑');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'무료나눔');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'돌봄SOS');

INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'정보공유');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'애견동반');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'애견용품');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'병원');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'트레이닝 센터');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'애완동물 도감');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'날씨');
INSERT INTO TB_CATEGORY VALUES(SEQ_CTG_NO.NEXTVAL,'뉴스레터');

INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'강아지');
INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'고양이');
INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'설치류');
INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'파충류');
INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'조류');
INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'어류');
INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'곤충');
INSERT INTO TB_PET_CATEGORY VALUES(SEQ_PET_CTG_NO.NEXTVAL,'양서류');

INSERT INTO TB_USER(USER_NO,USER_EMAIL,USER_PASS,USER_NICKNAME,USER_PHONE)
VALUES(SEQ_USER_NO.NEXTVAL,'admin@test.com','03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4','admin','010-1111-2222');
INSERT INTO TB_USER(USER_NO,USER_EMAIL,USER_PASS,USER_NICKNAME,USER_PHONE)
VALUES(SEQ_USER_NO.NEXTVAL,'user1@test.com','E6C3DA5B206634D7F3F3586D747FFDB36B5C675757B380C6A5FE5C570C714349','유저1','010-1111-3333');
INSERT INTO TB_USER(USER_NO,USER_EMAIL,USER_PASS,USER_NICKNAME,USER_PHONE)
VALUES(SEQ_USER_NO.NEXTVAL,'user2@test.com','1BA3D16E9881959F8C9A9762854F72C6E6321CDD44358A10A4E939033117EAB9','유저2','010-2222-2222');
INSERT INTO TB_USER(USER_NO,USER_EMAIL,USER_PASS,USER_NICKNAME,USER_PHONE)
VALUES(SEQ_USER_NO.NEXTVAL,'user3@test.com','3ACB59306EF6E660CF832D1D34C4FBA3D88D616F0BB5C2A9E0F82D18EF6FC167','유저3','010-3333-2222');
INSERT INTO TB_USER(USER_NO,USER_EMAIL,USER_PASS,USER_NICKNAME,USER_PHONE)
VALUES(SEQ_USER_NO.NEXTVAL,'user4@test.com','A417B5DC3D06D15D91C6687E27FC1705EBC56B3B2D813ABE03066E5643FE4E74','유저4','010-4444-2222');

UPDATE TB_USER SET ROLE_ID = 'R0'
WHERE USER_NO = 1;

INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 1, 'A', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 2, 'B', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 3, 'C', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 4, 'D', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 5, 'E', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 6, 'F', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 7, 'G', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 8, 'H', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 9, 'I', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);
INSERT INTO TB_FILE VALUES (SEQ_FILE_NO.NEXTVAL, 10, 'J', 'PETOPIA_20231017121442_54038.png', 'resources/board_upfiles', 1);

INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'첫 게시글 제목','첫 게시글 내용 첫 게시글 내용 첫 게시글 내용',1,8,1);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'2 게시글 제목','2 게시글 내용 2 게시글 내용 2 게시글 내용',2,7,1);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'3 게시글 제목','3 게시글 내용 3 게시글 내용 3 게시글 내용',2,8,1);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'4 게시글 제목','4 게시글 내용 4 게시글 내용 4 게시글 내용',3,8,2);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'5 게시글 제목','5 게시글 내용 5 게시글 내용 5 게시글 내용',4,8,2);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'6 게시글 제목','6 게시글 내용 6 게시글 내용 6 게시글 내용',2,8,2);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'7 게시글 제목','7 게시글 내용 7 게시글 내용 7 게시글 내용',1,9,1);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'8 게시글 제목','8 게시글 내용 8 게시글 내용 8 게시글 내용',5,6,1);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'9 게시글 제목','9 게시글 내용 9 게시글 내용 9 게시글 내용',4,5,3);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES(SEQ_BOARD_NO.NEXTVAL,'10 게시글 제목','10 게시글 내용 10 게시글 내용 10 게시글 내용',1,8,1);
INSERT INTO TB_BOARD(BOARD_NO,BOARD_TITLE,BOARD_CONTENT,USER_NO,CTG_NO,PET_CTG_NO)
VALUES( SEQ_BOARD_NO.NEXTVAL,'11 게시글 제목','11 게시글 내용 11게시글 내용 11 게시글 내용',2,8,1);

INSERT INTO TB_MYPAGE_FILE(FILE_MYPAGE_NO,ORIGINAL_NAME,UPLOAD_NAME,FILE_PATH)
VALUES (SEQ_MYPAGE_FILE_NO.NEXTVAL,'bono.jpg','PETOPIA_20231006161149_81420.jpg','resources/pet_upfiles');
INSERT INTO TB_PET(PET_NO,PET_NAME,PET_SPECIES,PET_SPECIFIC,PET_WEIGHT,PET_GENDER,PET_PERSONALITY,PET_ETC,USER_NO,FILE_MYPAGE_NO)
VALUES (SEQ_PET_NO.NEXTVAL,'강아지01','강아지','블랙푸들',5,'M','착함','기타사항없음',1,SEQ_MYPAGE_FILE_NO.CURRVAL);

INSERT INTO TB_MYPAGE_FILE(FILE_MYPAGE_NO,ORIGINAL_NAME,UPLOAD_NAME,FILE_PATH)
VALUES (SEQ_MYPAGE_FILE_NO.NEXTVAL,'bono.jpg','PETOPIA_20231006161149_81420.jpg','resources/pet_upfiles');
INSERT INTO TB_PET(PET_NO,PET_NAME,PET_SPECIES,PET_SPECIFIC,PET_WEIGHT,PET_GENDER,PET_PERSONALITY,PET_ETC,USER_NO,FILE_MYPAGE_NO)
VALUES (SEQ_PET_NO.NEXTVAL,'강아지02','강아지','토이푸들',6,'F','새침함','기타사항없음',1,SEQ_MYPAGE_FILE_NO.CURRVAL);

INSERT INTO TB_MYPAGE_FILE(FILE_MYPAGE_NO,ORIGINAL_NAME,UPLOAD_NAME,FILE_PATH)
VALUES (SEQ_MYPAGE_FILE_NO.NEXTVAL,'bono.jpg','PETOPIA_20231006161149_81420.jpg','resources/pet_upfiles');
INSERT INTO TB_PET(PET_NO,PET_NAME,PET_SPECIES,PET_SPECIFIC,PET_WEIGHT,PET_GENDER,PET_PERSONALITY,PET_ETC,USER_NO,FILE_MYPAGE_NO)
VALUES (SEQ_PET_NO.NEXTVAL,'강아지03','강아지','말티즈',3,'F','귀여움','기타사항없음',1,SEQ_MYPAGE_FILE_NO.CURRVAL);

INSERT INTO TB_MYPAGE_FILE(FILE_MYPAGE_NO,ORIGINAL_NAME,UPLOAD_NAME,FILE_PATH)
VALUES (SEQ_MYPAGE_FILE_NO.NEXTVAL,'bono.jpg','PETOPIA_20231006161149_81420.jpg','resources/pet_upfiles');
INSERT INTO TB_PET(PET_NO,PET_NAME,PET_SPECIES,PET_SPECIFIC,PET_WEIGHT,PET_GENDER,PET_PERSONALITY,PET_ETC,USER_NO,FILE_MYPAGE_NO)
VALUES (SEQ_PET_NO.NEXTVAL,'강아지04','강아지','허스키',10,'M','이쁨','기타사항없음',1,SEQ_MYPAGE_FILE_NO.CURRVAL);

INSERT INTO TB_MATCHING(MEET_BOARD_NO,MEET_BOARD_TITLE,PET_INFO,HOPE_ACTIVITY,USER_NO,PET_NO)
VALUES(SEQ_MEET_BOARD_NO.NEXTVAL,'저랑 같이','강아지!','같이 산책!',1,1);

COMMIT;