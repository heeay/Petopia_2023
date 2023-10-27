<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.board.model.vo.Board, petopia.com.kh.jsp.common.model.vo.PageInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인게시판</title>

<!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- overal -->
<style>
    #wrapper{

        width: 1100px;
        height: 800px;
        margin: auto;
        
        
        background-color: rgb(255, 248, 240);
    }

    #search-area{
       width : 1100px;
       height : 15%;
     
       display : flex;
       justify-content: space-around;
       align-items: center;
    }

    #content-area{

       
        height : 75%;
        width : 1100px;
    }

</style>


<style>

    #content-items{ 
       
       /* 2차원 flex */
   
  
    
    }

   

   .content-item{
    
    
      
       
   }
   .content-item img{
       width : 100%;
       height : 80%;
   }


   /* 1번째는 img입니당 */
   .content-item p{
       display: flex;
      justify-content: center;
      font-size: larger;
      font-weight: 600;
      
   }

   .content-item span{
       
    }

    
  
   #pasing-area{
       display : flex;
       justify-content: center;
   }
   #pasing-area button{
       margin : 0px 5px;
       background-color: rgb(247, 189, 96);
   }



       
            .one{
                display : flex;
                width : 500px;
                height : 500px;
                 justify-content: center;
                 align-items: center;

            }

            .four{
                display : grid;
                 justify-content: center;
                 
                 grid-template-rows : 300px 300px;
                 grid-template-columns : 400px 400px;
                 
                 row-gap : 100px;
                 column-gap : 200px;
 
            }

            .nine{
                 
                 display : grid;
                 justify-content: center;
                 
                 grid-template-rows : 150px 150px 150px;
                 grid-template-columns : 200px 200px 200px;
                 
                 row-gap : 50px;
                 column-gap : 70px;
   
             }
 
       
        /* <!-- search --> */
        
            #search-header{
                /* display : flex;
                justify-content: center; */
                width : 50%;
        
            }
            #search-form{
                display : flex;
                align-items: center;
            }
            #search-bar{
                position : relative;
                display : flex;
                width : 100%;
                align-items: center;
            }
            #search-count{
                
                
            }   
        
        
            #search-text {
                width: 100%; /*search-bar의 100%길이란 뜻*/
            
                /* border: 1px solid #bbb; */
                
                border-radius: 10px;
                padding : 1%;
                font-size: 15px;
            
            }
        
           
            #search-radio{
                /* border: 1px solid green; */
                width : 30%;
                margin-left : 10px;
                box-sizing: border-box;
            }
        
            #search-btn{
                position : absolute;
                right : 10px;
                border : none;
                background-color: white;
            }
            #insert-board{
                width : 100px;
            }
        
            #insert-board a{
                font-style : none;
            }
        
        
        
            .search-count{
                list-style : none;
            }
            #search-count a{
                text-decoration: none;
                color : brown;
            }
            #search-count-list{
                display : none;
            }
            #search-count-list li{
                margin: -5px;
            }
            #search-count-toggle button{
                background-color: rgb(247, 189, 96);
            }
            /* #search-count-default:hover + #search-count-list {
                display: block;
        
            } */
            #insert-board-btn {
                background-color: rgb(247, 189, 96);
            }
        
            #insert-board-btn a{
                text-decoration: none;
                color : white;
            }
        </style>

