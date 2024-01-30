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
        #common_list_form .sub_title{padding: 20px 50px; text-align:center;}
        #common_list_form .list_form{position:relative;display:flex; align-item:center; justify-content:center;}
        
        #common_list_form .list_form .notiOuterBox{justify-content: center;align-items: center;width:60%;height:100%;}
        #common_list_form .list_form .notiBox{display:flex; justify-content: space-between;width:100%; height: 100%;border: 1px solid grey;margin-bottom: 10px;}        
        #common_list_form .list_form .notiBox ul{padding: 10px;}
        #common_list_form .list_form .notiBox .notiContent{margin-right: 20px;}
        #common_list_form .list_form .notiBox .notiDate{text-align: right;}
                
        #delBtn{margin: 0 3% 1% 73%;width: 45;height: 30;border-radius: 3px;background-color:025464;color:white;padding: 5 10;border:none;}        

        .blink{
		  -webkit-animation: blink 0.7s ease-in-out infinite alternate;
		  -moz-animation: blink 0.7s ease-in-out infinite alternate;
		  animation: blink 0.7s ease-in-out infinite alternate;
		}
		
		@-webkit-keyframes blink{
		  0% {opacity: 0.2;}
		  100% {opacity: 1;}
		}
		
		@-moz-keyframes blink{
		  0% {opacity: 0.2;}
		  100% {opacity: 1;}
		}
		
		@keyframes blink{
		  0% {opacity: 0.2;}
		  100% {opacity: 1;}
		  to {
                background-color: yellow;
            }
		}
		
		#del_modal{background: rgba(0, 0, 0, 0.8);display: none; width:300px; height:150px; background: rgb(237, 237, 237); border:1px solid gray; text-align:center;position:absolute; left:58%; top:27%; }
		
</style>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">NOTIFICATION</h2>
        <h3 class="sub_title">🔔 알림 🔔</h3>
        <input type="button" id="delBtn" value="삭제" onclick="delBtnClick()"/>
		<input type="checkbox" id="checkAll"/>
		<!------- 리스트 ------->
        <div class="list_form">
        	<div class="notiOuterBox" id="notiList">

			</div>
        </div>
        <!-- 삭제 모달 -->
		<div id="del_modal">
			<div style="margin:30px 0; font-size:24px;">삭제 하시겠습니까?</div>
			<button onclick="delNo()" class="modalBtnNo">아니요</button>
			<button onclick="delYes()" class="modalBtnYes">예</button>	
		</div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
</body>
<script>
//-------------------------------- list start ------------------------------------------
listCall();
var notiCount = 0;

