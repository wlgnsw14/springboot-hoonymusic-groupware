<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 풀캘린더 라이브러리 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<!-- 날짜 및 시간 처리 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>


<title>HoonyMusic</title>
</head>
<style>
 
		li button, input[type="button"] {
		    padding: 5px 10px;
		    cursor: pointer;
		    margin-right: 5px;
		    border-radius: 3px;background-color:#025464;color:white;padding: 5 10;border:none;
		}
		

.div_inner{
	padding-left: 15%;
	padding-top: 100px; 	
	box-sizing: border-box;
	height: 750px;
	}
.float{
	float:left;
	margin-left:2%;
}
.mainBox{
	height:100%;
}
.float:first-child{margin-left:0;}
.mainLeft{	
	box-sizing: border-box;
	width: 26%;
    height: 100%;
}	
.rightfloat{
	box-sizing: border-box;
	width: 70%;
    height: 100%;
}

.mainCenter{	
	box-sizing: border-box;
	width: 100%;
    height: 50%;
     border-radius: 10px;
	border: 1px solid #025464;
	padding-bottom:1%;
}	
.mainRight{	
	padding-top:30px;
	box-sizing: border-box;
	width: 100%;
    height: 50%;
    overflow:auto;
     border-radius: 10px;
	border: 1px solid #025464;
}	

.mainPageAttend{
	box-sizing: border-box;
	height: 183px;
	margin-bottom:16px;
}
.mainSchedule{
	height:450px;
	box-sizing: border-box;

	 border-radius: 10px;
	border: 1px solid #025464;
}
.mainBoard{
	box-sizing: border-box;
	height: 100%;
	width:100%;
	overflow-x:hidden;
}
.mainMusci{
	box-sizing: border-box;
	height: 100%
}

  #calendar {
    width: 100%;
    height: 100%;
  }
  
  .fc-header-toolbar, .fc-header-toolbar * {
    font-size: 10px; /* 원하는 크기로 조절 */
}
.mainMusic{
	overflow:auto;
}

</style>
<body>
<%@ include file="/views/nav.jsp" %>

<div class="div_inner">
	<div class="mainBox">
			<div class="mainLeft float">
				<div class="mainPageAttend" id="mainAttendContainer"></div>
				<div class="mainSchedule" id="mainCalContainer" onclick="scheduleGo()">
					<div id='calendar-container'>
						<div id="calendar"></div>
					</div>
				</div>
			</div>
		<div class="rightfloat float">	
			<div class="mainCenter">
				<div class="mainBoard" id="mainBoardList"></div>
			</div>
			<div class="mainRight">
				<div class="mainMusic" id="mList"></div>
			</div>
		</div>	
	</div>
</div>
</body>
<script>
$(document).ready(function () {
    // 출퇴근 박스
    $('#mainAttendContainer').load('attend.html');
 });
 
 //달력
	var titleData;
	var startData;
	var endData;
	var contentData;
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale : "ko",
			initialView : 'dayGridMonth'
			
		});

		calendar.render();
		fetchEvents();

		
		// db 에서 값을 SELECT해오는거 
		function fetchEvents() {
			var state = 0;
			$.ajax({
				type : 'get',
				url : 'schedule/list',
				data : {
					'sch_state' : state
				},
				dataType : 'json',
				success : function(data) {
					eventList = data.eventList;
					// eventList의 각 이벤트 객체에서 sch_no 값을 뽑아내기

					console.log(data.eventList);
					//풀캘린더 자체내에서 제공하는 일종의 함수? 이벤트추가할수있는거 
					calendar.removeAllEvents();
					calendar.addEventSource(eventList);
				},
				error : function(xhr, status, error) {
					console.error('에러 발생:', status, error);
				}
			});
		}

	});


	  $(document).ready(function() {
		    $('#mList').load('mainMusicChart.html', function() {
		        // 음원차트 로드 완료 후 실행할 작업
		        $('#mainBoardList').load('mainBoard.html', function() {
		            // 두 번째 로드 완료 후 추가 작업
		            // 이곳에 필요한 코드를 추가하세요
		        });
		    });
		});
	  
function scheduleGo(){
	window.location='/schedule';
}

</script>
</html>