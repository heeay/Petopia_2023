<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="petopia.com.kh.jsp.user.model.vo.User"%>
<%
	String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <!--나눔 팬 폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <style>
        *{
            padding: 0px;
            margin: 0px;
            box-sizing: border-box;
        }
        body{
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none;
            background-color: rgb(255, 243, 224);
        }
        a{
            text-decoration: none;
        }
        ul,ol{
            list-style: none;
        }
        header,section,footer,div,li{
            /*border: 1px solid seagreen;*/
            box-sizing: border-box;
        }
    </style>
    <style>
        header{
            width: 100%;
            height: 500px;
            background-color: rgb(122, 105, 92);
            position: relative;
            z-index: 0;
        }
        section{
            width: 100%;
            background-color: rgb(255, 243, 224);
            position: relative;
            z-index: 1;
        }
        #header-empty{
            height: 0px;
        }
        #header-wrap{
            width: 1200px;
            height: 500px;
            position: fixed;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            z-index: 0;
        }
        .header-logo{
            width: 180px;
            height: 100%;
            float: left;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 50px;
            background-color: rgb(255, 205, 124);
        }
        .logo{
            width: 100px;
            margin: auto;
        }
        .header-navi{
            height: 100%;
            float: left;
        }
        .header-navi-item{
            width: 120px;
            height: 100%;
            float: left;
        }
        .header-navi a{
        	text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            color: black;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            line-height: 75px;
        }
        .header-navi a:hover{
            color: dodgerblue;
        }
        .user-navi{
            float: right;
        }
        .user-navi-item{
            width: 200px;
            height: 100%;
            float: left;
        }
        .user-nickname{
            width: 220px;
            text-align: right;
            padding: 0 5px;
        }
        .user-nickname > span{
            display: inline-block;
            width: 180px;
            height: 100%;
            padding: 0 5px;
        }
        .user-navi-item a{
            text-align: right;
        }
        .user-navi-icon-btn{
            width: 50px;
            height: 100%;
            float: left;
            position: relative;
        }
        #header-bar-wrap{
            width: 100%;
            height: 80px;
        }
        #fixed-header-bar-wrap{
            width: 100%;
            height: 80px;
            position: fixed;
            z-index: 10;
            top: 0px;
            left: 0px;
            background-color: rgb(224, 198, 180);
        }
        .header-bar{
            width: 1100px;
            height: 100%;
            margin: auto;
        }
        .header-tool{
            width: 100%;
            height: 100%;
            border: none;
            line-height: 75px;
            background-color: unset;
        }
        .header-tool:hover{
            color: dodgerblue;
        }
        .header-search-bar-wrap{
            width: 360px;
            height: 35px;
            position: absolute;
            top: 20px;
            right: 10px;
        }
        .header-search-bar{
            width: 85%;
            height: 100%;
            border: 2px solid rgb(80, 49, 8);
            border-radius: 10px 0 0 10px;
            padding: 0 10px;
            margin: 0;
            box-sizing: border-box;
            float: left;
            box-shadow: 4px 5px 5px -4px black;
        }
        .header-search-bar:focus{
            outline: none;
        }
        .header-search-btn{
            width: 15%;
            height: 100%;
            color: rgb(80, 49, 8);
            background-color: rgb(255, 193, 99);
            border-style: solid;
            border-color: rgb(80, 49, 8);
            border-width: 2px 2px 2px 0;
            border-radius: 0 10px 10px 0;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            float: left;
            box-shadow: -4px 5px 5px -4px black;
        }
        #file-area{
            width: 50px;
            display: inline-block;
        }
        .rounded-circle{
            width: 28px;
            height: 28px;
        }
    </style>
    <style>
        /* 이미지 영역 사이즈 조절 */
        .swiper {
            width: 1200px;
            height: 420px;
        }

        /* 이미지 사이즈 조절 */
        .swiper-slide>img {
            width : 100%;
            height : 100%;
            object-fit: cover;
        }

        /* 화살표 버튼색 변경 (기본색은 파란색) */
        div[class^=swiper-button] {
            color : white;
            display : none; /* 아니면 안보이게 숨기기도 가능 */
        }
        .swiper-pagination{
            display: none;
        }
        .swiper-scrollbar{
            display: none;
        }
        #typo1{
            font-size: 56px;
            letter-spacing: 4px;
            text-align: right;
            position: absolute;
            top: 150px;
            left: 350px;
            font-family: 'Nanum Pen Script', cursive;
            color: rgba(0, 0, 0, 0.8);
        }
        #typo2{
            font-size: 56px;
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-family: 'Nanum Pen Script', cursive;
        }
        #typo3{
            font-size: 56px;
            letter-spacing: 4px;
            position: absolute;
            top: 70px;
            left: 700px;
            font-family: 'Nanum Pen Script', cursive;
            color: rgba(0, 0, 0, 0.70);
        }
        #typo4-1{
            font-size: 56px;
            letter-spacing: 4px;
            text-align: right;
            position: absolute;
            top: 130px;
            left: 110px;
            font-family: 'Nanum Pen Script', cursive;
            color: rgba(0, 0, 0, 0.8);
        }
        #typo4-2{
            font-size: 56px;
            letter-spacing: 4px;
            text-align: right;
            position: absolute;
            top: 190px;
            left: 770px;
            font-family: 'Nanum Pen Script', cursive;
            color: rgba(0, 0, 0, 0.8);
        }
    </style>
    <script>
        $(document).ready(function(){
            $(document).bind("dragstart", function(){return false});
        })
    </script>
    <!--<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        //네이버 로그아웃
        var testPopUp;
        function openPopUp() {
            testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=no,scrollbars=no,resizable=no,width=1,height=1");
        }
        function closePopUp(){
            testPopUp.close();
        }
        function naverLogout() {
        	openPopUp();
            closePopUp();
        }
        //카카오 로그아웃
        Kakao.init('f9947b6fb5f9eb6975bcffce3ad32133');
        function kakaoLogout() {
            if (Kakao.Auth.getAccessToken()) {
              Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                  console.log(error)
                },
              })
              Kakao.Auth.setAccessToken(undefined)
            }
          }
    </script>-->
    
