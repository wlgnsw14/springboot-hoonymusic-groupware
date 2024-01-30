<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset='utf-8' />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<!-- 풀캘린더 라이브러리 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<!-- 날짜 및 시간 처리 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<!-- 아래 3줄 modal 관련 -->
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<style>
#calendar-container {
	width: 1300px;
	padding-left: 20%;
	padding-top: 100px;
	box-sizing: border-box;
}
</style>
<script>
	var titleData;
	var startData;
	var endData;
	var contentData;
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale : "ko",
			initialView : 'dayGridMonth',
			height : 500,
			customButtons : {
				myCustomButton : {
					text : "일정 추가하기",
					click : function() {
						// 부트스트랩 모달 열기
						$("#exampleModal").modal("show");
					}
				}
			},

			headerToolbar : {
				left : 'prev,next today, myCustomButton',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek'
			},

			eventClick : function(info) {
				// info는 클릭한 이벤트의 정보를 포함하는 객체입니다.
				var eventNo = info.event.extendedProps.sch_no;
				var eventTitle = info.event.title;
				var eventStart = info.event.start;
				var eventEnd = info.event.end;
				var eventContent = info.event.extendedProps.content;

				openModal(eventNo);
				// 콘솔에 이벤트 정보 출력
				console.log('클릭한 이벤트 정보:');
				console.log('클릭한 이벤트 번호:', eventNo);
				console.log('제목:', eventTitle);
				console.log('시작 시간:', eventStart);
				console.log('종료 시간:', eventEnd);
				console.log('내용:', eventContent);
			}

		});

		// '취소' 버튼 클릭 시 모달 닫기
		$('#exampleModal .btn-secondary').on('click', function() {
			$("#exampleModal").modal("hide");
		});

		// 'X' 클릭 시 모달 닫기
		$('#closeModalBtn').on('click', function() {
			$("#exampleModal").modal("hide");
		});

		// '추가' 버튼 클릭 시 처리할 부분 
		$('#addChanges').on(
				'click',
				function() {

					var eventData = {
						title : $("#title").val(),
						start : $("#start").val(),
						end : $("#end").val(),
						content : $("#content").val()
					};
					//calendar.addEvent(eventData);
					titleData = $("#title").val();
					startData = $("#start").val();
					endData = $("#end").val();
					contentData = $('#content').val();

					// 빈 값 입력 시 오류
					if (eventData.title == "" || eventData.start == ""
							|| eventData.end == "" || eventData.content == "") {
						alert("입력하지 않은 값이 있습니다.");
					} else if ($("#start").val() > $("#end").val()) {
						alert("시간을 잘못 입력 하셨습니다.");
					} else {
						// 이벤트 추가
						calendar.addEvent(eventData);

						// 서버로 데이터 전송
						$.ajax({
							type : "GET",
							url : "save",
							contentType : "application/json",
							data : /* $("#addData").serialize() */
							{
								'title' : $("#title").val(),
								'content' : $("#content").val(),
								'start' : $("#start").val(),
								'end' : $("#end").val(),
								'sch_state' : $('#depart_select').val()
							},
							dataType : 'JSON',
							success : function(response) {
								console.log(response); // 서버에서의 응답 확인
							},
							error : function(error) {
								console.error('Error while saving events:',
										error);
							}
						});

						// 모달 닫기
						$("#exampleModal").modal("hide");

						// 입력 필드 초기화
						$("#title").val("");
						$("#start").val("");
						$("#end").val("");
						$("#content").val("");
					}
				});

		calendar.render();
		fetchEvents();

		//상태 필터링  
		$('#depart_select').change(function() {
			console.log($(this).val());
			fetchEvents();
		});

		// db 에서 값을 SELECT해오는거 
		function fetchEvents() {

			$.ajax({
				type : 'get',
				url : 'schedule/list',
				data : {
					'sch_state' : $('#depart_select').val()
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

	function openModal(sch_no) {
		$('#myModal').modal('show');
		$.ajax({
			type : 'get',
			url : 'detailSchedule',
			data : {
				'sch_no' : sch_no
			},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				$('#eventTitle').empty();
				$('#eventContent').empty();
				$('#eventStart').empty();
				$('#eventEnd').empty();
				data.dto.forEach(function(dtoItem) {
					$('#eventTitle').append(dtoItem.title);
					$('#eventContent').append(dtoItem.content);
					var start = new Date(dtoItem.start);
	                var formattedStart = formatDate(start);
	                $('#eventStart').append(formattedStart);

	                var end = new Date(dtoItem.end);
	                var formattedEnd = formatDate(end);
	                $('#eventEnd').append(formattedEnd);
	                
	                
					/* $('#eventStart').append(dtoItem.start);
					$('#eventEnd').append(dtoItem.end); */
					$('#eventSchNo').val(dtoItem.sch_no);
				});
			},
			error : function(e) {
				console.log(e)
			}
		});
	}
	
	// 날짜 형식 지정 함수
	function formatDate(date) {
	    var year = date.getFullYear();
	    var month = ('0' + (date.getMonth() + 1)).slice(-2);
	    var day = ('0' + date.getDate()).slice(-2);
	    var hours = ('0' + date.getHours()).slice(-2);
	    var minutes = ('0' + date.getMinutes()).slice(-2);
	    var seconds = ('0' + date.getSeconds()).slice(-2);

	    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
	}
</script>


<body style="padding: 30px;">
	<%@ include file="/views/nav.jsp"%>
	<!-- calendar 태그 -->
	<div id='calendar-container'>
		<div class="calFilter">
			<select id="depart_select" class="depart_select" name="sch_state">
				<option value="0" selected>내 일정</option>
				<option value="2">전사 일정</option>
				<option value="3">부서 일정</option>
			</select>
		</div>
		<div id='calendar'></div>
	</div>
	<!-- 부트스트랩 modal 부분 -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 추가하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="closeModalBtn">X</button>
				</div>

				<div class="modal-body">
					일정이름 : <input type="text" id="title" name="title" /><br /> 일정내용 :
					<input type="text" id="content" name="content" /><br /> 시작시간 : <input
						type="datetime-local" id="start" name="start" /><br /> 종료시간 : <input
						type="datetime-local" id="end" name="end" />
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="addChanges">
						추가</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달 창 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">이벤트 상세 정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 제목 -->
					<div class="form-group">
						<label for="eventTitle">제목:</label> <span id="eventTitle"></span>
					</div>

					<!-- 내용 -->
					<div class="form-group">
						<label for="eventContent">내용:</label> <span id="eventContent"></span>
					</div>

					<!-- 시작일 -->
					<div class="form-group">
						<label for="eventStart">시작일:</label> <span id="eventStart"></span>
					</div>

					<!-- 종료일 -->
					<div class="form-group">
						<label for="eventEnd">종료일:</label> <span id="eventEnd"></span>
					</div>
				</div>
				<div class="modal-footer">
					<!-- 삭제 버튼 -->
					<form action="delSch">
						<input type="hidden" id="eventSchNo" name="sch_no" />
						<button type="submit" class="btn btn-danger" id="deleteEvent">삭제</button>
					</form>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>