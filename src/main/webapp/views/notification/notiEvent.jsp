<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
</style>
</head>
<body>    
    <h1>SSE Example</h1>
    <form onsubmit="submitForm(); return false;">
        Member ID: <input type="text" id="member_id" required>
        <input type="submit" value="Submit" id="btn">
    </form>
    <div id="eventOutput"></div>
    <!-- TODO: 페이지 내용 추가 -->
</body>
<script type="text/javascript">
//-------------------------------- noti subscribe start  ------------------------------------------

        // 서버와 SSE 연결
        var eventSource = new EventSource("http://localhost/notiPage");

        // 서버로부터 이벤트를 수신하면 실행되는 콜백 함수
        eventSource.onmessage = function (event) {
            var eventData = event.data;
            console.log('Received event: ' + eventData);
            // 받은 이벤트를 화면에 출력하는 예시
            document.getElementById('eventOutput').innerHTML = 'Received event: ' + eventData;
        };

        // SSE 연결이 종료되면 실행되는 콜백 함수
        eventSource.onerror = function () {
            console.error('SSE connection error');
        };

        
     	// 버튼 클릭 시 form을 submit하는 함수
        function submitForm() {
            var member_id = document.getElementById('member_id').value;
            // form을 submit하고 member_id를 /noti 요청으로 전달
            fetch('/submitForm', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ member_id: member_id }),
            })
            .then(response => response.json())
            .then(data => {
                console.log('Submit successful:', data);
            })
            .catch((error) => {
                console.error('Error during form submission:', error);
            });
        }
//-------------------------------- noti subscribe end ------------------------------------------
</script>
</html>