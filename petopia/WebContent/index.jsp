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
	        	let mapContainer = document.getElementById('map'); // 지도를 표시할 div 
	            let mapOption = {
	        	        center: new kakao.maps.LatLng(37.56633, 126.97917), // 지도의 중심좌표
	        	        level: 8, // 지도의 확대 레벨
	        	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	        	    }; 
                
	        	// 지도를 생성한다 
	        	const map = new kakao.maps.Map(mapContainer, mapOption); 
                let mapBounds = map.getBounds();
                let south = mapBounds["qa"];
                let west = mapBounds["ha"];
                let north = mapBounds["pa"];
                let east = mapBounds["oa"];
                const geocoder = new kakao.maps.services.Geocoder();
                var transCoordCB = function(result, status){
                    if (status === kakao.maps.services.Status.OK) {
                        var markerPosition  = new kakao.maps.LatLng(result[0].x, result[0].y);
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });
                        marker.setMap(map);
                        console.log(markerPosition);
                    }
                }

                var markerPosition  = new kakao.maps.LatLng(37.56633, 126.97917);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);

	        	// 지도 영역 변화 이벤트를 등록한다
	        	kakao.maps.event.addListener(map, 'bounds_changed', function () {
                    updateMap();
	        	});
	        </script>
            <script>
                $(document).ready(function(){
                    updateMap();
                })
                function updateMap(){
                    mapBounds = map.getBounds();
                    console.log('지도의 남서쪽, 북동쪽 영역좌표는 '+mapBounds.toString()+'입니다.');
                    south = mapBounds["qa"];
                    west = mapBounds["ha"];
                    north = mapBounds["pa"];
                    east = mapBounds["oa"];

                    //console.log("남서쪽 : "+mapBounds["qa"]+", "+mapBounds["ha"]);
                    //console.log("북동쪽 : "+mapBounds["pa"]+", "+mapBounds["oa"]);
                    console.log("남서쪽 : "+south+", "+west);
                    console.log("북동쪽 : "+north+", "+east);
                    $.ajax({
                        url : "updateMap",
                        type : "post",
                        data : {
                            "south" : south,
                            "west" : west,
                            "north" : north,
                            "east" : east
                        },
                        success : function(result){
                            console.log(result[0]);
                            for(let i=0; i<10;i++){
                                geocoder.transCoord(result[0]["posX"], result[0]["posY"], transCoordCB, {
                                    input_coord : kakao.maps.services.Coords.WTM,
                                    output_coord : kakao.maps.services.Coords.WGS84
                                });
                            }
                        },
                        error : function(error){
                            console.log(error);
                        }
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