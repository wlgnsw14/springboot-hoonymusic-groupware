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
        
		li button, input[type="button"] {
		    padding: 5px 10px;
		    cursor: pointer;
		    margin-right: 5px;
		    border-radius: 3px;background-color:#025464;color:white;padding: 5 10;border:none;
		}
		
		.buttonlist {
		    text-align: center;
		}
		
		.buttonlist li {
		    display: inline-block;
		    margin-left: 10px; 
		}
		
		.underline {
		    border-bottom: 1px solid #ccc;
		    padding-top: 10px;
		    padding-bottom: 10px;
		}
		
		.underline div {
		    margin-bottom: 10px;
		}
		
		.list-item-label {
	    	font-size: 15px;
	    	font-weight: bold;
		}
		
</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
	<section id="common_list_form">
        <h2 class="big_title">공지사항</h2>
        <h3 class="sub_title">부서 게시판</h3>
        <div class="allpadding" style="padding-left: 50px;">
			<ul>
			    <li class="underline">
			        <div class="list-item-label"><label for="board_title">제목</label></div>
			        <div id="board_title">${board.board_title}</div>
			    </li>
			    <li class="underline">
			        <div class="list-item-label"><label for="bHit">조회수</label></div>
			        <div id="bHit">${board.bHit}</div>
			    </li>
			    <li class="underline">
			        <div class="list-item-label"><label for="board_depart">작성자</label></div>
			        <div id="board_depart">${board.board_depart}</div>
			    </li>
			    <li class="underline">
			        <div class="list-item-label"><label for="board_content">내용</label></div>
			        <div id="board_content">${board.board_content}</div>
			    </li>
			
			    <c:if test="${photos.size() > 0}">
			        <li class="underline">
			            <div class="list-item-label"><label for="board_photos">사진</label></div>
			            <div id="board_photos">
			                <c:forEach items="${photos}" var="file">
			                    <img src="/photo/${file.file_newname}" width="500" alt="${file.file_oriname}" />
			                </c:forEach>
			            </div>
			        </li>
			    </c:if>
			    <br/>
			    <div class="buttonlist">
			        <li>
			            <input type="button" onclick="location.href='/board'" value="리스트" />
			            <input type="button" onclick="confirmDelete()" value="삭제" />
			            <input type="button" onclick="confirmModify()" value="수정" />
			        </li>
			    </div>
			</ul>
		</div>
		</section>
</body>
<script>

	function confirmDelete() {
	    var userConfirmed = confirm("삭제하시겠습니까?");
	    if (userConfirmed) {
	        // 사용자가 '예'를 선택한 경우
	        location.href = './del?board_no=${board.board_no}';
	    }
	}
	
	function confirmModify() {
	    var userConfirmed = confirm("수정하시겠습니까?");
	    if (userConfirmed) {
	        // 사용자가 '예'를 선택한 경우
	        location.href = './boardModify?board_no=${board.board_no}';
	    }
	}
</script>
</html>