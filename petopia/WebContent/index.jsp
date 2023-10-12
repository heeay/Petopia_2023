<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width: 1000px;
            height: 2000px;
            padding: 20px 0;
            margin: auto;
            position: relative;
        }
        #content-wrap{
            width: 780px;
            height: 100%;
            float: left;
        }
        .board-item{
            width: 250px;
            height: 300px;
        }
        .board-item img{
            width: 200px;
            height: 160px;
        }
    </style>
    <style>
        #side-menu-wrap{
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
</head>
<body>
	<%@include file="views/common/header.jsp" %>
	<section>
    <div id="section-wrap">

        <div id="content-wrap">
            <div id="map" style="width:500px;height:400px;"></div>
            <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f9947b6fb5f9eb6975bcffce3ad32133&libraries=services"></script>
	        <script>
	        	var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	            var mapOption = {
	        	        center: new kakao.maps.LatLng(37.56633, 126.97917), // 지도의 중심좌표
	        	        level: 8, // 지도의 확대 레벨
	        	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	        	    }; 
                
	        	// 지도를 생성한다 
	        	const map = new kakao.maps.Map(mapContainer, mapOption);

                // 장소 검색 객체를 생성합니다
                var ps = new kakao.maps.services.Places();

                // 키워드로 장소를 검색합니다
                ps.keywordSearch('동물병원', placesSearchCB,{
                    location: new kakao.maps.LatLng(33.450701, 126.570667)
                });

                // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
                if (navigator.geolocation) {
                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var lat = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도
                        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                        message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
                        // 마커와 인포윈도우를 표시합니다
                        displayMarker(locPosition, message);
                    });
                } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
                    message = 'geolocation을 사용할수 없어요..'
        
                    displayMarker(locPosition, message);
                }

                // 지도에 마커와 인포윈도우를 표시하는 함수입니다
                function displayMarker(locPosition, message) {
                
                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({  
                        map: map, 
                        position: locPosition
                    }); 

                    var iwContent = message, // 인포윈도우에 표시할 내용
                        iwRemoveable = true;
                
                    // 인포윈도우를 생성합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content : iwContent,
                        removable : iwRemoveable
                    });

                    // 인포윈도우를 마커위에 표시합니다 
                    infowindow.open(map, marker);

                    // 지도 중심좌표를 접속위치로 변경합니다
                    map.setCenter(locPosition);      
                }    //키워드부분
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
                        map.setBounds(bounds);
                    } 
                }

                // 지도에 마커를 표시하는 함수입니다
                function displayMarker(place) {

                    // 마커를 생성하고 지도에 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: new kakao.maps.LatLng(place.y, place.x) 
                    });
                
                    // 마커에 클릭이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        var infowindow = new kakao.maps.InfoWindow({
                            content : '<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>',
                            removable : true
                        });
                        //infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                        infowindow.open(map, marker);
                    });
                }
	        </script>

            <div class="board-item">
                <img src="https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQkrjYxSfSHeCEA7hkPy8e2JphDsfFHZVKqx-3t37E4XKr-AT7DML8IwtwY0TnZsUcQ" alt="">
                <p>
                    <div>강아지 목욕 꿀팁!</div>
                    <div>나는야집사 2020-01-01 조회수[55]</div>
                </p>
            </div>
        </div>
        <div id="side-menu-wrap">
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