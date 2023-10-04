<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항/고객센터</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.1.4/tailwind.min.css">
	
    <style>
        div{/*border: 1px solid black;*/}
        .content-area{
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 78%;  
        }
        a {
            text-decoration: none;
            text-decoration-color: black;
        }
        .sug-background{
            display: flex;
            background-color: rgb(244, 217, 174);
            width: 500px;
            height: 80px;
            text-align: center;
            padding-top: 17px;
            font-size: 18px;
            font: bold;
        }
        p{float: left;}
        .sub-blank{margin-top: 60px;}
        .sub-sug{
            background-color: rgb(244, 217, 174);
            width: 530px;
            height: 220px;
            padding-left: 10px;
            float: right;
        }
        .sub-sug-head{
            padding-top: 10px;
            font-size: 20px;
            font-weight: bold;
        }
        .sub-sug-body{
            font-size: 23px;
            font-weight: bold;
        }
        .sub-sug-foot{
            margin: 0;
            padding: 0;
        }
        .sub-foot{
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .left-box{
            float: left;
            margin-left: 100px;
        }
        .right-box{
            margin-right: 100px;}
    </style>
    <style>
        .QnA-content{
            background-color: rgb(247, 222, 205);
            padding-top: 20px;
            padding-bottom: 20px;
            height: 100%;
        }
        .QnA-background{
            background-color: white;
            width: 900px;
            margin: auto;
        }
        #tbody{
            margin: auto;
            padding-top: 300px;
            width: 1200px;
            height: 680px;
        }
        .tbody-FAQ{
            height: 40px;
            font-size: 30px;
            font-weight: bold;
        }
        .QnA-blank{
            padding-top: 10px;
            padding-bottom: 10px;
        }
    </style>

    <style>
        .faq-box {
        border:2px solid black;
        background-color:#fff;
        color:inherit;
        padding:10px;
        }

        .faq-box__question {
        cursor:pointer;
        }

        .faq-box__question::after {
        content:"▼";
        float:right;
        }

        .faq-box > ul > li {
        padding:10px;
        }

        .faq-box > ul > li.hover > .faq-box__question::after {
        content:"▲";
        }

        .faq-box__answer {
        display:none;
        background-color:rgba(0,0,0,0.3);
        border-radius:10px;
        padding:10px;
        }
    </style>

</head>
<body>

	<%@ include file = "mysidebar.jsp" %>
	<div class="content-area">
	
        <div>
            <div class="left-box">
                <div class="sug-background">
                    <a href="#">
                        <p style="padding-top: 10px;">&nbsp;&nbsp;&nbsp;💌&nbsp;&nbsp;1:1 건의사항 작성</p>
                        <p style="font-size: 25px;">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>
                        <p style="font-size: 15px; padding-top: 11px;">건의사항이 있을 시 클릭해주세요</p>
                    </a>
                </div>
                
                <div class="sug-background sub-blank">
                    <a href="#">
                        <p style="padding-top: 10px;">&nbsp;&nbsp;&nbsp;🔍&nbsp;&nbsp;자주묻는 질문</p>
                        <p style="font-size: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>
                        <p style="font-size: 15px; padding-top: 11px;">궁금한 점을 검색해보세요</p>
                    </a>
                </div>
            </div>

            <div class="sub-sug right-box">
                <div class="sub-sug-head">고객센터</div>

                <div class="sub-sug-body">02-555-5555</div>

                <div class="sub-foot">
                    <div class="sub-sug-foot">평일 | 09:00 ~ 18:00(주말, 공휴일 휴무)</div>
                    <div class="sub-sug-foot">점심 | 12:00 ~ 13:00</div>
                    <div class="sub-sug-foot">주소 | 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</div>
                </div>

                <div class="sub-sug-foot">EMAIL | admin@test.com</div>
            </div>
        </div>


        <div id="tbody">

            <div>
                <div class="tbody-FAQ">FAQ</div>
            </div>

            <div class="QnA-content">

                <div class="QnA-blank">
                    
                    <section class="section section-faq">
                        <div class="container mx-auto">
                      
                          <div class="faq-box">
                            
                            <ul>
                              <li>
                                <div class="faq-box__question"><span>Q. 개인정보 변경은 어떻게 하나요?</span></div>
                                <div class="faq-box__answer">
                                  <div>
                                    - 마이페이지 > 내정보 변경 클릭 시 변경 가능합니다.
                                    </div>
                                  
                                </div>
                              </li>

                              <li>
                                <div class="faq-box__question"><span>Q. 질문내용</span></div>
                                <div class="faq-box__answer">
                                  <div>
                                    - 답변내용
                                  </div>
                                  
                                </div>
                              </li>

                              <li>
                                <div class="faq-box__question"><span>Q. 질문내용</span></div>
                                <div class="faq-box__answer">
                                  <div>
                                    - 답변내용
                                  </div>
                                  
                                </div>
                              </li>

                              <li>
                                <div class="faq-box__question"><span>Q. 질문내용</span></div>
                                <div class="faq-box__answer">
                                  <div>
                                    - 답변내용
                                  </div>
                                  
                                </div>
                              </li>

                              <li>
                                <div class="faq-box__question"><span>Q. 질문내용</span></div>
                                <div class="faq-box__answer">
                                  <div>
                                    - 답변내용
                                  </div>
                                  
                                </div>
                              </li>

                              <li>
                                <div class="faq-box__question"><span>Q. 질문내용</span></div>
                                <div class="faq-box__answer">
                                  <div>
                                    - 답변내용
                                  </div>
                                  
                                </div>
                              </li>
                              
                            </ul>
                          </div>
                        </div>
                      </section>
                </div>

                <script>
                    function FaqBox__init() {
                        $('.faq-box > ul > li').click(function() {
                            let $this = $(this);
                            
                            $this.siblings('.hover').find(' > .faq-box__answer').stop().slideUp(300); 
                            $this.siblings('.hover').removeClass('hover');
                            
                            if ( $this.hasClass('hover') ) {
                            $this.find(' > .faq-box__answer').stop().slideUp(300); 
                            $this.removeClass('hover');
                            }
                            else {
                            $this.find(' > .faq-box__answer').stop().slideDown(300); 
                            $this.addClass('hover');
                            }
                        });
                        
                        $('.faq-box__answer').click(function() {
                            return false;
                        });
                        }
                        FaqBox__init();
                </script>

                

            </div>

        </div>






	</div>

</body>
</html>