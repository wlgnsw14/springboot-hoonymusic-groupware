<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative; display: flex;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_title ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
        
        /* list form 스타일 */
        #common_list_form .list_form .first_list{width: 50%; float: left;padding:30;}
        #common_list_form .list_form .first_list:last-child li{width: 100%;}
        #common_list_form .list_form .first_list li{float: left; width: 50%; /* border-bottom: 1px solid #333;  */box-sizing: border-box;margin-bottom: 6px;}
        #common_list_form .list_form .first_list:first-child li:nth-child(2n-1){font-size: 14;font-weight: 600; text-align: center;}

		#common_list_form .list_form .second_list{padding-left: 60;border-left: 1px solid lightgrey;}
		input[type="button"],#downbtn{border-radius: 3px;background-color:025464;color:white;padding: 5 10;border:none;}
		#option{padding:5px; margin:15px;}
		
        #add_modal, #cancel_modal{display: none; width:300px; height:150px; background: rgb(237, 237, 237); border:1px solid gray; text-align:center;
			position:absolute; left:50%; bottom: 60%;}
		
		.modalBtnNo, .modalBtnYes{height: 30px;width: 70px;color: white;border: none;border-radius: 10px;background-color: gray;}
    	.fileName {white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}
    	
    	.btnBox{margin-left:50px;}
    	form{display:none;}
    	.txt{font-size: 15;font-weight: 600;}
    </style>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">음반</h2>
        <h3 class="sub_title">상세보기</h3>
        <div class="btnBox">
       		<input type="button" value="계약 취소" onclick="openCancelModal()"/>
        	<input type="button" value="목록" onclick="location.href='/album'"/>
        </div>
        <form action="albumFile.do" method="post" enctype="multipart/form-data">
        	<input type="file" id="file" name="files" multiple/>
        	<input type="hidden" name="alb_no" value="${albumDetail.alb_no}"/>
        	<input type="submit" value="등록">
        </form>
        <div class="list_form">
            <ul class="first_list">
                <li>음반명</li>
                <li>${albumDetail.alb_name}</li>
                <li>아티스트명</li>
                <li>${albumDetail.art_name}</li>
                <li>계약 시작일</li>
                <li>${albumDetail.alb_startdate}</li>
                <li>계약 만료일</li>
                <li>${albumDetail.alb_expiredate}</li>
                <li>계약일</li>
                <li>${albumDetail.alb_contract}</li>
                <li>제작 단가(KRW)</li>
                <li id="albpro_price"></li> <!-- 숫자 천 단위 구분 표시를 위해 js 에서 처리 -->
                <li>판매 가격(KRW)</li>
                <li id="alb_price"></li>
                <li>담당자</li>
                <li>${albumDetail.member_id}</li>
                <li>수익 분배율</li>
                <li>${albumDetail.alb_revenue}</li>
                <li>첨부 파일</li>
                <li>
					<c:forEach items="${list}" var="file">
						<p class="fileName">
							${file.file_oriname}
							<%-- <img src="/photo/${file.file_newname}" width="300" height="300"/> --%>
						</p>
						<button id="downbtn" onclick="location.href='download.do?newName=${file.file_newname}&oriName=${file.file_oriname}'">download</button>
					</c:forEach>
                </li>
            </ul>
            <ul class="second_list">
                <li>
                	<span class="txt">생산 회차별 판매량과 재고량</span>
                	<select id="option"></select>
                	<input type="button" value="추가 생산" onclick="openAddModal()"/>
                </li>
                <li>
                	<div><canvas id="doughnut" style="width: 300px; height:300px;"></canvas></div>
                </li>
            </ul>
        </div>
       	
       	<!------ 추가 생산 모달 ------>
		<div id="add_modal">
			<div style="margin:30px 0; font-size:22px;height:30%;">추가 생산을 하시겠습니까? 결재 페이지로 이동합니다.</div>
			<button id="addNo" class="modalBtnNo">아니요</button>
			<button id="addYes" class="modalBtnYes">예</button>	
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
//-------------------------------- 숫자 천 단위 구분 표시 start ------------------------------------------
var albpro = ${albumDetail.albpro_price};
var alb = ${albumDetail.alb_price};
document.getElementById('albpro_price').textContent = albpro.toLocaleString();
document.getElementById('alb_price').textContent = alb.toLocaleString();
//-------------------------------- 숫자 천 단위 구분 표시 end ------------------------------------------


