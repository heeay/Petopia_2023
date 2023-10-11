<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 기록 작성</title>

	<style>
        /*div{border: 1px solid black;}*/
        .content-area{
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 78%;  
        }
        input{border: none;}
        textarea{border: none;}
     </style>
     <style>
        #sug-content{
            padding-top: 15px;
            width: 1000px;
            height: 600px;
            margin: auto;
            display: block;
        }
        #sub-content-back{
            background-color: rgb(247, 222, 205);
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 40px;
            border-radius: 10px 10px 10px 10px;
            font-size: 17px;
            font-weight: bold;
        }
        #suggestion{
            padding-left: 5px;
            font-size: 30px;
            font-weight: bold;
            padding-bottom: 10px;
        }
        .input-width{
            width: 700px;
        }
        .float-left{
            float: left;
            width: 110px;
            height: 40px;
        }
        .float-right{
            float: right;
            width: 800px;
        }
        .float-right2{
            float: right;
            width: 800px;
        }
        .contentSize{height: 45px;}
        .contentSize2{height: 250px;}
        .btn-right{
            float: right;
            padding-right: 20px;
        }
    </style>
</head>
<body>

	<%@ include file = "mysidebar.jsp" %>
	<div class="content-area">

        <form action="">
        
            <div id="sug-content">

                <div>
                    
                    <div>
                        <div id="suggestion">병원기록</div>
                    </div>
                    

                    <div id="sub-content-back">
                        <div class="contentSize">
                            <div class="float-left">이름</div>
                            <div class="float-right"><input type="text" class="input-width" name="hosTitle"></div>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">일자</div>
                            <div class="float-right"><input type="date" name="" class="input-width" name="hosDate"></div>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">예방접종 종류</div>
                            <div class="float-right"><input type="text" class="input-width" name="hosVaccination"></div>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">질병 여부</div>
                            <div class="float-right"><input type="text" class="input-width" name="hosIllness"></div>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">약 복용 기록</div>
                            <div class="float-right"><input type="text" class="input-width" name="hosMedicine"></div>
                        </div>
                        <br>

                        <div class="contentSize2">
                            <div class="float-left">내용</div>
                            <div class="float-right2"><textarea name="" id="" cols="85" rows="9" style="resize:none;"></textarea></div>
                        </div>


                        
                        <div class="btn-right">
                            <button type="submit" class="btn btn-sm btn-secondary">제출</button>
                        </div>
                        <br>

                    </div>
                </div>


            </div>
        </form>




        </div>

	</div>
	

</body>
</html>