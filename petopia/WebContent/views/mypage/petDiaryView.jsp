<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 다이어리</title>

	<style>
        .content-area{
            border: 1px solid black;
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 80%;
        }
        .content-title{
            margin-bottom: 30px;
        }
        .hos-content{
            float: left;
            margin-left: 150px;
        }
        .walk-content{
            float: right;
            margin-right: 150px;
        }


        .hos-content, .walk-content{
            width: 400px;
            height: 500px;
            background-color: rgb(244, 217, 174);
            padding-left: 30px;
            padding-right: 30px;
        }
        

    </style>

</head>
<body>

	<%@ include file = "mysidebar.jsp" %>

	    <div class="content-area">
            
            <div class="hos">

                <div  class="hos-content">
                    <form action="">
                        <legend class="content-title">병원기록</legend>
                        <ul>
                            <li>이름</li>
                            <li></li>
                            <li></li>
                        </ul>
                    </form>
                </div>

            </div>

            <div class="walk">
                
                <div  class="walk-content">
                    <form action="">
                        <legend  class="content-title">산책기록</legend>
                        <ul>
                            <li>이름</li>
                        </ul>
                    </form>
                </div> 
            </div>

        </div>

	
</body>
</html>