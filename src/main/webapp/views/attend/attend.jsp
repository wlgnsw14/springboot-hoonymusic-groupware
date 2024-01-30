<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>HoonyMusic</title>
</head>
<style>
.list_title ul {
	width: 100%;
	height: 45px;
}

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

#clock {
	height: 20%;
	text-align: center;
	margin: 0;
	font-size: 22px;
	font-weight: 500;
	margin-bottom:10px;
}

#date {
	font-size: 18px;
	font-family: 'Arial', sans-serif;
	text-align: center;
	margin-top: 10px;
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
	width: 26%;
	height: 50%;
}

.mainCenter {
	box-sizing: border-box;
	width: 70%;
	height: 50%;
}

.mainbottom {
	padding-top: 200px;
	box-sizing: border-box;
	width: 98%;
	height: 50%;
}

.mainAttend {
	box-sizing: border-box;
	height: 183px;
	margin-bottom: 16px;
    border-radius: 10px;
	border: 1px solid #025464;
    font-family: 'Helvetica', Arial, sans-serif;
}

.mainBoard {
	box-sizing: border-box;
	height: 183px;
	position: relative;
    border-radius: 10px;
	border: 1px solid #025464;
    font-family: 'Helvetica', Arial, sans-serif;
}

.attendList {
	box-sizing: border-box;
	height: 350px;
    border-radius: 10px;
	border: 1px solid #025464;
    font-family: 'Helvetica', Arial, sans-serif;
    overflow: auto;
   
}


.attendBox {
	height: 40%;
}

.attendBox>div {
	float: left;
	width: 45.25%;
	padding: 3% 2% 3% 2%;
	margin-left:20px;
}

.mainBoard .absol {
	position: absolute;
	width: 10%;
	top: 5%;
	tansform: translate(-50%, -50%);
}

.mainBoard .absol_left {
	left: 0;
	width: 20%;
	height: 80px;
    font-size: 40px;
    cursor: pointer;
}

.mainBoard .absol_right {
	right: 0;
	width: 20%;
	height: 80px;
    font-size: 40px;
    cursor: pointer;
}

.attendBtn {
	width: 100px;
	height: 30px;
    color: #fff;
	background-color:  #025464;
	border-radius: 10px;
	cursor: pointer;
	margin-bottom: 5px;
	text-align: center;
	line-height: 30px;
}

