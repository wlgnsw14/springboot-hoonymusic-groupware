<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>
.list_title ul {width: 100%;height: 45px;}
.list_title ul li {
	float: left;
	border-top: 1px solid #999;
	border-bottom: 1px solid #222;
	padding: 5px 0 5px 10px;
	box-sizing: border-box;
}

.list_title ul li:first-child {
	width: 20%;
	padding-left: 50px;
}

.list_title ul li:nth-child(2) {
	width: 20%;
}

.list_title ul li:nth-child(3) {
	width: 20%;
}

.list_title ul li:nth-child(4) {
	width: 20%;
}

.list_title ul li:last-child {
	width: 20%;
}

.list_content ul {
	width: 100%;
	height: 45px;
}

.list_content ul li {
	float: left;
	padding: 5px 0 5px 10px;
	box-sizing: border-box;
}

.list_content ul li:first-child {
	width: 20%;
	padding-left: 50px;
}

.list_content ul li:nth-child(2) {
	width: 20%;
}

.list_content ul li:nth-child(3) {
	width: 20%;
}

.list_content ul li:nth-child(4) {
	width: 20%;
}

.list_content ul li:last-child {
	width: 20%;
}

 .useList_title ul {width: 100%;height: 45px;}
.useList_title ul li {
	float: left;
	border-top: 1px solid #999;
	border-bottom: 1px solid #222;
	padding: 5px 0 5px 10px;
	box-sizing: border-box;
}

.useList_title>ul>li:first-child {
	width: 25%;
	padding-left: 50px;
}

.useList_title>ul>li:nth-child(2) {
	width: 25%;
}

.useList_title>ul>li:nth-child(3) {
	width: 25%;
}

.useList_title>ul>li:last-child {
	width: 25%;
}

.useList_content ul {
	width: 100%;
	height: 45px;
}

.useList_content ul li {
	float: left;
	padding: 5px 0 5px 10px;
	box-sizing: border-box;
}

.useList_content ul li:first-child {
	width: 25%;
	padding-left: 50px;
}

.useList_content ul li:nth-child(2) {
	width: 25%;
}

.useList_content ul li:nth-child(3) {
	width: 25%;
}


.useList_content ul li:last-child {
	width: 25%;
} 
.div_inner {
	padding-left: 15%;
	padding-top: 100px;
	box-sizing: border-box;
	height: 550px;
}

.float {
	float: left;
	margin-left: 2%;
}

.float:first-child {
	margin-left: 0;
}

.mainLeft {
	box-sizing: border-box;
	width: 96%;
	height: 100%;
}

.mainAttend {
	box-sizing: border-box;
	height: 100px;
	 border-radius: 10px;
	border: 1px solid #025464;
    font-family: 'Helvetica', Arial, sans-serif;
	margin-bottom: 16px;
		margin-left:2%;
	margin-right: 2%; 
}

.useList {
	box-sizing: border-box;
	height: 234.5px;
	 border-radius: 10px;
	border: 1px solid #025464;
    font-family: 'Helvetica', Arial, sans-serif;
		margin-left:2%;
	margin-right: 2%; 
	overflow:auto;
}

.filterLi{
	text-align: right; 
	margin-left:73%;
	margin-right: 2%;
	width: 150px;
}
.innerFilter li{
	float: left;
}
.filterBox{
box-sizing: border-box;
	height: 30px;
	margin-left: 2%;
	
}

</style>
<body>
<%@ include file="/views/nav.jsp" %>
	<div class="div_inner">
		<div class="mainBox">
			<div class="mainLeft float">
				<div class="mainAttend">
					<ul>
						<li class="list_title">
							<ul>
								<li>발생 연차</li>
								<li>발생 월차</li>
								<li>총 연차</li>
								<li>사용 연차</li>
								<li>잔여 연차</li>
							</ul>
						</li>
						<li class="list_content" id="calLeaveList"></li>
					</ul>					
				</div>
				<div class="filterBox">
					<ul class="innerFilter">
						<li>사용 내역</li>
						<li class="filterLi">사용기간&nbsp;&nbsp;<select id="filterYear" class="filterYear"
							onchange="filterChange()" name="filterYear">
						</select></li>
					</ul>
				</div>
				<div class="useList">
					<ul>
						<li class="useList_title">
							<ul>
								<li>휴가 종류</li>
								<li>시작일</li>
								<li>종료일</li>
								<li>사용 연차</li>							
							</ul>
						</li>
						<li class="useList_content" id="useList"></li>
					</ul>					
				</div>
			</div>
		</div>
	</div>
</body>
<script>

$(document).ready(function() {
	calLeave();
});
function calLeave(){
	
	$.ajax({
		type:'get',
		url:'calLeave',
		data:{}, 
		dataType:'JSON',
		success: function(data){
			console.log('연차 데이터 반환');
			$('#calLeaveList').empty();
			
			$('#calLeaveList').append('<ul>'
					+'<li>'+data.leaveY+'</li>'
					+'<li>'+data.leaveM+'</li>'
					+'<li>'+data.leaveA+'</li>'
					+'<li>2.5</li>'
					+'<li>17.5</li>'
					+'</ul>');
		
		}
		,error:function(e){
			console.log(e);
			console.log('왜안댐');
			}	
		});
}

//현재 년도 가져오기
var currentYear = new Date().getFullYear();

// 10년 전부터 현재 년도까지 옵션 생성
for (var year = currentYear - 10; year <= currentYear; year++) {
    var option = document.createElement("option");
    option.value = year;
    option.text = year;
    document.getElementById("filterYear").appendChild(option);
}
//기본값으로 현재 년도 선택
document.getElementById("filterYear").value = currentYear;



$(document).ready(function() {
	var selectFilter = document.getElementById("filterYear").value;
	console.log('선택된 기간 : '+selectFilter);
	useList(selectFilter);
});

function filterChange(){
	var selectFilter = document.getElementById("filterYear").value;
	useList(selectFilter);
}

function useList(selectFilter){
	
	$.ajax({
		type:'get',
		url:'useList',
		data:{'selectFilter':selectFilter}, 
		dataType:'JSON',
		success: function(data){
			console.log('연차사용 데이터 반환'+data);
			var content='';
			data.list.forEach(function(item, idx){ 
				var startString = item.off_start;
				var endString = item.off_end;
				var startObject = new Date(startString);
				var endObject = new Date(endString);
				var formattedStart = startObject.toLocaleString('en-US', {
				    year: 'numeric',
				    month: '2-digit',
				    day: '2-digit',
				    hour: '2-digit',
				    minute: '2-digit',
				    second: '2-digit',
				    timeZone: 'Asia/Seoul'
				});
				var formattedEnd = endObject.toLocaleString('en-US', {
				    year: 'numeric',
				    month: '2-digit',
				    day: '2-digit',
				    hour: '2-digit',
				    minute: '2-digit',
				    second: '2-digit',
				    timeZone: 'Asia/Seoul'
				});
				
				content+='<ul>';
				content+='<li>'+item.off_type+'</li>';
				content+='<li>'+formattedStart+'</li>';
				content+='<li>'+formattedEnd+'</li>';
				content+='<li>'+item.use_date+'</li>';
				content+='</ul>';
			});
			$('#useList').empty();
			$('#useList').append(content);
			
			
		
		}
		,error:function(e){
			console.log(e);
			console.log('왜안댐');
			}	
		});
}
</script>
</html>