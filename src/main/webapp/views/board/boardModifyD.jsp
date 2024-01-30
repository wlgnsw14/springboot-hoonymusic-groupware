<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"> </script>
<style>

		#common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 50%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 50%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}

		#board_title {
		    width: 50%;
		    padding: 10px;
		    box-sizing: border-box;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    margin-top: 5px;
		    font-family: 'Arial', sans-serif; 
		}
		
		#board_title:focus {
		    border-color: #4CAF50;
		    outline: none;
		}
		
		.list_form textarea {
		    width: 50%;
		    height: 150px;
		    padding: 10px;
		    box-sizing: border-box;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    margin-top: 5px;
		    font-family: 'Arial', sans-serif; 
		}
		
		.list_form input[type="file"] {
		    margin-top: 5px;
		}
		
		.list_form input[type="button"],
		.list_form button {
		    padding: 5px 10px;
		    cursor: pointer;
		    margin-right: 5px;
		    border-radius: 3px;background-color:#025464;color:white;padding: 5 10;border:none;
		}

</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
	<section id="common_list_form">
    <h2 class="big_title">공지사항</h2>
    <!-- <h3 class="sub_title">리스트 폼</h3> -->
    <div class="allpadding" style="padding-left: 50px;">
	    <div class="list_form">
	        <form id="sendModifyD" action="modifyD" method="post" enctype="multipart/form-data" onsubmit="return val()">
	    		<input type="hidden" name="board_no" value="${board.board_no}" />
		    <ul>
		        <li>
		            <h5><label for="board_title">제목</label></h5>
		            <input type="text" id="board_title" name="board_title" value="${board.board_title}" />
		        </li>
		        <li>
		            <h5><label for="board_content">내용</label></h5>
		            <textarea id="board_content" name="board_content">${board.board_content}</textarea>
		            <!-- 
		            <div id="rich_deditor"></div>
					
					<input type="hidden" name="board_content" value="${board.board_content}"/>
					 -->
		        </li>
		        <li>
		            <h5><label for="photos">사진</label></h5>
		            <input type="file" id="photos" name="photos" />
		        </li>
		        <br/>
		        <li>
		            <input type="button" onclisck="location.href='/boardD'" value="이전" />
		            <button type="button" onclick="confirmModify()">수정</button>
		        </li>
		    </ul>
			</form>
		</div>
	</div>
	</section>

</body>
<script>

	var config = {}
	config.toolbar = "basic"; // 이 부분이 주석 되면 모든 기능이 다 나타난다.
	config.editorResizeMode = "none"; // 에디터 크기 조절 안됨
	var editor = new RichTextEditor("#board_content", config);

	function val(){
	var board_title = $('#board_title').val();
	var board_content=$('#board_content').val();
	if (board_title === "" || board_content === "") {
	    alert("입력하지 않은 값이 있습니다.");
	    return false;
		}
		return true;
	}
	
	function confirmModify() {
	    var userConfirmed = confirm("수정하시겠습니까?");
	    if (userConfirmed) {
	    	document.getElementById('sendModifyD').submit();
	    
	    }
	    
	}
</script>
</html>