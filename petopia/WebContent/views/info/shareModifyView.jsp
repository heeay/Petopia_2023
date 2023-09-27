<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

<style>
	section{
		width: 1000px;
        height: 800px;
        margin: auto;
        position: relative;
	}

    div{
        border : 1px solid red;
    }

    #wrap{
        width: 780px;
        height: 100%;
        margin-top : 20px;
    }

    #modify-form{
        background-color: rgb(255, 248, 240);
    }

    #modify-form th{
        padding-left: 30px;
    }

    #modify-form th, #modify-form td{
        padding-bottom: 5px;
        padding-top: 10px;
    }

    #modify-form input, #modify-form textarea{
        width: 600px;
    }

    .rating {
    width: 180px;
    }

    .rating__star {
    cursor: pointer;
    color: orange;
    }
</style>
</head>
<body>

	<%@ include file="../common/header-min.jsp" %>
	
	<section>
	
        <%@ include file="infoSidebar.jsp" %>
        
        <div id="wrap">
        
           <h4>게시글 작성</h4>
            <br>

            <form enctype="multipart/form-data" id="modify-form" method="post">

                <table align="center">

                    <tr>
                        <th width="150">제목</th>
                        <td witdh="600"><input type="text" name="title" required value="작성제목"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="category">
                                <option value="병원">병원</option>
                                <option value="애견동반">애견동반</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>별점</th>
                        <td>
                            <i class="rating__star far fa-star"></i>
                            <i class="rating__star far fa-star"></i>
                            <i class="rating__star far fa-star"></i>
                            <i class="rating__star far fa-star"></i>
                            <i class="rating__star far fa-star"></i>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea name="content"rows="20" style="resize: none;">작성한 내용</textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file" name="upfile"></td>
                    </tr>

                </table>

                <div align="right">
                    <button type="submit" class="btn btn-sm btn-warning">수정</button>
                    <button type="reset" class="btn btn-sm btn-secondary">취소</button>
                </div>

            </form>
    
        </div>
        
    </section>

    <script>

    const ratingStars = [...document.getElementsByClassName("rating__star")];

    function executeRating(stars) {
        const starClassActive = "rating__star fas fa-star";
        const starClassInactive = "rating__star far fa-star";
        const starsLength = stars.length;
        let i;

        stars.map((star) => {
            star.onclick = () => {
            i = stars.indexOf(star);

            if (star.className == starClassInactive) {
                for (i; i >= 0; --i) stars[i].className = starClassActive;
            } else {
                for (i; i < starsLength; ++i) stars[i].className = starClassInactive;
            }
            };
        });
    }

    executeRating(ratingStars);

    </script>

</body>
</html>