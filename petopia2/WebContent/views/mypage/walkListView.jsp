<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책기록 리스트</title>
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
        a {text-decoration: none;}
        .color-black{color: white;}
        .walk-title{
            height: 70px;
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
        .delete{
            font-size: 15px;
            margin-top: 32px;
            padding-top: 8px; 
            float: right;
            height: 40px;
            width: 70px;
            background-color: rgb(244, 217, 174);
            text-align: center;
            border-radius: 10px 10px 0px 0px;
        }
        .walk-list{
            background-color: rgb(244, 217, 174);
            margin-top: 30px;
            padding: 20px;
            height: 500px;
            border-radius: 10px;
        }
        .walk-date{padding-top: 8px;}
        .walkcontent{
            display: inline-table;
            padding-left: 30px;
            padding-right: 20px;
            padding-top: 70px;
            padding-bottom: 110px;
        }
        .btn-right{float: right;}
        .pointer-events-none{pointer-events: none;}
    </style>
    
</head>
<body>
    <%@ include file = "mysidebar.jsp" %>

	<div class="content-area">

        <div class="content-wrap">

            <div class="container">
                
                <div class="walk"> 
                    
                    <p class="walk-title">산책기록</p>

                    <form action="<%=contextPath %>/walkList.my">  
                        <p class="walk-date">
                            <input type="date" name="startDate"> ~ <input type="date" name="endDate">
                            <input type="hidden" name="cpage" value="${pi.currentPage}">
                            <button type="submit" class="btn-sm btn-secondary">조회</button>
                        </p>
                    </form>
                </div>

                <script>
                    // js url 가지고오기
                    //const searchParams = new URLSearchParams(location.search);

                    //for (const param of searchParams) {
                    //console.log(param);
                    //}

                    const urlParams = new URL(location.href).searchParams;

                    const startDate = urlParams.get('startDate');
                    const endDate = urlParams.get('endDate');


                    console.log(startDate);
                    console.log(endDate);

                    $(function () {

                    const dateControl = document.querySelector('input[name="startDate"]')
                    dateControl.value = startDate;

                    const dateControl2 = document.querySelector('input[name="endDate"]')
                    dateControl2.value = endDate;


                    //console.log(dateControl.value)

                    });

                </script>

                <div class="walk-list" id="list-area">
                	<c:choose>
                		<c:when test="${empty walkList}">
	                        <div>
	                        	<div align="center" class="pointer-events-none">등록된 기록이 없습니다.</div>
	                        </div>
	                    </c:when>
	                    <c:otherwise>
	                    	<c:forEach var="walk" items="${walkList}" varStatus="status">
	                            <div class="walkcontent content1">
	                                <input type="hidden" name="wno" value="${walk.walkNo}">
	                                <div class="btn-right">
	                                    <a href="<%=contextPath%>/deleteWalk.my?wno=${walk.walkNo}" class="btn btn-sm btn-danger" onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n삭제하시겠습니까??')){return false;}">—</a>
	                                </div>
	
	                                <div>
	                                    <img src="<%=contextPath%>/${walk.fileNo}" alt="산책기본" width="300" height="200">
	                                </div>
	
	                                <div>
	                                    <p class="walk-1">${walk.walkTitle}</p>
	                                    <p class="walk-2">${walk.walkDate}</p>
	                                </div>
	                            </div>
	                        </c:forEach>
	                    </c:otherwise>
                            
                   </c:choose>     
                    
                    <div class="btn btn-sm btn-secondary btn-right"><a href="<%=contextPath %>/walkEnroll.my" class="color-black">작성하기</a></div>
                </div>

                <script>
                    $(function(){
                        $('#list-area>div').click(function(){
                            location.href="<%= contextPath %>/walkDetail.my?wno=" + $(this).children().eq(0).val();
                        });
                    })
    
                </script>
                
            </div>

            <div class="page-btn">
                
                <c:if test="${ pi.currentPage ne 1 }">
        			<button onclick="location.href='<%=contextPath%>/walkList.my?cpage=${pi.currentPage-1}'" class="btn btn-sm btn-secondary">&lt;</button>
        		</c:if>
        		<c:forEach var="i" begin="${ pi.startPage }" end="${pi.endPage}">
        		<c:choose>
        			<c:when test="${ pi.currentPage ne 1 }">
	        			<button onclick="location.href='<%=contextPath%>/walkList.my?cpage=${i}'" class="btn btn-sm btn-secondary">${i}</button>
	        		</c:when>
	        		<c:otherwise>
	        			<button disabled class="btn btn-sm btn-gracolors">${i}</button>
	        		</c:otherwise>
        		</c:choose>
        		</c:forEach>
        		<c:if test="${ pi.currentPage ne maxPage }">
            		<button onclick="location.href='<%=contextPath%>/walkList.my?cpage=${pi.currentPage+1}'" class="btn btn-sm btn-secondary">&gt;</button>
        		</c:if>
            </div>

        </div>
        
	</div>


    <script>
        // 체크박스 삭제

    </script>

</body>
</html>