<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 확인</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
        .sug-title{
            height: 70px;
            font-size: 30px;
            font-weight: bold;
            float: left;
        }
        .btn-right{
            float: right;
            margin-top: 20px;
            padding-right: 55px;
            height: 60px;
        }
        .margin-none{margin: 0; padding: 0;}
        .page-btn{
            position:absolute;
            top: 90%;
            left: 40%;
        }
        .pad-top{padding-top: 5px;}
        .mg-t-b{
            margin-top: 20px;
            margin-bottom: 50px;
        }
        .pointer-events-style{pointer-events: none;}
    </style>
    
</head>
<body>
	<%@ include file = "mysidebar.jsp" %>
	
	<div class="content-area">

        <div class="container margin-none">
            
            <div class="mg-t-b">
                <div class="sug-title">건의사항 확인</div>
            </div>
            
        </div>

        <div class="container">

            <table class="table table-hover" id="list-area">
		
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Title</th>
                        <th>Email</th>
                        <th>Date</th>
                    </tr>
                </thead>

                <tbody>
                <c:choose>
                	<c:when test="${empty sugList}">
                        	<tr>
                        		<td colspan="4" align="center" class="pointer-events-style">요청된 건의사항이 없습니다.</td>
                        	</tr>
                        </c:when>
                        <c:otherwise>
                        	<c:forEach var="sug" items="${sugList}">
                                <tr>
                                    <input type="hidden" name="sno" value="${sug.sugNo}">
                                    
                                    <td>${sug.ind}</td>
                                    <td>${sug.sugTitle}</td>
                                    <td>${sug.userEmail}</td>
                                    <td>${sug.sugDate}</td>
                                    <td style="width: 20px; border-top:none;">
				                        <a href="<%=contextPath%>/deleteSug.my?sno=${sug.sugNo}" class="btn btn-sm btn-danger" onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n삭제하시겠습니까??')){return false;}">—</a>
				                    </td>
                        	    </tr>
                        	</c:forEach>
                        	</c:otherwise>
                        </c:choose>
                </tbody>

            </table>
            
            <script>
                $(function(){

                    $('#list-area>tbody>tr').click(function(){
                        location.href="<%= contextPath %>/sugDetail.my?sno=" + $(this).children().eq(0).val();
                    });
                })

            </script>
            
        </div>

        <div class="page-btn">
        	<c:if test="${ pi.currentPage ne 1 }">
        		<button onclick="location.href='<%=contextPath%>/sugList.my?cpage=${pi.currentPage-1}'" class="btn btn-sm btn-secondary">&lt;</button>
        	</c:if>
        	<c:forEach var="i" begin="${ pi.startPage }" end="${pi.endPage}">
        		<c:choose>
        			<c:when test="${ pi.currentPage ne 1 }">
	        			<button onclick="location.href='<%=contextPath%>/sugList.my?cpage=${i}'" class="btn btn-sm btn-secondary">${i}</button>
	        		</c:when>
	        		<c:otherwise>
	        			<button disabled class="btn btn-sm btn-gracolors">${i}</button>
	        		</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	<c:if test="${ pi.currentPage ne maxPage }">
            	<button onclick="location.href='<%=contextPath%>/sugList.my?cpage=${pi.currentPage+1}'" class="btn btn-sm btn-secondary">&gt;</button>
        	</c:if>
        </div>

	</div>

</body>
</html>