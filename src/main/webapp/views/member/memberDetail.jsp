<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>직원정보</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>


    #memberDetail{margin-left: 15%; height: 100px;}
    #memberDetail .detailInner{position: relative; width: 800px; height:300px; padding:100px 0 0 15%;}
    #memberDetail .detailInner .detailBox{position: relative;}
    #memberDetail .detailInner .detailBox li{float: left;  width:70%; height: 30px;  border-radius: 10px; border: 1px solid #025464; box-sizing: border-box; text-align: center;}
    #memberDetail .detailInner .detailBox li:nth-child(2n){width: 30%;}
    #memberDetail .detailInner .detailBox li:first-child{width: 100%; height: 220px;}
    #memberDetail .detailInner .detailBox li:last-child{width: 100%; height: 50px; padding:5px;}
    
    img{
    margin-left: 250px;
    margin-top:10px;
    border:1px solid #025464;
    }
    
    .button-orange {
    background-color: #025464;/* 주황색 */
    color: #fff; /* 흰색 텍스트 */
    padding: 10px 20px; /* 적절한 패딩 값 */
    border: none;
    border-radius: 4px; /* 둥근 모서리를 위한 값 */
    cursor: pointer;
}

.button-orange:hover {
    background-color: #025464;/* 버튼에 호버될 때 변경될 색상 */
}


</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
<section id="memberDetail">
	<div class="detailInner">
		<ul class="detailBox">
			<li class="memberImg">
			<div class="imgBox">			
    			<img src="/photo/${file}" width="140" height="200"/>				
			</div>
			</li>
			<c:forEach items="${dto}" var="detail">
			<li>ID</li>
			<li>${detail.member_id}</li>
			<li>PW</li>
			<li>***********</li>
			<li>이름</li>
			<li>${detail.name}</li>
			<li>성별</li>
			<li>${detail.gender}</li>
			<li>생년월일</li>
			<li>${detail.birth}</li>
			<li>연락처</li>
			<li>${detail.phone}</li>
			<li>Email</li>
			<li>${detail.email}</li>
			<li>주소</li>
			<li>${detail.address}</li>
			<li>상세주소</li>
			<li>${detail.address_detail}</li>
			<li>입사일</li>
			<li>${detail.hired}</li>
			<li>직급</li>
			<li>${detail.member_position}</li>
			<li>부서</li>
			<li>${depart_name}</li>
			<li>팀</li>
			<li>${team_name}</li>
			<li>연/월차수</li>
			<li>${detail.total_leave}</li>		
			<li>
			<button class="button-orange" onclick="memberUpdate(${detail.member_no})">수정</button>
			<button class="button-orange" onclick="location.href='memberList'">확인</button>
			</li>
			</c:forEach>
		</ul>
	</div>
</section>
    
 
</body>
<script>
function memberUpdate(member_no){
	var confirmMessage = "직원정보를 수정하시겠습니까?";
	if (confirm(confirmMessage)) {
		window.location.href = '/update?member_no=' + member_no;
        document.getElementById('delDptForm').submit();
    } else {
        console.log("수정 취소됨");
    }

}
</script>
</html>