<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유_애견동반 리스트</title>

<style>
	section{
		width: 1000px;
        height: 2000px;
        margin: auto;
        position: relative;
	}

    #wrap{
        width: 780px;
        height: 90%;
        margin-top : 20px;
    }
    
    .paging-area{
    	width : 780px;
    	height : 10%;
    }
    
    #content-area{text-align: right;}

    .info-list{
        border-collapse: separate;
        border-spacing: 0px 20px;
        display: flex;
        justify-content: center;
        background-color : rgb(255, 248, 240);
    }
    
    #no-list{font-size : 30px;}
    
    img{
    	width: 90%;
    	height: 100%;
    	margin-left: 15px;
    }
    
    .share-btn{
    	background-color: rgb(228, 156, 92);
    	color : white;
    	border-radius: 5px;
        margin: 2px;
        width: 30px;
        height: 30px;
        text-align: center;
        line-height: 15px;
        border : 0px;
    }
    
    .click-area:hover{cursor : pointer;}
    
    #info-no{display : none;}
</style>
</head>
<body>

	<section>
	
	<%@ include file="infoSidebar.jsp" %>
	
	<div id="wrap">
	
        <div id="content-area">
        	
        	<c:if test="${ not empty sessionScope.userInfo }">
        		<a href="<%= contextPath %>/insertForm.in" class="btn btn-sm btn-warning">글쓰기</a>
        	</c:if>
        	
        </div>

        <table class="info-list">
        	
        	<c:choose>
        		<c:when test="${ empty list }">
        			<tr>
                		<td id="no-list">조회된 게시글이 없습니다.</td>
            		</tr>
        		</c:when>
        		<c:otherwise>
        			<c:forEach var="info" items="${ requestScope.list }">
        				<tr class="click-area">
                    		<!-- 각 게시글 번호를 알아내기 위한 td (css영역에서 display:none으로 안 보이게 함) -->
                    		<td id="info-no">${ info.infoNo }</td>
                        	<td rowspan="2" width="400px" height="150px"><img src="${ info.titleImg }"></td>
                        	<td width="600px">${ info.infoTitle }</td>
                    	</tr>
	                	<tr>
	                    	<td>${ info.infoContent }</td>
	                	</tr>
        			</c:forEach>
        		</c:otherwise>
        	</c:choose>
            
        </table>
    </div>

    <div class="pagin-area" align="center">
        
        <c:choose>
        	<c:when test="${ empty list }">
        		<button disabled class="share-btn" style="background:rgba(228, 156, 92, 0.5)">1</button>
        	</c:when>
        	<c:otherwise>
        		<c:if test="${ requestScope.pi.currentPage != 1 }">
        			<button onclick="location.href='<%= contextPath %>/share.in?ictg=${ ctgNo }&ipage=${ pi.currentPage - 1 }'" class="share-btn">&lt;</button>
        		</c:if>
        		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
        			<c:choose>
        				<c:when test="${ pi.currentPage != p }">
        					<button onclick="location.href='<%= contextPath %>/share.in?ictg=${ ctgNo }&ipage=${ p }'" class="share-btn">${ p }</button>
        				</c:when>
        				<c:otherwise>
        					<button disabled class="share-btn" style="background:rgba(228, 156, 92, 0.5)">${ p }</button>
        				</c:otherwise>
        			</c:choose>
        		</c:forEach>
        		<c:if test="${ pi.currentPage != pi.maxPage }">
        			<button onclick="location.href='<%= contextPath %>/share.in?ictg=${ ctgNo }&ipage=${ pi.currentPage + 1 }'" class="share-btn">&gt;</button>
        		</c:if>
        	</c:otherwise>
        </c:choose>
        
    </div>
    
    <script>
    	$(function() {
    		$('.click-area').click(function(){
    			location.href = '<%= contextPath %>/detailShare.in?ino=' + $(this).children().eq(0).text();
    		});
    	});
    </script>
    
    </section>
    
    <jsp:include page="../common/footer.jsp" />

</body>
</html>