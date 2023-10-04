<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #wrapper{
        width: 1100px;
        height: 800px;
        margin: auto;
        margin-top : 10px;
        border : 1px solid black;
        box-sizing: border-box;
    }

    #title-area{
        
        text-align: center;
        font-size: 20px;
        box-sizing: border-box;
    }
    #content-area{
        margin : 50px;
        width : 90%;
        height : 80%;
        border : 1px solid black;
        box-sizing: border-box;
        
    }

</style>

<style>
    #calendar{
      
        font-size : 50px;
        border:  1px solid black;
    }
    
    #calendar tr th{
        padding : 10px;
        border:  1px solid black;
        text-align : right;
    }

    .event-date{
        font-size : 15px;
    }
</style>


</head>
<body>
    <%@ include file="../common/header-min.jsp" %>

    <%@ include file="../common/sideBar.jsp" %>

    <div id="wrapper">
    
        <div id="title-area">펫토피아 이달의 행사</div>

        <div id="content-area">

            <table id="calendar">
                <legend><b>October</b></legend>
                <thead>
                    <tr>
                        <th>Sun</th>
                        <th>Mon</th>
                        <th>Tue</th>
                        <th>Wed</th>
                        <th>Thu</th>
                        <th>Fri</th>
                        <th>Sat</th>
                    </tr>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th>1</th>
                        <th>2</th>
                    </tr>
                    <tr>
                        <th>3</th>
                        <th>4</th>
                        <th>5</th>
                        <th class="event-date"><a href="#">국제토끼의날</a></th>
                        <th>7</th>
                        <th>8</th>
                        <th>9</th>
                    </tr>
                    <tr>
                        <th>10</th>
                        <th>11</th>
                        <th>12</th>
                        <th>13</th>
                        <th>14</th>
                        <th>15</th>
                        <th>16</th>
                    </tr>
                    <tr>
                        <th>17</th>
                        <th>18</th>
                        <th>19</th>
                        <th>20</th>
                        <th>21</th>
                        <th>22</th>
                        <th>23</th>
                    </tr>
                    <tr>
                        <th>24</th>
                        <th>25</th>
                        <th>26</th>
                        <th>27</th>
                        <th>29</th>
                        <th>30</th>
                        <th>31</th>
                    </tr>
                </thead>

            </table>
           
        </div>
    
        
    
      
        
    </div>




    <%@ include file="../common/footer.jsp" %>
</body>
</html>