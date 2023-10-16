<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.mypage.model.vo.*"%>    
<%
	ArrayList<Pet> petList = (ArrayList<Pet>)request.getAttribute("petList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책기록 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        div{/*border: 1px solid black;*/}
        .content-area{
            /*border: 1px solid black;*/
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
            border-radius: 10px;
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
    </style>

</head>
<body>

    <%@ include file = "mysidebar.jsp" %>

    <div class="content-area">
        <form action="<%=contextPath%>/walkInsert.my" method="post" enctype="multipart/form-data">
            <div id="sug-content">

                <div>
                    
                    <div>
                        <div id="suggestion">산책기록</div>
                    </div>
                    

                    <div id="sub-content-back">
                        <div class="contentSize">
                            <div class="float-left">제목</div>
                            <div class="float-right"><input type="text" class="input-width" name="walkTitle" required></div>
                        </div>
                        <div class="contentSize">
                            <div class="float-left">이름</div>
                            <div class="float-right">
                                <select class="input-width" name="petNo" style="border: none;">
                                	<% for(Pet p : petList) {%>
                                    	<option value="<%=p.getPetNo() %>"><%=p.getPetName() %></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>

                        <input type="hidden" name="walkDate">

                        <div class="contentSize2">
                            <div class="float-left">내용</div>
                            <div class="float-right2"><textarea cols="85" rows="9" style="resize:none;" name="walkContent" required></textarea></div>
                        </div>
                        <br><br>
                        <div class="contentSize3">
                            <div class="float-left">첨부파일</div>
                            <div><input type="file" name="walkFile" id="walkFile" required></div>
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