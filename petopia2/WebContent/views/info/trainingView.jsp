<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이닝 센터</title>
<style>
	section{
		width: 1000px;
        height: 2000px;
        margin: auto;
        position: relative;
	}

    #wrap{
        width: 780px;
        height: 100%;
        margin-top : 20px;
    }
</style>
</head>
<body>
	<section>
	
		<jsp:include page="infoSidebar.jsp" />
		
		<div id="wrap">
			<iframe width="560" height="315" src="https://www.youtube.com/embed/QkbVyXkhOEc" title="[강아지 훈련] 엎드려 개인기 가르치기 l 펫을부탁해" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/aFojR9xDl30" title="강아지 ‘기다려 교육’ 기초 편｜강형욱의 100초 레시피" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/pPQxZRkVcGE" title="베타의 점프 훈련" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/_xwnmbOWK6o" title="짖는 강아지, 블로킹을 통한 완벽한 교육법! [왜그랬개]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		</div>
		</section>

		<jsp:include page="../common/footer.jsp" />
</body>
</html>