</head>
<body>

    <jsp:include page="../common/header-min.jsp" />
    <jsp:include page="../common/sideBar.jsp" />
	
    <script>
	        $('#insert-board-btn').on('click', function(){
	        }location.href  = "${pageContext.request.getContextPath}/insertForm.bo";
	        });
	   
            // <!-- n개씩 보기 기능 -->
      
        
                $(document).ready(function(){

           
                    // display 미선택시에 보일 레이아웃???
                    $('#content-items').removeClass();
                    $('#content-items').addClass('four');

                    $('#search-count-toggle').on('click', function(){
                        $('#search-count-list').slideToggle('slow');

                    });
                   
        
                    // 해당 선택자에 one라는 클래스가 없을 때 one를 추가하고, 있다면 삭제(원상복귀 ==  4페이지)
                    $('#search-count-one').on('click', function(){

                        
                         $('#content-items').removeClass();
                         $('#content-items').addClass('one');
                        
                    });

                    $('#search-count-four').on('click', function(){


                        $('#content-items').removeClass();
                        $('#content-items').addClass('four');

                    });
                    $('#search-count-nine').on('click', function(){

              

                        $('#content-items').removeClass();
                        $('#content-items').addClass('nine');

                    });
                    

                    

                });

    </script>
	<div id="wrapper">
		
        <section id="search-area">

            <article id="search-header">

                

                    <div id="search-bar">
                            <input type="text" id="search-text" placeholder="검색어 입력를 입력하세요.">
                            <button type="submit" id="search-btn">🔍</button>        
                    </div>

                    <div id="search-radio">
                        <input type="radio" name="search-radio" checked>제목
                        <input type="radio" name="search-radio">작성자
                    </div>

                   
            </article>

            <article id="search-count">
                <div id="search-count-toggle">
                    <button class="btn btn-sm btn-info">게시글 보기 갯수</button>
                </div>

                 <!-- 1_1. a태그를 이용해서 boardLimit을 변경해 화면을 변경하는 방법 -->
                 <ul id="search-count-list">

                    <li id="search-count-one">
                        <p id="displayOne"></p>
                            <a class="display" href="<%= contextPath %>/main.bo?display=1">
                                1개씩 보기
                            </a>
                        
                    </li>
                    <li id="search-count-four">
                        <p id="displayFour"></p>
                            <a class="display" href="<%= contextPath %>/main.bo?display=4">
                                4개씩 보기
                            </a>
                        
                    </li>
                    <li id="search-count-nine">
                        <p id="displayNine"></p>
                            <a class="display" href="<%= contextPath %>/main.bo?display=9">
                                9개씩 보기
                            </a>
                        
                    </li>
                </ul> 
                
                <script>
                   
                     $(document).ready(function(event){

                    // 먼저 콘텐츠영역의 모든 class속성들을 제거
                    $('#content-items').removeClass();


                    $('#displayOne').on('click', function(){  $('#content-items').addClass('one');  });
                    $('#displayOne').trigger('click');


                    $('#displayFour').on('click', function(){  $('#content-items').addClass('one');  });
                    $('#displayFour').trigger('click');// 총 3번 클릭되어 마지막 속성이 덮어씌움

                    // 해당 버튼 클릭시 콘텐츠영역에 전체레이아웃속성을 변경하는 one class가 추가됨
                    $('#displayNine').on('click', function(){  $('#content-items').addClass('one');  });
                    // a태그의 href이동후 해당 버튼의 click이벤트 강제 실행
                    $('#displayNine').trigger('click');
                  
                    }); 

                 </script>
               

                <!-- 1_2. form&input태그를 이용해서 boardLimit을 변경해 화면을 변경하는 방법
                    a태그와 달리 페이지 이동을 하지 않기 때문에 클릭 이벤트 후에도 상태가 유지됨 -->
     
                <!-- boardLimit과 레이아웃만 담당 -->
                 <!-- <form action="<%= contextPath %>/main.bo" method="post" id="displayForm" name="displayForm">
                   
                    <div id="search-count-one">
                        <label for="one"><input type="hidden" id="one" name="display" value="1">1개씩 보기</label>
                    </div>
                    <div id="search-count-four">
                        <label for="four"><input type="hidden" id="four" name="display" value="4">4개씩 보기</label>
                    </div>
                    <div id="search-count-nine">
                        <label for="nine"><input type="hidden" id="nine" name="display" value="9">9개씩 보기</label>
                    </div>
                 
                </form> -->
                
                <script>
                    // function displaySubmit(){
                    //    document.forms["displayForm"].submit();
                    // }
            
               </script> 


      
                <!-- 1_3. Ajax -->
                <!-- <button onclick="display(event)" class="display" id="one" value="1" type="button">1개씩 보기</button>
                <button onclick="display(event)" class="display" id="four" value="4" type="button">4개씩 보기</button>
                <button onclick="display(event)" class="display" id="nine" value="9" type="button">9개씩 보기</button> -->

            </article>
           
           <script>
  
    // 전역에서 쓸 변수선언
            let displayCount;

            function display(e){

                $.ajax({
                    url : 'display.bo',
                    type : 'post',
                    async : false,
                    data : {
                        // $(this)말고 $(e.target) 쓴 이유
                        display :  $(e.target).val(),
                        //boardLimit : $(e.target).val(),
                    },
                    success : function(dpCount) {
                        alert(dpCount);
                        displayCount = dpCount;
                        // 앞서 선언한 전역변수에 값 담기
                        
                        //alert(displayCount + '/' + boardLimit);

                        if(displayCount != null){
                            $('#content-items').removeClass();
                            switch(displayCount){
                                case "1" : $('#content-items').addClass('one'); break;
                                case "9" :  $('#content-items').addClass('nine'); break;
                                default :  $('#content-items').addClass('four');
                            }

                        } else{
                            // display 미선택시에 보일 레이아웃???
                            
                            $('#content-items').addClass('four');
                        }
                       
                    }
             
                })
                // display함수의 리턴값
                return displayCount;
            };

            function page(e){
            
            $.ajax({
                url : 'page.bo',
                type : 'post',
                async : false,
                data : {
                    cpage : $(e.target).val(),
                },
                success : function(page) {
                    location.href = "<%= contextPath %>/main.bo?cpage=" + page + "&display=" + displayCount;

                    
                }
                
            })

            }

