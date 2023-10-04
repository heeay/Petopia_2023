<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산랙기록 리스트</title>
    <style>
        div{/*border: 1px solid black;*/}
        .content-area{
            /*border: 1px solid black;*/
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 80%;
        }
        .page-btn{
            position:absolute;
            top: 95%;
            left: 40%;
        }
        .walk{
            display: block;
            margin-top: 10px;
        }
        .date{float: right;}
    </style>
    <style>
        .walk-title{
            font-size: 30px;
            font-weight: bold;
            border-top: none;
            padding-right: 50px;
            float: left;
        }
        .walk-1, .walk-2{
            margin: 0;
            padding: 0;
            display:inline-flex;
            font-size: 18px;
        }
        .walk-2{float: right;}
    </style>
    <style>
        .walk-list{
            background-color: rgb(244, 217, 174);
            margin-top: 45px;
            padding: 20px;
        }
        .walk-date{padding-top: 5px;}
        .checkDelete{
            background: rgb(244, 217, 174);
            padding: 5px;
            border-radius: 20px 20px 0px 0px;
            border: none;
            float: right;
        }
        .walkcontent{
            display: inline-table;
            padding-left: 30px;
            padding-right: 20px;
            padding-top: 10px;
            padding-bottom: 10px;
        }
    </style>
    
</head>
<body>
    <%@ include file = "mysidebar.jsp" %>

	<div class="content-area">

        <div class="content-wrap">

            <div class="container">
                
                <div class="walk"> 
                    
                    <p class="walk-title">산책기록</p>  
                    <p class="walk-date">
                        <input type="date" name="startday"> ~ <input type="date" name="lastday">
                    </p>
                    
                </div>

                <button type="button" class="btn-right checkDelete">삭제하기</button>
                
                <div class="walk-list">
                        
                    <div class="walkcontent content1">

                        <div>
                            <input type="checkbox" class="check" style="margin: 0;">
                        </div>

                        <div>
                            <img src="<%=contextPath%>\resources\images\walk.png" alt="산책기본" width="300" height="200">
                        </div>

                        <div>
                            <p class="walk-1">오늘의 산책기록1</p>
                            <p class="walk-2">2023-10-04</p>
                        </div>

                    </div>

                    <div class="walkcontent content2">

                        <div>
                            <input type="checkbox" class="check" style="margin: 0;">
                        </div>

                        <div>
                            <img src="<%=contextPath%>\resources\images\walk.png" alt="산책기본" width="300" height="200">
                        </div>

                        <div>
                            <p class="walk-1">오늘의 산책기록2</p>
                            <p class="walk-2">2023-10-04</p>
                        </div>

                    </div>

                    <div class="walkcontent content3">

                        <div>
                            <input type="checkbox" class="check" style="margin: 0;">
                        </div>

                        <div>
                            <img src="<%=contextPath%>\resources\images\walk.png" alt="산책기본" width="300" height="200">
                        </div>

                        <div>
                            <p class="walk-1">오늘의 산책기록3</p>
                            <p class="walk-2">2023-10-04</p>
                        </div>

                    </div>

                    <div class="walkcontent content4">

                        <div>
                            <input type="checkbox" class="check" style="margin: 0;">
                        </div>

                        <div>
                            <img src="<%=contextPath%>\resources\images\walk.png" alt="산책기본" width="300" height="200">
                        </div>

                        <div>
                            <p class="walk-1">오늘의 산책기록4</p>
                            <p class="walk-2">2023-10-04</p>
                        </div>

                    </div>

                    <div class="walkcontent content5">

                        <div>
                            <input type="checkbox" class="check" style="margin: 0;">
                        </div>

                        <div>
                            <img src="<%=contextPath%>\resources\images\walk.png" alt="산책기본" width="300" height="200">
                        </div>

                        <div>
                            <p class="walk-1">오늘의 산책기록5</p>
                            <p class="walk-2">2023-10-04</p>
                        </div>

                    </div>

                    <div class="walkcontent content6">

                        <div>
                            <input type="checkbox" class="check" style="margin: 0;">
                        </div>

                        <div>
                            <img src="<%=contextPath%>\resources\images\walk.png" alt="산책기본" width="300" height="200">
                        </div>

                        <div>
                            <p class="walk-1">오늘의 산책기록6</p>
                            <p class="walk-2">2023-10-04</p>
                        </div>

                    </div>
                    
                </div>

            </div>

            <div class="page-btn">
                페이지 버튼 위치
            </div>

        </div>
        
	</div>


    <script>
        // 체크박스 삭제

    </script>

</body>
</html>