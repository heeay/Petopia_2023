<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <form action="<%=contextPath%>/walkUpdate.my" method="post" enctype="multipart/form-data">
            <input type="hidden" name="wno" value="${wr.walkNo}">
            <div id="sug-content">

                <div>
                    
                    <div>
                        <div id="suggestion">산책기록</div>
                    </div>
                    

                    <div id="sub-content-back">
                        
                        <div class="contentSize">
                            <div class="float-left">제목</div>
                            <div class="float-right"><input type="text" class="input-width" name="walkTitle" value="${wr.walkTitle}" required></div>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">이름</div>
                            <div class="float-right">
                                <select class="input-width" name="petNo" style="border: none;" id="selectPetName">
                                	<c:forEach var="p" items="${petList}">
                                    	<option value="${p.petNo}">${p.petName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <script>
                            $("#selectPetName").val("${wr.petNo}").prop("selected", true);
                        </script>

                        <input type="hidden" name="walkDate">

                        <div class="contentSize2">
                            <div class="float-left">내용</div>
                            <div class="float-right2"><textarea cols="85" rows="9" style="resize:none;" name="walkContent" required>${wr.walkContent}</textarea></div>
                        </div>
                        <br><br>

                        <div class="contentSize1">
                            <div>
                                기존파일
                        	    <a href="<%=contextPath%>/${pf.filePath}/${pf.uploadName}" download="${pf.originalName}">
                                    ${pf.originalName}
                                    <input type="hidden" name="walkFileNo" value="${pf.fileNo}">
                                </a>
                            </div>

                            <br>
                            <div class="float-left">첨부파일</div>
                            <div><input type="file" name="walkFile" id="walkFile"></div>
                            
                        </div>

                        <div class="btn-right">
                            <button type="submit" class="btn btn-sm btn-secondary">수정</button>
                            <a href="javascript:history.back();" class="btn btn-sm btn-secondary">닫기</a>
                        </div>
                        
                        <br>
                    </div>
                </div>

                <script>
                    $(document).ready(function() {
                        $('button[type=submit]').attr('disabled', 'disabled');

                        // 파일 변경경시 버튼 활성화
                        $('input[type=file]').on('input', function() {
                            if ($(this).val() !== '') {
                                $('button').removeAttr("disabled");
                            }
                            else {
                                $('button').attr('disabled', 'disabled');
                            }
                        });
                        
                        // 옵션 변경 시 버튼 활성화
                        $('select').on('input', function() {
                            if ($(this).val() !== '') {
                                $('button').removeAttr("disabled");
                            }
                            else {
                                $('button').attr('disabled', 'disabled');
                            }
                        });

                        // 제목: 글 한글자라도 수정할 시 버튼 활성화
                        $('input[type=text]').on('input', function() {
                            if ($(this).val() !== '') {
                                $('button').removeAttr("disabled");
                            }
                            else {
                                $('button').attr('disabled', 'disabled');
                            }
                        });

                        // 내용: 글 한글자라도 수정할 시 버튼 활성화
                        $('textarea').on('input', function() {
                            if ($(this).val() !== '') {
                                $('button').removeAttr("disabled");
                            }
                            else {
                                $('button').attr('disabled', 'disabled');
                            }
                        });

                    });
                </script>


            </div>
        </form>
	 </div>

</body>
</html>