.topBox, .bottomBox {
	width: 100%;
	height: 90px;
	padding-top: 0.5px;
	padding-bottom: 0.5px;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.bottomBox>div {
	width: 100%;
	height: 85px;
}

.monthYearBoard {
	margin-left: 125px;
	width: 60%;
	height: 95%;
    font-size: 35px;
    padding-top: 20px;
}

.togle {
	cursor: pointer;
	list-style: none;
}



</style>
<body>
<%@ include file="/views/nav.jsp" %>
<div class="div_inner">
	<div class="mainBox">
			<div class="mainLeft float">
				<div class="mainAttend">
					<div class="attendBox">
						<div class="leftBox">
							<ul>
								<li><p>근태관리</p></li>
								<li> <div id="date"></div></li>
							</ul>
						</div>
						<div class="rightBox">
							<ul>
								<li class="attendBtn" onclick="attTime('in')">출근</li>
								<li class="attendBtn" onclick="attTime('out')">퇴근</li>
							</ul>
						</div>
					</div>
					<div id="clock"></div>
					<div class="attendBox">
						<div class="leftBox">
							<ul>
								<li>출근 시간</li>
								<li>퇴근 시간</li>
							</ul>
						</div>
						<div class="rightBox">
							<ul>
								<li id="inTime">미등록</li>
								<li id="outTime">미등록</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="mainCenter float">
				<div class="mainBoard">
				<div class="topBox">
					<div id="prevMonth" class="absol absol_left" onclick="changeMonth(-1)">&lt;</div>
					<div id="monthYearBoard" class="monthYearBoard"></div>
					<div id="nextMonth" class="absol absol_right" onclick="changeMonth(1)">&gt;</div>
				</div>
				<div class="bottomBox">
						<div>
							<ul>
								<li class="list_title">
									<ul>
										<li>이번주 누적</li>
										<li>이번주 초과</li>
										<li>이번주 잔여</li>
										<li>이번달 누적</li>
										<li>이번달 연장</li>
									</ul>
								</li>
								<li class="list_content" id="timeList">
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="mainbottom">
				<div class="attendList">
					<ul class="attendListItem" id="attendList">
						<li class="list_title">
							<ul>
								<li class="togle" data-week="1">1주차</li>
								<li class="togle" data-week="2">2주차</li>
								<li class="togle" data-week="3">3주차</li>
								<li class="togle" data-week="4">4주차</li>
								<li class="togle" data-week="5">5주차</li>
							</ul>
						</li>
					</ul>
					<ul>
						<li class="list_title">
							<ul>
								<li>일자</li>
								<li>업무 시작</li>
								<li>업무 종료</li>
								<li>총 근무시간</li>
								<li>상세</li>
							</ul>
						</li>
						<li class="list_content hidee" id="attendListContent"></li>
					</ul>
				</div>
			</div>
	</div>
</div>
</body>
<script>
// 출퇴근 시간 출력
$(document).ready(function() {
    notiTime();
});

$(document).ready(function() {
    timeTable();
});

var selectToggle=1;

function notiTime(){
	console.log('그만하자');
	$.ajax({
		type:'get',
		url:'notiTime',
		data:{}, 
		dataType:'JSON',
		success: function(data){
			var inTime = data.att_intime;
	        var outTime = data.att_outtime;
			console.log('출근 : '+inTime);	
			console.log('퇴근 : '+outTime);	
			
			if(inTime != null){
				$('#inTime').text(inTime);
			}
			
			if(outTime != null){
				$('#outTime').text(outTime);
			}			

		}
		,error:function(e){
			console.log(e);
			console.log('왜안댐');
			}	
		});
}

function timeTable(){
	
	$.ajax({
		type:'get',
		url:'timeTable',
		data:{}, 
		dataType:'JSON',
		success: function(data){
			console.log('타임테이블 데이터 반환');
			$('#timeList').empty();
			
			$('#timeList').append('<ul>'
					+'<li>'+data.total_week_hour+'h'+data.total_week_minute+'m'+data.total_week_second+'s'+'</li>'
					+'<li>'+data.week_over_hour+'h'+data.week_over_minute+'m'+data.week_over_second+'s'+'</li>'
					+'<li>'+data.week_left_hour+'h'+data.week_left_minute+'m'+data.week_left_second+'s'+'</li>'
					+'<li>'+data.total_month_hour+'h'+data.total_month_minute+'m'+data.total_month_second+'s'+'</li>'
					+'<li>'+data.overTime_hour+'h'+data.overTime_minute+'m'+data.overTime_second+'s'+'</li>'
					+'</ul>');
		
		}
		,error:function(e){
			console.log(e);
			console.log('왜안댐');
			}	
		});
}

// 현재 일시 출력
var currentMonth = new Date().getMonth();
var currentYear = new Date().getFullYear();


function updateClock() {
    var now = new Date();
    var hours = now.getHours().toString().padStart(2, '0');
    var minutes = now.getMinutes().toString().padStart(2, '0');
    var seconds = now.getSeconds().toString().padStart(2, '0');

    var timeString = hours + ':' + minutes + ':' + seconds;
    document.getElementById('clock').innerHTML = timeString;
    
    var year = now.getFullYear();
    var month = (now.getMonth() + 1).toString().padStart(2, '0');
    var day = now.getDate().toString().padStart(2, '0');

    var dateString = year + '/' + month + '/' + day;
    document.getElementById('date').innerHTML = dateString;
}

function updateMonthYear() {
    var monthYearString = currentYear + '년 ' + (currentMonth + 1) + '월';
    document.getElementById('monthYearBoard').innerHTML = monthYearString;   
    selectDate(selectToggle);
}


function selectDate(selectToggle){
	
	$.ajax({
		type: 'POST',
        url: 'selectDate',
        data: { 'year': currentYear, 'month': currentMonth + 1 },
        success: function(data) {
            console.log('조회한 달 :', data);
        	console.log(selectToggle+'week');
            var selWeek=selectToggle+'week';
            $('#attendListContent').empty();
            var content = '';
            if (Array.isArray(data[selWeek])) {
            
            data[selWeek].forEach(function(item, idx){         
            	 var offCheckLabel = (item.off_check === 'N') ? '근무' : '휴가';
            	 var attOutTimeLabel = (item.att_intime === null) ? '' : item.att_outtime;
            	 var workHoursLabel = (item.work_hours === null) ? '' : item.work_hours;
            	 
            	content+='<ul onclick="attendDetail('+item.attend_no+')">';
        		content+='<li>'+item.att_date+'</li>';
        		content+='<li>'+item.att_intime+'</li>';
        		content+='<li>'+attOutTimeLabel+'</li>';
        		content+='<li>'+workHoursLabel+'</li>';
        		content+='<li>'+offCheckLabel+'</li>';
        		content+='</ul>';         	                        
           	 });
            }
          
        	$('#attendListContent').append(content);
        },
        error: function(error) {
            console.error('Error:', error);
        }
	});
}


function changeMonth(diff) {
    currentMonth += diff;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    } else if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    updateMonthYear();
 // 월별 리스트
}
// 매 초마다 시계 업데이트
setInterval(updateClock, 1000);
// 페이지 로딩 시에도 시계 업데이트
updateClock();
updateMonthYear();

// 출퇴근 버튼
function attTime(type){
	var inTimeElement = document.getElementById('inTime');
	var outTimeElement = document.getElementById('outTime');
	console.log(inTimeElement);
	console.log(outTimeElement);
	if (type === 'in' && inTimeElement.innerText.trim() == '미등록') {
		attendTime(type);
        console.log('함수 실행'+inTimeElement.innerText.trim());
    }else if (type === 'out' && outTimeElement.innerText.trim() == '미등록'){
    	attendTime(type);
    }else{
    	alert('하루에 한번만 가능합니다.');
    }
}
	
function attendTime(type){
	
	var currentDate = document.getElementById('date').textContent;
	 var currentTime = document.getElementById('clock').textContent;
	console.log("현재 일시 :"+currentDate+" "+currentTime);
	
	$.ajax({
		type:'post',
		url:'attTime',
		data:{
			'attTime':currentTime,
			'attDate':currentDate,
			'type':type
			}, 
		dataType:'JSON',
		success: function(data){
			notiTime();
			}
		,error:function(e){
			console.log(e);
			
			}
		
		});
		
	
}
// 리스트 토글
$('.togle').on('click',function(){	
    selectToggle=$(this).data('week');
	console.log('토글클릭'+selectToggle);
	selectDate(selectToggle);

});

</script>
</html>