function listCall(){	
	var member_no = ${sessionScope.loginMember.member_no};
	//console.log(member_no);
	
	$.ajax({
		type:'get',
		url:'notiList',
		data:{'member_no':member_no}, 
		dataType:'JSON',
		success: function(data){
			//console.log(data);
			drawList(data);	
			// 읽음 표시 - noti_state 에 따른 css 변경 
 			data.list.forEach(function(item,idx){
				//console.log(item.noti_state);
				if(item.noti_state==0){
					$('#blinking'+item.noti_no).addClass('blink');
					//console.log($('#blinking'+item.noti_no));
				}
			}); 
  			// 새로운 알림 개수
 			notiCount = data.noti_count || 0;
			//console.log(notiCount);
            $('#notiCnt').text(notiCount);  
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	console.log(list);
	var content='';
	if(list.size==0){
		content+='<div style="text-align:center;font-size:20;">알림이 없습니다.</div>';
	}
	list.list.forEach(function(item,idx){ 
		content+='<div style="display:flex;">';
		content+='<div class="notiBox" id="blinking'+item.noti_no+'" onclick="boxClick('+item.noti_no+','+item.noti_state+',\'' + item.noti_locate + '\')">';
		content+='<ul class="notiContent">';
		if(item.noti_locate=='p'){
			content+='<li>[회의실/공연장]</li>'; // artist 테이블
		}else{
			content+='<li>[일정]</li>'; 
		}
		if(item.noti_content==1){
			content+='<li>새로운 예약 신청이 있습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==2) {
			content+='<li>예약 신청이 반려되었습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==3) {
			content+='<li>예약 신청이 승인되었습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==4) {
			content+='<li>예약 취소 신청이 있습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==5) {
			content+='<li>새로운 전사 일정이 있습니다. 확인해주세요.</li>'; 
		}else if(item.noti_content==6) {
			content+='<li>새로운 부서 일정이 있습니다. 확인해주세요.</li>'; 
		}
		content+='</ul>';
		content+='<ul class="notiDate">';
		var date = new Date(item.noti_date);
		var notiDate = date.toLocaleString("ko-KR");
		content+='<li>'+notiDate+'</li>';
		content+='<li>'+item.name+' '+item.member_position+'</li>';
		content+='</ul>';
		content+='</div>';
		content+='<div>';
		content+='<span style="margin-left:10px;"><input type="checkbox" name="checkEach" value="'+item.noti_no+'"></span>';
		content+='</div>';
		content+='</div>';
	});
	$('#notiList').empty();
	$('#notiList').append(content);
}
//-------------------------------- list end ------------------------------------------

//----------------------- delete start ---------------------------------------
// 모든 리스트 체크 
$('#checkAll').on('click',function(){
	var $chk = $('input[name="checkEach"]');
	//console.log($chk);
	console.log($(this).is(":checked")); // true/false
	if($(this).is(":checked")){
		$chk.prop("checked",true);
	}else{
		$chk.prop("checked",false);
	}
}); 

// 삭제 모달
function delBtnClick(){
	// 체크 박스 선택됐으면 모달창 열기
	$('input[name="checkEach"]:checked').each(function(idx,item){
		console.log('체크됨!');
		document.getElementById('del_modal').style.display = 'block';
	});
}

// 모달 아니요 버튼 
function delNo(){
	document.getElementById('del_modal').style.display = 'none';
}

function delYes(){
	// 작성자가 본인인 파일만 삭제할 수 있어야 한다
	// 체크박스 배열
	var chkArr = []; 
	$('input[name="checkEach"]:checked').each(function(idx,item){
		//console.log(idx, $(item).val()); 
		var val = $(item).val();
		if(val != 'on'){
			chkArr.push(val);
		}		
	});
	$.ajax({
		type:'get',
		url:'notiDel',
		data:{'delList' : chkArr},
		dataType:'JSON',
		success:function(data){
			//console.log(data);
			if(data.del_cnt>0){
				alert('요청하신 '+data.del_cnt+'개의 게시물이 삭제 되었습니다.');
				listCall();
				document.getElementById('del_modal').style.display = 'none';
				$('input[name="checkEach"]').prop('checked', false);
				$('#checkAll').prop('checked', false);
			}else{
				console.log(data.msg);
				alert(data.msg);
				listCall();
				document.getElementById('del_modal').style.display = 'none';
			}
		},
		error:function(e){
			console.log(e)
		}
	}); 
}

//----------------------- delete end ---------------------------------------


//-------------------------------- click event start ------------------------------------------
function boxClick(num, state, locate){
	// ajax 통신으로 가져온 noti_unique_no 의 noti_state 를 1로 변경하기
	console.log(num, state, locate);
	$.ajax({
		type:'get',
		url:'notiStateUpdate',
		data:{'noti_no':num, 'locate':locate}, 
		dataType:'JSON',
		success: function(data){
		},
		error:function(e){
			console.log(e);
		}
	});
	console.log($('#blinking'+num));
	// 읽음 표시 - noti_state 에 따른 css 변경 
	$('#blinking'+num).removeClass('blink');
	// 알림 아이콘에 표시 
	notiCount = notiCount - 1;
	listCall();
	if(locate==='s'){
		location.href='/schedule';
	}else{
		location.href='/reserve';
	}
}
//-------------------------------- click event end ------------------------------------------
</script>
</html>