</head>
<body>
    <div id="fixed-header-bar-wrap">
        <div class="header-bar">
            <div class="header-logo">
                <a href="<%=contextPath %>"><img class="logo" src="<%=contextPath %>/resources/images/logo.png" alt=""></a>
            </div>
            <ul class="header-navi">

                <li class="header-navi-item"><a href="<%= contextPath %>/main.bo">커뮤니티</a></li>
                <li class="header-navi-item"><a href="<%= contextPath %>/share.in?ictg=12&ipage=1">정보</a></li>

                <!--<li class="header-navi-item"><a href="#">행사</a></li>-->
                <li class="header-navi-item"><a href="<%=contextPath %>/main.pb">매칭</a></li>
            </ul>
            <ul class="header-navi user-navi">
                
 <c:choose>
        <c:when test="${ userInfo ne null }">
                    <li class="user-navi-item"><a href="<%=contextPath %>/login">로그인</a></li>
       </c:when>
       <c:otherwise>
                    <li class="user-navi-item user-nickname"><span><a href="<%=contextPath %>/main.my">
                        <div id="file-area">
                        	
              <c:choose>
                       <c:when test="${ userInfo.fileMypageNo eq '/' }">
                            	<img src="<%=contextPath%>\resources\images/profil.png" class="rounded-circle" alt="프로필기본" id="titleImg">
                       </c:when>
                       <c:otherwise>
                			<c:set var="url" value="${ userInfo.fileMypageNo }" />
                			<c:choose>
                				<c:when test="${ ( url.substring(0, url.indexOf('/')) ne 'https:' ) and ( url.substring(0, url.indexOf('/')) ne 'http:')"}
                				<img src="<%=contextPath%>/${ userInfo.fileMypageNo }" class="rounded-circle" alt="프로필사진">
                				</c:when>
                				<c:otherwise>
                				<img src="${ userInfo.fileMypageNo }" class="rounded-circle" alt="프로필사진">
                				</c:otherwise>
                			</c:choose>
                	  </c:otherwise>
              </c:choose>
      </c:otherwise>
                        </div>
                      ${ userInfo.userNickname }
                    </a></span>님</li>
                    <li class="user-navi-icon-btn"><button class="header-tool" type="button" onclick="location.href='<%=contextPath %>/logout'"><span class="material-symbols-outlined icon-size">logout</span></button></li>
 </c:choose>
                <li class="user-navi-icon-btn">
                    <button class="header-tool header-search-tool"><span class="material-symbols-outlined icon-size">search</span></button>
                    <form class="header-search-bar-wrap" style="display: none;" action="test" method="get">
                        <input class="header-search-bar" type="text" name="query">
                        <button type="submit" class="header-search-btn"><span class="material-symbols-outlined icon-size">search</span></button>
                    </form>
                </li>
                <li class="user-navi-icon-btn"><button class="header-tool" type="button" onclick=""><span class="material-symbols-outlined icon-size">menu</span></button></li>
            </ul>
        </div>
    </div>
    <header>
        <div id="header-empty"></div>
        <div id="header-wrap">
            <div id="header-bar-wrap"></div>
            <!--<div id="header-bar-wrap">
                <div class="header-bar">
                    <div class="header-logo">
                        <a href="<%=contextPath %>"><img class="logo" src="<%=contextPath %>/resources/images/logo.png" alt=""></a>
                    </div>
                    <ul class="header-navi">
                        <li class="header-navi-item"><a href="<%= contextPath %>/main.bo">커뮤니티</a></li>
                        <li class="header-navi-item"><a href="<%= contextPath %>/share.in?ictg=12&ipage=1">정보</a></li>
                        <li class="header-navi-item"><a href="#">행사</a></li>
                        <li class="header-navi-item"><a href="<%=contextPath %>/main.pb">매칭</a></li>
                    </ul>
                    <ul class="header-navi user-navi">
                        
				<c:choose>
						<c:when test="${ empty userInfo  }>
                            <li class="user-navi-item"><a href="<%=contextPath %>/login">로그인</a></li>
      					</c:when>
      				<c:otherwise>         
                            <li class="user-navi-item user-nickname"><span><a href="<%=contextPath %>/views/mypage/mygradeView.jsp"><%=userInfo.getUserNickname() %></a></span>님</li>
                            <li class="user-navi-item"><a 
                    
                            <c:choose>
                            	<c:when test="${ userInfo.userMethod == 1}">
                            		onclick="naverLogout();"
                            	</c:when>
                           		<c:otherwise>
                           			<c:if test="${ userInfo.userMethod == 2}">
                           			onclick="kakaoLogout();"
                           			</c:if>
                           		</c:otherwise>
                            
                            </c:choose>
							 href="<%=contextPath %>/logout">로그아웃</a></li>
						</c:otherwise>
			</c:choose>
                        <li class="user-navi-icon-btn">
                            <button class="header-tool header-search-tool"><span class="material-symbols-outlined icon-size">search</span></button>
                            <form class="header-search-bar-wrap" style="display: none;" action="test" method="get">
                                <input class="header-search-bar" type="text" name="query">
                                <button type="submit" class="header-search-btn"><span class="material-symbols-outlined icon-size">search</span></button>
                            </form>
                        </li>
                        <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">menu</span></a></li>
                    </ul>
                </div>
            </div>-->
            <div id="content_1">
                <!-- Slider main container -->
                <div class="swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/07/31/11/42/bordeaux-868991_1280.jpg"><div id="typo1">펫들의 유토피아!<br>펫토피아</div></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/01/15/16/48/winter-1142029_1280.jpg"><div id="typo2">펫토피아에 오신 것을 환영합니다!</div></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_1280.jpg"><div id="typo3">펫들의 유토피아!<br>펫토피아</div></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2017/05/09/23/02/dog-2299480_1280.jpg"><div id="typo4-1">펫들의 유토피아!</div><div id="typo4-2">펫토피아</div></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/06/04/21/30/swans-1436266_1280.jpg"></div>
                    </div>
            
                    <!-- If we need pagination -->
                    <div class="swiper-pagination"></div>
            
                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
            
                    <!-- If we need scrollbar -->
                    <div class="swiper-scrollbar"></div>
                </div>
            </div>
        </div>
    </header>
    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 4000 // 4초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
    </script>
    <script>
        $(document).ready(function(){
            /*const headerBarWrap = document.getElementById("fixed-header-bar-wrap");
            $(window).scroll(function(){
                if($(window).scrollTop()>80){
                    headerBarWrap.style.display="block";
                }
                else{
                    headerBarWrap.style.display="none";
                }
            });*/

            $(".header-search-tool").click(function(){
                if($(this).siblings(".header-search-bar-wrap").css("display")=="none"){
                    $(this).siblings(".header-search-bar-wrap").show(100);
                    $(this).siblings(".header-search-bar-wrap").children().select();
                }
                else{
                    $(this).siblings(".header-search-bar-wrap").hide(100);
                }
            });
            $(".header-search-bar").focusout(function(){
                $(this).parent().css("display","none");
            });
        })
    </script>
</body>
</html>