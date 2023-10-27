<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 작성하기</title>
	<style>
        /*div{border: 1px solid black;}*/
        .content-area{
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 80%;
        }
    </style> 
    <style>
        a {text-decoration: none;}
        input{border: none;}
        textarea{border: none;}
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
            border-radius: 10px 0px 10px 10px;
            font-size: 17px;
            font-weight: bold;
        }
        #delete{
            font-size: 20px;
            margin-top: 25px;
            float: right;
            height: 40px;
            width: 35px;
            background-color: rgb(247, 222, 205);
            text-align: center;
            border-radius: 10px 10px 0px 0px;
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
            width: 100px;
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
        .contentSize{height: 60px;}
        .contentSize2{height: 250px;}
        .contentSize3{height: 45px;}
        .btn-right{
            float: right;
            padding-right: 20px;
        }
        .x-btn-style{
            border: none; 
            background-color: rgba(247, 222, 205, 0);
        }
    </style>
</head>
<body>
	 <%@ include file = "mysidebar.jsp" %>
	 
	 <div class="content-area">
        <form action="<%=contextPath%>/sugEnroll.my" enctype="multipart/form-data" method="post">
            <input type="hidden" name="userNo" value="${userInfo.userNo}">
            <div id="sug-content">

                <div>
                    <div>
                        <div id="delete">
                            <button type="reset" class="x-btn-style">⨉</button>
                        </div>
                        <div id="suggestion">건의사항 작성</div>
                    </div>
                    

                    <div id="sub-content-back">
                        <div>
                            <div class="contentSize">
                                <div class="float-left">제목</div>
                                <div class="float-right"><input type="text" class="input-width" name="title"></div>
                            </div>

                            <div class="contentSize2">
                                <div class="float-left">내용</div>
                                <div class="float-right2"><textarea name="content" cols="85" rows="9"></textarea></div>
                            </div>
                            <br><br>
                            <div class="contentSize3">
                                <div class="float-left">첨부파일 1</div>
                                <div><input type="file" name="file1" id="file1"></div>
                            </div>
                            <div class="contentSize3">
                                <div class="float-left">첨부파일 2</div>
                                <div><input type="file" name="file2" id="file2"></div>
                            </div>
                            <div class="contentSize3">
                                <div class="float-left">첨부파일 3</div>
                                <div><input type="file" name="file3" id="file3"></div>
                            </div>
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

</body>
</html>