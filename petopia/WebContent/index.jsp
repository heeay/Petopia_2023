<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int accessCount = application.getAttribute("accessCount")!=null ? (Integer)application.getAttribute("accessCount") : 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아에 오신 것을 환영합니다</title>
<style>
        section{
            width: 100%;
        }
        #section-wrap{
            width: 1250px;
            height: 2000px;
            padding: 20px 0;
            margin: auto;
            position: relative;
        }
        #content-wrap{
            width: 750px;
            height: 100%;
            float: left;
        }
        .board-item{
            width: 250px;
            height: 300px;
            float: left;
        }
        .board-thumbnail-wrap{
            width: 200px;
            height: 160px;
            margin: auto;
            
        }
        .board-thumbnail-wrap > img{
            width: 100%;
            height: 100%;
        }
        .text-icon{
            /*color: #6d6d6d;*/
            filter: invert(44%) sepia(2%) saturate(8%) hue-rotate(319deg) brightness(94%) contrast(90%);
        }
    </style>
    <style>
        #left-side-menu-wrap{
            width: 280px;
            height: 100%;
            float: left;
        }
    </style>
    <style>
        #right-side-menu-wrap{
            width: 220px;
            height: 100%;
            float: left;
        }
        #side-menu{
            width: 200px;
            padding: 20px 8px;
            border-radius: 18px;
            margin-left: 20px;
            font-size: 18px;
            font-weight: 500;
            position: sticky;
            z-index: 10;
            top: 120px;
            background-color: rgb(228, 156, 92);
        }
        #side-menu a{
            display: block;
            width: 100%;
            cursor: pointer;
        }
        #side-menu a:hover{
            color: dodgerblue;
        }
        #category li:not(#category li:last-child){ margin-bottom: 10px; }
        #sub-category{
            padding: 20px 8px;
            border-radius: 18px;
            background-color: rgb(245, 184, 162);
        }
        .sub-category-content{
            padding: 20px 8px;
            border-radius: 18px;
            background-color: rgb(255, 234, 226);
        }
    </style>
    <style>
        #board-swiper-wrap{
            overflow: hidden;
        }
        /* 이미지 영역 사이즈 조절 */
        .board-swiper {
            width: 750px;
            height: 300px;
        }

        /* 이미지 사이즈 조절 */
        .swiper-slide>img {
            width : 100%;
            height : 100%;
            object-fit: cover;
        }

        /* 화살표 버튼색 변경 (기본색은 파란색) */
        div[class^=board-swiper-button] {
            color : rgb(117, 81, 28);
            /*display : none; /* 아니면 안보이게 숨기기도 가능 */
        }
    </style>
