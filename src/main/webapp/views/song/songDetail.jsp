<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>
        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative; }
        #common_list_form .list_form .first_list{width: 50%; float: left;}
        #common_list_form .list_form .first_list:last-child li{width: 100%;}
        #common_list_form .list_form .first_list li{float: left; width: 50%; border-bottom: 1px solid #333; box-sizing: border-box;}
        #common_list_form .list_form .first_list:first-child li:nth-child(2n-1){font-weight: 500; text-align: center;}

        #cancel_modal{display: none; width:300px; height:150px; background: rgb(237, 237, 237); border:1px solid gray; text-align:center; position:absolute; left:50%; bottom: 50%;}
		
		.modalBtnNo, .modalBtnYes{height: 35px; width: 80px; color: white; border: none; border-radius: 10px; background-color: gray;}
    </style>
<body>
    <%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">음원</h2>
        <h3 class="sub_title">상세보기</h3>
        <input type="button" value="계약 취소" onclick="openCancelModal()"/>
        <input type="button" value="목록" onclick="location.href='/song'"/>
        <form action="songFile.do" method="post" enctype="multipart/form-data">
        	<input type="file" id="file" name="files" multiple/>
        	<input type="hidden" name="song_no" value="${songDetail.song_no}"/>
        </form>
        <div class="list_form">
            <ul class="first_list">
                <li>음원명</li>
                <li>${songDetail.song_name}</li>
                <li>가수명</li>
                <li>${songDetail.art_name}</li>
                <li>계약 시작일</li>
                <li>${songDetail.song_startDate}</li>
                <li>계약 만료일</li>
                <li>${songDetail.song_endDate}</li>
                <li>계약일</li>
                <li>${songDetail.song_contract}</li>
                <li>저작권자</li>
				<li>${songDetail.song_owner}</li>
                <li>담당자</li>
                <li>${songDetail.name} ${songDetail.member_position}</li>
				<li>전체 스트리밍 수</li>
				<li>${songDetail.song_streaming}</li>
                <li>수익 분배율</li>
                <li>${songDetail.song_revenue}</li>
                <li>첨부 파일</li>
                <li>
					<c:forEach items="${list}" var="file">
						<a href="download.do?newName=${file.file_newname}&oriName=${file.file_oriname}" class="download">
							${file.file_newname}
						</a>
					</c:forEach>
                </li>
            </ul>
        </div>
       	
		<!------ 계약 취소 모달 ------>
		<div id="cancel_modal">
			<div style="margin:30px 0; font-size:22px;">계약을 취소 하시겠습니까?</div>
			<button id="cancelNo" class="modalBtnNo">아니요</button>
			<button id="cancelYes" class="modalBtnYes">예</button>	
		</div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
</body>
<script>
//-------------------------------- 모달 창 start ------------------------------------------
function openCancelModal(){
	var modal = document.getElementById('cancel_modal');
	var yesBtn = document.getElementById('cancelYes');
	var noBtn = document.getElementById('cancelNo');
	modal.style.display = 'block';
	
	noBtn.onclick = function() {
        modal.style.display = "none";
    }
	
	yesBtn.onclick = function(){
		location.href = "./결재 페이지";
	}
}
//-------------------------------- 모달 창 end ------------------------------------------
</script>
</html>