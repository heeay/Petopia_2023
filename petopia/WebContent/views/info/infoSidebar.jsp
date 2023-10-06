<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인포 사이드바</title>

	<style>
        #info-side-wrap{
            width: 220px;
            height: 100%;
            float: right;
        }
        #info-side{
            width: 200px;
            padding: 20px 8px;
            border-radius: 18px;
            margin-left: 20px;
            font-size: 18px;
            font-weight: 500;
            position: sticky;
            top: 120px;
            background-color: rgb(228, 156, 92);
        }
        #info-side a{
        	text-decoration : none;
        	color : black;
            display: block;
            width: 100%;
            cursor: pointer;
        }
        #info-side a:hover{
            color: dodgerblue;
        }
        
        #info-category li:not(#info-category li:last-child){ margin-bottom: 10px;}
        
        #sub-info{
            padding: 20px 8px;
            border-radius: 18px;
            background-color: rgb(245, 184, 162);
        }
    </style>
</head>
<body>

	<%@ include file="../common/header-min.jsp" %>
    
    <div id="info-side-wrap">
    	<input type="text" name="ctgNo" value="">
        <div id="info-side">
            <ul id="info-category">
                <li><a id="info-board">📢정보공유</a>
                    <ul id="sub-info" style="display: none;">
                    	<li><a href="<%= contextPath %>/share.in" id="ctgWith">🐾애견동반</a></li>
                        <li><a>🦴애견용품</a></li>
                        <li><a>🏥병원</a></li>
                    </ul>
                </li>
                <li><a>⚾트레이닝 센터</a></li>
                <li><a>📂애완동물 도감</a></li>
                <li><a>⛅날씨</a></li>
                <li><a>📄뉴스레터</a></li>
            </ul>
        </div>
    </div>
    
    <script>
        $(document).ready(function(){
            $("#info-board").click(function(){
                const infoCategory = $("#sub-info");
                if(infoCategory.css("display") == 'none'){
                    infoCategory.slideDown(100);
                }
                else{
                    infoCategory.slideUp(100);
                }
            });
        });
	</script>
      
    <script>
        $(function(){
        	$('#ctgWith').click(function(){
        		
        		$.ajax({
        			url : 'share.in',
        			data : {ctgNo : }
        			type : 'get',
        			success : function(result){
        				console.log('카테고리 번호 넘기기 성공');
        				console.log(result);
        			},
        			error : function(){
        				console.log('카테고리 번호 넘기기 실패');
        			}
        		});
        	});
        });
    </script>

</body>
</html>