</head>
<body>
	<%@include file="views/common/header.jsp" %>
	<section>
    <div id="section-wrap">
        <div id="left-side-menu-wrap">
            <div id="access-current">현재 접속자 : <span id="access-cur-num"><%=accessCount %></span></div>
            <div id="map" style="width:250px;height:200px;"></div>
            <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9947b6fb5f9eb6975bcffce3ad32133&libraries=services"></script>
	        <script>
	        	var mapContainer = document.getElementById('map'); // 지도를 표시할 div
	            var mapOption = {
	        	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        	        level: 6, // 지도의 확대 레벨
	        	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	        	    };
                
	        	// 지도를 생성한다
	        	const map = new kakao.maps.Map(mapContainer, mapOption);

                // 장소 검색 객체를 생성합니다
                var ps = new kakao.maps.services.Places();

                // 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
                kakao.maps.event.addListener(map, 'dragend', function() {
                    // 지도 중심좌표를 얻어옵니다 
                    var latlng = map.getCenter();
                    console.log("중심 : "+latlng);
                    ps.keywordSearch('동물병원', placesSearchCB,{
                        location: latlng
                    });
                });

                // 키워드부분
                // 키워드로 장소를 검색합니다
                ps.keywordSearch('동물병원', placesSearchCB,{
                    location: new kakao.maps.LatLng(33.450701, 126.570667)
                });
                // 키워드 검색 완료 시 호출되는 콜백함수 입니다
                function placesSearchCB (data, status, pagination) {
                    if (status === kakao.maps.services.Status.OK) {

                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표를 추가합니다
                        var bounds = new kakao.maps.LatLngBounds();

                        for (var i=0; i<data.length; i++) {
                            displayMarker(data[i]);
                            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                        }

                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                        //map.setBounds(bounds);
                    } 
                }

                // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
                if (navigator.geolocation) {
                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var lat = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도
                        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                        
                        ps.keywordSearch('동물병원', placesSearchCB,{
                            location: locPosition
                        });
                        map.setCenter(locPosition);
                    });
                } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
                    
                    ps.keywordSearch('동물병원', placesSearchCB,{
                        location: locPosition
                    });
                    map.setCenter(locPosition);
                }

                // 지도에 마커를 표시하는 함수입니다
                function displayMarker(place) {

                    // 마커를 생성하고 지도에 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(place.y, place.x) 
                    });
                    var clickInfoWindow = new kakao.maps.InfoWindow({
                        content : '<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>',
                        removable : true
                    });
                    var hoverInfoWindow = new kakao.maps.InfoWindow({
                        content : '<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>'
                    });

                    // 마커에 클릭이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        clickInfoWindow.open(map, marker);
                    });
                    // 마커에 마우스오버 이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'mouseover', function() {
                        // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                        hoverInfoWindow.open(map, marker);
                    });
                    // 마커에 마우스아웃 이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                        hoverInfoWindow.close();
                    });
                }
	        </script>
        </div>
        <div id="content-wrap">
            <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
            <canvas id="access-chart" width="250" height="200"></canvas>
            <script>
                new Chart(document.getElementById("access-chart"), {
                type: 'line',
                data: {
                    labels: [1750,1800,1850,1900,1950,1999,2050],
                    datasets: [{ 
                        data: [119,120,111,133,221,183,208],
                        label: "접속자",
                        borderColor: "#3e95cd",
                        fill: true
                    }]
                },
                options: {
                    title: {
                        display: false
                    },
                    responsive: false,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    },
                }
            });
            </script>-->
            <div id="board-swiper-wrap">
                <!-- Slider main container -->
                <div class="board-swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide">
                            <div class="board-item">
                                <div class="board-thumbnail-wrap">
                                    <img src="https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQkrjYxSfSHeCEA7hkPy8e2JphDsfFHZVKqx-3t37E4XKr-AT7DML8IwtwY0TnZsUcQ" alt="">
                                </div>
                                <p>
                                    <div>강아지 목욕 꿀팁! [125]</div>
                                    <div><img class="text-icon" src="<%=contextPath %>/resources/images/writer.svg">나는야집사</div>
                                    <div>
                                        <img class="text-icon" src="<%=contextPath %>/resources/images/create_date.svg">2020-01-01
                                        <img class="text-icon" src="<%=contextPath %>/resources/images/views.svg">55
                                    </div>
                                </p>
                            </div>
                            <div class="board-item">
                                <div class="board-thumbnail-wrap">
                                    <img src="https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg" alt="">
                                </div>
                                <p>
                                    <div>강아지 목욕 꿀팁! [125]</div>
                                    <div><img class="text-icon" src="<%=contextPath %>/resources/images/writer.svg">나는야집사</div>
                                    <div>
                                        <img class="text-icon" src="<%=contextPath %>/resources/images/create_date.svg">2020-01-01
                                        <img class="text-icon" src="<%=contextPath %>/resources/images/views.svg">55
                                    </div>
                                </p>
                            </div>
                            <div class="board-item">
                                <div class="board-thumbnail-wrap">
                                    <img src="https://cdn.pixabay.com/photo/2018/07/14/17/46/raccoon-3538081_1280.jpg" alt="">
                                </div>
                                <p>
                                    <div>강아지 목욕 꿀팁! [125]</div>
                                    <div><img class="text-icon" src="<%=contextPath %>/resources/images/writer.svg">나는야집사</div>
                                    <div>
                                        <img class="text-icon" src="<%=contextPath %>/resources/images/create_date.svg">2020-01-01
                                        <img class="text-icon" src="<%=contextPath %>/resources/images/views.svg">55
                                    </div>
                                </p>
                            </div>
                        </div>
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
            <script>
                // 슬라이더 동작 정의
                const boardSwiper = new Swiper('.board-swiper', {
                    //autoplay : {
                    //    delay : 4000 // 3초마다 이미지 변경
                    //},
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
            <div class="board-item">
                <div class="board-thumbnail-wrap">
                    <img src="https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQkrjYxSfSHeCEA7hkPy8e2JphDsfFHZVKqx-3t37E4XKr-AT7DML8IwtwY0TnZsUcQ" alt="">
                </div>
                <p>
                    <div>강아지 목욕 꿀팁!</div>
                    <div>나는야집사 2020-01-01 조회수[55]</div>
                </p>
            </div>
        </div>
        <div id="right-side-menu-wrap">
            <div id="side-menu">
                <ul id="category">
                    <li><a>⭐베스트</a></li>
                    <li><a>📋공지사항</a></li>
                    <li><a id="animal-board">🐾동물게시판</a>
                        <ul id="sub-category" style="display: none;">
                            <li><a class="sub-category-title">🐶강아지</a>
                                <ul class="sub-category-content" style="display: none;">
                                    <li><a>꿀팁공유</a></li>
                                    <li><a>QnA</a></li>
                                    <li><a>수제간식 레시피</a></li>
                                    <li><a>전국 동물자랑</a></li>
                                    <li><a>무료나눔</a></li>
                                    <li><a>돌봄SOS</a></li>
                                </ul>
                            </li>
                            <li><a class="sub-category-title">🐱고양이</a>
                                <ul class="sub-category-content" style="display: none;">
                                    <li><a>꿀팁공유</a></li>
                                    <li><a>QnA</a></li>
                                    <li><a>수제간식 레시피</a></li>
                                    <li><a>전국 동물자랑</a></li>
                                    <li><a>무료나눔</a></li>
                                    <li><a>돌봄SOS</a></li>
                                </ul>
                            </li>
                            <li><a class="sub-category-title">🐹설치류</a>
                                <ul class="sub-category-content" style="display: none;">
                                    <li><a>꿀팁공유</a></li>
                                    <li><a>QnA</a></li>
                                    <li><a>수제간식 레시피</a></li>
                                    <li><a>전국 동물자랑</a></li>
                                    <li><a>무료나눔</a></li>
                                    <li><a>돌봄SOS</a></li>
                                </ul>
                            </li>
                            <li><a class="sub-category-title">🐍파충류</a>
                                <ul class="sub-category-content" style="display: none;">
                                    <li><a>꿀팁공유</a></li>
                                    <li><a>QnA</a></li>
                                    <li><a>수제간식 레시피</a></li>
                                    <li><a>전국 동물자랑</a></li>
                                    <li><a>무료나눔</a></li>
                                    <li><a>돌봄SOS</a></li>
                                </ul>
                            </li>
                            <li><a class="sub-category-title">🦜조류</a>
                                <ul class="sub-category-content" style="display: none;">
                                    <li><a>꿀팁공유</a></li>
                                    <li><a>QnA</a></li>
                                    <li><a>수제간식 레시피</a></li>
                                    <li><a>전국 동물자랑</a></li>
                                    <li><a>무료나눔</a></li>
                                    <li><a>돌봄SOS</a></li>
                                </ul>
                            </li>
                            <li><a class="sub-category-title">🐠어류</a>
                                <ul class="sub-category-content" style="display: none;">
                                    <li><a>꿀팁공유</a></li>
                                    <li><a>QnA</a></li>
                                    <li><a>수제간식 레시피</a></li>
                                    <li><a>전국 동물자랑</a></li>
                                    <li><a>무료나눔</a></li>
                                    <li><a>돌봄SOS</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a>📢실종게시판</a></li>
                    <li><a>🚨신고하기</a></li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $("#animal-board").click(function(){
                const subCategory = $("#sub-category");
                if(subCategory.css("display") == 'none'){
                    subCategory.slideDown(100);
                }
                else{
                    subCategory.slideUp(100);
                }
            });
            $(".sub-category-title").click(function(){
                const ul = $(this).next();
                if(ul.css("display") == "none"){
                    $(".sub-category-content").not(ul).slideUp(100);
                    ul.slideDown(100);
                }
                else{
                    ul.slideUp(100);
                }
            });
        });
        </script>
</section>
	<%@include file="views/common/footer.jsp" %>
</body>
</html>