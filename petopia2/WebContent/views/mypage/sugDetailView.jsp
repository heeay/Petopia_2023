<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 확인</title>
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
        .contentSize3{height: 150px;}
        .btn-right{
            float: right;
            padding-right: 20px;
        }
    </style>
    <style>
        .text-auto{
            overflow: auto;
        }
        .sug-size{
            background-color: white;
            width: 700px;
            margin-right: 100px;
            border-radius: 10px;
        }
        .sug-text{
            padding-left: 15px;
            padding-right: 15px;
        }
        .radius{border-radius: 10px;}
    </style>
</head>
<body>

	<%@ include file = "mysidebar.jsp" %>
	<div class="content-area">

            <div id="sug-content">

                <div>
                    
                    <div>
                        <div id="suggestion">건의사항 No.${sug.sugNo}</div>
                    </div>
                    

                    <div id="sub-content-back">
                    
                        <div class="contentSize">
                            <div class="float-left">일자</div>
                            <div class="float-right sug-size">
                                <span class="sug-text">${sug.sugDate}</span>
                            </div>
                        </div>
                        
                        <div class="contentSize">
                            <div class="float-left">제목</div>
                            <div class="float-right sug-size">
                                <span class="sug-text">${sug.sugTitle}</span>
                            </div>
                        </div>

                        <div class="contentSize2">
                            <div class="float-left">내용</div>
                            <div class="float-right2">
                                <textarea cols="82" rows="9" class="sug-text text-auto radius" readonly>${sug.sugContent}</textarea>
                            </div>
                        </div>

                        <div class="contentSize3">
                        	<c:choose>
                        		<c:when test="${!empty file}">
                        			<c:forEach var="file" items="${file}">
	                                    <div class="contentSize">
	                                        <div class="float-left">첨부파일</div>
	                                        
	                                        <div class="float-right">
	                                            <a href="<%=contextPath%>/${file.filePath}/${file.uploadName}" download="${file.originalName}">
	                                                ${file.originalName}
	                                            </a>
	                                        </div>
	                                    </div>
	                                </c:forEach>
	                            </c:when>
	                            <c:otherwise>    
	                                <br><br>
	                                <div>첨부파일이 존재하지 않습니다.</div>
	                            </c:otherwise>
                           </c:choose>
                        </div>

                        <div class="btn-right">
                        	<a href="javascript:history.back();" class="btn btn-sm btn-secondary">뒤로가기</a>
                        </div>
                        <br>

                    </div>
                </div>
                
            </div>


        </div>

	</div>
	

</body>
</html>