<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>footer</title>
    <style>
        footer{
            width: 100%;
            height: 250px;
            background-color: rgb(145, 130, 120);
            position: relative;
            z-index: 1;
        }
        #footer-wrap{
            width: 1000px;
            height: 100%;
            padding-top: 70px;
            margin: auto;
        }
        #footer-wrap div{
            margin-top: 12px;
        }
        #footer-wrap span{
            cursor: pointer;
        }
        #privacy-policy pre{
            height: 300px;
            font-size: 13px;
        }
        #partnership pre>div{
            font-size: 25px;
            font-weight: bold;
            color: rgb(94, 94, 94);
        }
        .modal-backdrop {
            z-index: -1;
        }

    </style>
</head>
<body>
    <footer>
        <div id="footer-wrap">
            <p>
                <div><b>주식회사 펫토피아</b></div>
                <div>대표 : 이승철  | 사업자등록번호 : 851-87-00622 | 주소 : 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</div>
                <div>고객센터 : 02-555-5555 | 이메일 : admin@test.com</div>
                <div><span data-toggle="modal" data-target="#partnership">제휴제안</span> | <span data-toggle="modal" data-target="#privacy-policy">개인정보처리방침</span></div>
            </p>
        </div>
        <div class="modal fade" id="privacy-policy">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">개인정보처리방침</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <pre>
제1조(개인정보의 처리목적)
① KH정보교육원은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제 18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
  1. 상담 문의
    - 국가기간 전략산업직종 훈련지원 안내, 훈련생 상담, 과정 및 일정 안내
  2. 홈페이지 회원 가입 및 관리, 서비스 제공
    - 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 각종 고지·통지, 교육 콘텐츠 제공, 평가, 증명서 발급(교육 수료증) 등 서비스 제공
  3. 국가기간 전략산업직종 훈련지원 및 수료 후 취업지원
    - 훈련생 상담, HRD 훈련생 등록, 훈련장려금 청구, 취업사실 확인, 교육확인서 발급, 수강증명서 발급, 훈련장려금 청구, 취업지원
    훈련장려금 청구, 취업지원
    
제2조(개인정보의 처리 및 보유 기간)
① KH정보교육원은 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
  1. 상담 문의
    1) 개인정보 이용 기간 : 상담 완료 시 까지
    2) 보유기간 : 상담 완료 후 3년
    3) 보유근거 : 정보주체의 동의를 받은 경우
  2. 홈페이지 회원 가입 및 관리, 서비스제공 : 홈페이지 탈퇴 시 까지
      다만, 관계 법령 위반에 따른 수사 조사 등이 진행 중인 경우에는 해당 수사조사 종료 시까지
  3. 국가기간 전략산업직종 훈련지원 및 수료 후 취업지원
    1) 개인정보 이용 기간 : 국가기간 전략산업직종 훈련과정 수료 후 7개월
    2) 보유기간 : 훈련과정 종료 후 5년
    3) 보유근거 : 국민내일배움카드 운영규정 제58조, 정보주체의 동의를 받은 경우
    
제3조(개인정보의 제3자 제공)
① KH정보교육원은 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
② KH정보교육원은 개인정보보호법 제17조 제1항에 의거하여 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
  1. 직업능력 심사평가원
    - 개인정보를 제공받는 자 : 한국기술교육대학교 직업능력 심사평가원
    - 제공받는 자의 개인정보 이용목적 : 이수자평가, 인증평가
    - 제공하는 개인정보 항목 : 성명, 전화번호, 상담내역, 훈련생 평가내역
    - 제공받는 자의 보유.이용기간: 평가 진행 완료 시 까지
  2. 온라인 평생교육원
    - 개인정보를 제공받는 자 : 한국기술교육대학교 온라인 평생교육원
    - 제공받는 자의 개인정보 이용목적 : 이수자평가, 인증평가
    - 제공하는 개인정보 항목 : 성명, 전화번호, 상담내역, 훈련생 평가내역
    - 제공받는 자의 보유.이용기간: 평가 진행 완료 시 까지
  3. 기타
    - 특정 사업 참여 시 사업운영 측에서 요구하는 개인정보
③ 제3자 제공의 내용이나 범위가 변경될 경우에는 지체없이 본 개인정보 처리 방침을 통하여 공개하도록 하겠습니다
                        </pre>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="partnership">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">고객센터</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <pre>
<div>02-555-5555</div>
평일  |   09:00 ~ 18:00(주말, 공휴일 휴무)
점심  |   12:00 ~ 13:00 
주소  |   서울시 종로구
E-MAIL   |   admin@test.com
                        </pre>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>