</script>
           
			<article>
				<c:if test="${ !empty sessionScope.userInfo }">
              	 	<div id="insert-board-btn" class="btn btn-sm btn-info"><a href="<%= contextPath %>/insertForm.bo">글쓰기</a></div>
           		</c:if>
            </article>
       
        </form>
        </section>

        <section id="content-area">

            <article id="content-items" >

 
                
		<c:choose>
			<c:when test="${ empty bList }">
	                <div class="content-item">
	                    조회된 게시글이 없습니다.
	                </div>
			</c:when>
            <c:otherwise>   
		

                    <c:forEach var="board" items="${ bList }">
	                    <div class="content-item">
	                   
	                        <a href="<%= contextPath %>/detail.bo?bno=${ board.boardNo }">
	                         	<img src="<%= contextPath %>/${ board.fileImg }" alt="">
	                        </a>
	                        <p>${ board.boardTitle }</p>
	                        <span>${ board.boardViews }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
	                        <span>${ board.boardCreateDate }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
	                        <span>${ board.userNo }</span>
	                    </div>
					</c:forEach>
					
             </c:otherwise>
          </c:choose>  
            </article>
<!-- content -->

        </section>


            <div id="pasing-area">
            
            <!-- 현재페이지가 1이 아닌이상 <가 있어야함 / 버튼 클릭시엔 cpage - 1 로 이동-->
           
            <c:if test="${ requestScope.pageInfo.currentPage ne 1 }" >
        		<button onclick="location.href='<%= contextPath %>/main.bo?cpage=${ requestScope.pageInfo.currentPage - 1 }'" class="btn btn-sm btn-info">&lt;</button>
            </c:if>

            <!-- 시작페이지와 끝페이지가 같다는 건 boardLimit보다 작거나 같은 수의 게시글이 있어 총 페이지 수가 1이란 뜻 -->
            
            <c:if test="${ requestScope.pageInfo.startPage >= requestScope.pageInfo.endPage }">
                <button class="btn btn-sm btn-info" >1</button>
            </c:if>

            <!-- 숫자 페이징바 영역 -->
       		<c:forEach var="i" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }">
	            
	            	<c:choose>
	            		<c:when test="${ requestScope.pageInfo.currentPage ne i }">
	            			<button onclick="location.href='<%= contextPath %>/main.bo?cpage=${ i }&display=${ requestScope.pageInfo.dpCount }'" class="btn btn-sm btn-info">${ i }</button>
	            	 	</c:when>
		            	 <c:otherwise>
		            		<button disabled class="btn btn-sm btn-danger">${ i }</button>
		            	</c:otherwise>
	            	</c:choose>

 			</c:forEach>
          
            <!-- ***현재페이지가 최대페이지가 아니면 endPage오른쪽에 >이 표시되어야 하고 클릭시엔 현재페이지에서 +1이 더한 페이지가 나와야함 -->
            
            <c:if test="${ requestScope.pageInfo.currentPage ne requestScope.pageInfo.maxPage }">
            	<button onclick="location.href='<%= contextPath %>/main.bo?cpage=${ requestScope.pageInfo.currentPage + 1 }&display=${ requestScope.pageInfo.dpCount }'" class="btn btn-sm btn-info">&gt;</button>
            </c:if>
         
            </div>
       


        </div>

<%@ include file="../common/footer.jsp" %>



</body>
</html>