// 옵션별 데이터로 차트 초기화를 위한 전역 변수 myChart 선언
var myChart;
//-------------------------------- select 필터링 start ------------------------------------------
var selectElement = document.getElementById('option');
var initialRound = ${albumDetail.albpro_round}; // 생산 회차는 최대값으로 설정 (mapper 에서 처리)

// option 값을 initialRound에서 하나씩 빼면서 1회차까지만 나타내기
for (var i = initialRound; i > 0; i--) {
	var option = document.createElement('option');
	option.value = i;
	option.textContent = i + '회차';
	selectElement.appendChild(option);
}

// option 변경시 변경된 option 값으로 차트 데이터를 가져오는 getChartData 함수 실행
selectElement.addEventListener('change', function () {
	 var optionVal = this.value;
	 console.log('Selected Value:', optionVal);
	 getChartData(optionVal);
});
//-------------------------------- select 필터링 end ------------------------------------------


//-------------------------------- 그래프 start ------------------------------------------
document.addEventListener("DOMContentLoaded", function () {
    getChartData();
});

function getChartData(option){
	var num = ${albumDetail.alb_no};
	console.log('option :', option); // option value 찍히는지 확인
	// ajax 로 데이터 가져오기
	$.ajax({
		type:'get',
		url:'albumChartData',
		data:{"num":num, "optionVal":option},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawChart(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawChart(data){
	// 새로운 데이터로 차트를 갱신하기 위해 기존 차트 파괴
    if (myChart) {
        myChart.destroy();
    }
	
	data.list.forEach(function(item,idx){
		console.log(item.albsold_amount);
		console.log(item.albsold_stock);
		const hasAmount = item.albsold_amount !== 0;
		const hasStock = item.albsold_stock !== 0;
		
	    const chartData = {
	            labels: ['판매량', '재고량'],
	            datasets: [{
	                data: [hasAmount ? item.albsold_amount : 0, hasStock ? item.albsold_stock : 0],
	                backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)'],
	            }],
	        };
		
		const config = {
				  type: 'doughnut',
				  data: chartData,
				  options: {
					    responsive: false,
					    maintainAspectRatio: false, // 가로 세로 비율 유지하지 않음
					    width: 300, 
					    height: 300, 
						}
		};
		
		// 전역으로 선언된 myChart 변수 갱신 (위에 선언된 const myChart;)
		myChart = new Chart(document.getElementById('doughnut'), config);
	});
}
//-------------------------------- 그래프 end ------------------------------------------


//-------------------------------- 모달 창 start ------------------------------------------
function openAddModal(){
	var modal = document.getElementById('add_modal');
	var yesBtn = document.getElementById('addYes');
	var noBtn = document.getElementById('addNo');
	modal.style.display = 'block';
	
	noBtn.onclick = function() {
        modal.style.display = "none";
    }
	
	yesBtn.onclick = function(){
		location.href = "/draftDoc"; 
	}
}

function openCancelModal(){
	var modal = document.getElementById('cancel_modal');
	var yesBtn = document.getElementById('cancelYes');
	var noBtn = document.getElementById('cancelNo');
	modal.style.display = 'block';
	
	noBtn.onclick = function() {
        modal.style.display = "none";
    }
	
	yesBtn.onclick = function(){
		location.href = "/draftDoc";
	}
}
//-------------------------------- 모달 창 end ------------------------------------------
</script>
</html>