<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/memberList.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>
	#common_list_form{
		position: relative;
	}
	
	.depart_name{
		position: absolute;
		top: 120px;
		right: 50px;
	}
</style>
<body>
<%@ include file="/views/nav.jsp" %>
<section id="common_list_form">
		<h2 class="big_title">직원관리</h2>
		<span id="incumbentStateLabel" onclick="selectMemberState('재직')">재직자</span>
		<span id="quitterStateLabel" onclick="selectMemberState('퇴사')">퇴사자</span>
		<select id="depart_name" class="depart_name" name="depart_no">
			<option value="2">운영본부</option>
			<option value="1">마케팅본부</option>
			<option value="3">경영지원본부</option>
			<option selected value="4">임직원</option>
		</select>
		<div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
                    	<li>번호</li>
                        <li>이름</li>
                        <li>팀</li>
                        <li>직급</li>
                        <li>연락처</li>
                        <li>Email</li>
                    </ul>
                </li>
                <li class="list_content" id="memberList">
                </li>
            </ul>
        </div>
    </section>
</body>
<script>

var selectedMemberState = '재직';
memberListCall()
console.log('상태:'+selectedMemberState);

// 페이지 로딩 시 초기값에 해당하는 라벨에 스타일 적용
document.getElementById('incumbentStateLabel').style.fontWeight = 'bold';
document.getElementById('quitterStateLabel').style.fontWeight = 'normal';

function selectMemberState(memberState) {    
		selectedMemberState = memberState;  
		console.log(selectedMemberState);
		// 선택된 라벨의 스타일 변경
        document.getElementById('incumbentStateLabel').style.fontWeight = (memberState === '재직') ? 'bold' : 'normal';
        document.getElementById('quitterStateLabel').style.fontWeight = (memberState === '퇴사') ? 'bold' : 'normal';
        memberListCall();
    }
    
//상태 필터링
$('#depart_name').change(function(){
	console.log($(this).val());
	memberListCall();
});

function memberListCall(){	
	$.ajax({
		type:'get',
		url:'memberListCall',
		data:{
			'depart_no':$('#depart_name').val(),
			'member_state':selectedMemberState
			}, 
		dataType:'JSON',
		success: function(data){
			console.log("초기 리스트"+data)
			drawMemberList(data);	
		},
		error:function(e){
			console.log(e)
		}
	});
}

function drawMemberList(memberList){
	console.log(memberList);

	var content='';
	memberList.list.forEach(function(item, idx){ 
		content+='<ul onclick="memberDetail('+item.member_no+')">';
		content+='<li>'+item.member_no+'</li>';
		content+='<li>'+item.name+'</li>';
		content+='<li>'+item.depart_name+'</li>';
		content+='<li>'+item.member_position+'</li>';
		content+='<li>'+item.phone+'</li>';
		content+='<li>'+item.email+'</li>';
		content+='</ul>';
	});
	$('#memberList').empty();
	$('#memberList').append(content);
	}
	
function memberDetail(member_no){
	window.location.href = '/detail?member_no=' + member_no;
}
</script>
</html>