<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>
<link rel="stylesheet" href="resources/css/memberList.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


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

.left_box{width: 250px; float: left; height: 400px;}
.left_box .org_chart{width:100%; height: 100%; border: 1px solid #ccc; padding: 10px; overflow: auto;}
.left_box ul li{font-size: 16px;}
.left_box ul li span, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p{cursor: pointer; border: 1px solid rgba(0,0,0,0); display: inline-block;}
.left_box ul li span.on, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p.on{font-weight: 700; border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
.left_box ul li span.hover, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p.hover{border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
.left_box ul>li>ul{padding-top:3px;}
.left_box ul>li>ul>li{padding-left:15px;}
.plus{display: none;}	


</style>
<body>
<%@ include file="/views/nav.jsp" %>
<section id="common_list_form">
		<h2 class="big_title">부서관리</h2>
		<span id="incumbentStateLabel" onclick="selectDepartmentState('existence')">existence</span>
		<span id="quitterStateLabel" onclick="selectDepartmentState('dissolution')">dissolution</span>
		<button onclick="createModal()">등록</button>
		<div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
                   	    <li>번호</li>
                    	<li>부서명</li>
                        <li>책임자</li>
                        <li>인원</li>
                        <li>생성일</li>
                    </ul>
                </li>
                <li class="list_content" id="departmentList">
                </li>
            </ul>
        </div>
    </section>
    
        <!-- 모달 창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">부서 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
              <form id="updateDptForm" action="updateDpt" method="post">
            <div class="modal-body">
                <div class="form-group">
                    <label for="depart_name">부서명:</label>
                    <span id="depart_name" data-name="depart_name"></span>
                </div>
				        
                <div class="form-group">
                    <label for="dpt_oner">책임자:</label>
                    <button id="addOner" type="button" style="display: none;" onclick="onerModal()">
  					  <i class="fas fa-plus"></i> <!-- Font Awesome 플러스 아이콘 -->
				</button>                   
                    <span id="dpt_oner" data-name="dpt_oner"></span>
                 	<input type="hidden" name="oner_no" />
                </div>
              

          
                <div class="form-group">
                    <label for="total_member">인원:</label>
                    <span id="total_member"></span>
                </div>

          
                <div class="form-group">
                    <label for="depart_date">생성일:</label>
                    <span id="depart_date"></span>
                </div>
                
                 <div class="form-group">
                    <label for="depart_teamN">하위팀</label>
                   <button id="openModalBtn" type="button" onclick="createModal()">
  					  <i class="fas fa-plus"></i> <!-- Font Awesome 플러스 아이콘 -->
				</button>
                    <span id="depart_teamN"></span>
                <input type="hidden" id="depart_no" name="depart_no"/>
                </div>
            </div>          
            </form>
            <div class="modal-footer">
            <form id="delDptForm" action="delDpt" method="post">
            	<input type="hidden" id="del_no" name="depart_no"/>
           	    <button type="button" class="btn btn-danger" id="delDpt">삭제</button>                               	
            </form>
                <button type="button" class="btn btn-danger" id="updateDpt">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- 부서생성 모달 -->
 
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">부서/팀 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>   
          
            
            <form action="createDpt" method="post">      
            <div class="modal-body">
                <div class="form-group">
                    <label for="depart_name">부서명:</label>
                    <input type="text" name="depart_name" />                  
                </div>
           
                <div class="form-group">
                    <label for="dpt_oner">책임자:</label>
                      <button  type="button" onclick="onerModal()">
  					  <i class="fas fa-plus"></i> <!-- Font Awesome 플러스 아이콘 -->
					</button>           
                    <input type="text" name="dpt_oner" />
                    <input type="hidden" name="oner_no" />
                    <input type="hidden" id="depart_p_no" name="depart_p_no"/>
                </div>              
            </div>          
            <div class="modal-footer">                               	
                <button type="submit" class="btn btn-danger" id="createDpt">등록</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
			</form>  		
  			 
        </div>
    </div>
</div>


</body>

<!-- 팀 디테일 모달 -->
<div class="modal fade" id="teamModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">팀 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
             <form id="updateTeamForm" action="updateTeam" method="post">
            <div class="modal-body">
                <div class="form-group">
                    <label for="depart_name">팀 명:</label>
                    <span id="team_name" data-name="team_name"></span>
                </div>
           
                <div class="form-group">
                    <label for="dpt_oner">책임자:</label>
                     <button id="addTeamOner" type="button" style="display: none;" onclick="onerModal()">
  					  <i class="fas fa-plus"></i> <!-- Font Awesome 플러스 아이콘 -->
				</button>     
                    <span id="team_oner" data-name="team_oner"></span>
                </div>

          
                <div class="form-group">
                    <label for="total_member">인원:</label>
                    <span id="team_member"></span>
                </div>

          
                <div class="form-group">
                    <label for="depart_date">생성일:</label>
                    <span id="team_depart_date"></span>
                </div> 
            </div>          
			<input type="hidden" id="team_no" name="team_no"/>
			<input type="hidden" id="team_oner_no" name="team_oner_no"/>
            <div class="modal-footer">                               	
                <button type="button" class="btn btn-danger" id="updateTeam">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- 조직도 팝업 모달 -->

<div class="modal fade" id="orgChartModal" tabindex="-1" role="dialog" aria-labelledby="orgChartModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document" style="margin-left: 300px; width: 300px; height: 500px;">
        <div class="modal-content" >
            <div class="modal-header">
                <h5 class="modal-title" id="orgChartModalLabel">조직도</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
					<div class="left_box">
					<div class="left_box">
						
						<div class="org_chart">
							<ul>
								<c:forEach items="${departments}" var="depart">
									<c:if test="${depart.depart_p_no eq 0}">
										<li><span> <svg class="plus" width="12"
													height="12" viewBox="0 0 448 512"
													xmlns="http://www.w3.org/2000/svg">
													<path fill="currentColor"
														d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6" /></svg>
												<svg class="minus" width="12" height="12"
													viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg">
													<path fill="currentColor"
														d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6" /></svg>
												${depart.depart_name}
										</span>
											<ul>
												<c:forEach items="${teams}" var="team">
													<c:if test="${depart.depart_no eq team.depart_p_no}">
														<li><span> <svg class="plus" width="12"
																	height="12" viewBox="0 0 448 512"
																	xmlns="http://www.w3.org/2000/svg">
																	<path fill="currentColor"
																		d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6" /></svg>
																<svg class="minus" width="12" height="12"
																	viewBox="0 0 448 512"
																	xmlns="http://www.w3.org/2000/svg">
																	<path fill="currentColor"
																		d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6" /></svg>
																${team.depart_name}
														</span>
															<ul>
																<c:forEach items="${members}" var="member">
																	<c:if test="${team.depart_no eq member.depart_no}">
																		<li>
																			<p data-member-no="${member.member_no}" data-name="${member.name}">
																				<svg width="14" height="14" viewBox="0 0 1408 1472"
																					xmlns="http://www.w3.org/2000/svg">
						                                                        <path
																						fill="#df7ca2"
																						d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128" />
						                                                        </svg>
																				${member.name} ${member.member_position}
																			</p>
																		</li>
																	</c:if>
																</c:forEach>
															</ul></li>
													</c:if>
												</c:forEach>
											</ul></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				
			</div>
			<div class="modal-footer" style="margin-top: 450px;">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
            
        </div>
    </div>
</div>



<script>
//삭제
document.getElementById('delDpt').addEventListener('click', function() {
	 var departNo = $('#depart_no').val();
	 $('#del_no').val(departNo);
	 console.log(departNo);
	 var depart_name=$('#depart_name').val();
	    var confirmMessage = "삭제할 부서 : " + depart_name + "\n정말로 삭제하시겠습니까?";

	    if (confirm(confirmMessage)) {
	        // 사용자가 '예'를 선택한 경우에만 폼을 제출
	        document.getElementById('delDptForm').submit();
	    } else {
	        // 사용자가 '아니오'를 선택한 경우 또는 취소한 경우
	        console.log("삭제 취소됨");
	    }
});
//조직도
function onerModal(){
		$('#orgChartModal').modal('show');		
}

$(document).on('click', 'p', function() {
	console.log("직원선택");
    // 클릭한 p 태그의 데이터 가져오기
    var memberNo = $(this).data('member-no');   
    var memberName = $(this).data('name'); 
    console.log("Member No:", memberNo);
    $('input[name="dpt_oner"]').val(memberName);
    $('input[name="oner_no"]').val(memberNo);
    $('input[name="team_oner"]').val(memberName);
    $('input[name="team_oner_no"]').val(memberNo);
    $('#orgChartModal').modal('hide');

});

	var selectedDepartmentState = 'existence';
	departmentListCall()
	console.log('상태:' + selectedDepartmentState);

	// 페이지 로딩 시 초기값에 해당하는 라벨에 스타일 적용
	document.getElementById('incumbentStateLabel').style.fontWeight = 'bold';
	document.getElementById('quitterStateLabel').style.fontWeight = 'normal';

	function selectDepartmentState(departmentState) {
		selectedDepartmentState = departmentState;
		console.log(selectedDepartmentState);
		// 선택된 라벨의 스타일 변경
		document.getElementById('incumbentStateLabel').style.fontWeight = (departmentState === 'existence') ? 'bold'
				: 'normal';
		document.getElementById('quitterStateLabel').style.fontWeight = (departmentState === 'dissolution') ? 'bold'
				: 'normal';
		departmentListCall();
	}

	function departmentListCall() {
		$.ajax({
			type : 'get',
			url : 'departmentListCall',
			data : {
				'departState' : selectedDepartmentState
			},
			dataType : 'JSON',
			success : function(data) {
				console.log("초기 리스트" + data)
				drawDepartmentList(data);
			},
			error : function(e) {
				console.log(e)
			}
		});
	}

	function drawDepartmentList(departmentList) {
		console.log(departmentList);

		var content = '';
		departmentList.list.forEach(function(item, idx) {
			content += '<ul onclick="openModal(' + item.depart_no + ')">';
			content += '<li>' + item.depart_no + '</li>';
			content += '<li>' + item.depart_name + '</li>';
			content += '<li>' + item.name + '</li>';
			content += '<li>' + item.total_member + '</li>';
			content += '<li>' + item.depart_date + '</li>';
			content += '</ul>';
		});
		$('#departmentList').empty();
		$('#departmentList').append(content);
	}

	function createModal() {
		var departNo = $('#depart_no').val();
		 $('#depart_p_no').val(departNo);
		$('#createModal').modal('show');	
		console.log('부서등록');
	}

	function openTeam(depart_name) {
		$('#teamModal').modal('show');
		$.ajax({
			type : 'get',
			url : 'detailTeam',
			data : {
				'depart_name' : depart_name
			},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				$('#team_name').empty();
				$('#team_oner').empty();
				$('#team_member').empty();
				$('#team_depart_date').empty();
				$('#team_no').empty();
				data.detail.forEach(function(item) {
					$('#team_name').append(item.depart_name);
					$('#team_oner').append(item.name);
					$('#team_member').append(item.total_member);
					$('#team_depart_date').append(item.depart_date);
					$('#team_no').val(item.depart_no);
				});
			},
			error : function(e) {
				console.log(e)
			}
		});
	}

	function openModal(depart_no) {
		$('#myModal').modal('show');
		console.log('open모달이왜안대? : ');
		$.ajax({
			type : 'get',
			url : 'detailDepart',
			data : {
				'depart_no' : depart_no
			},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				$('#depart_name').empty();
				$('#dpt_oner').empty();
				$('#total_member').empty();
				$('#depart_date').empty();
				$('#depart_no').empty();
				data.detail.forEach(function(item) {
					$('#depart_name').append(item.depart_name);
					$('#dpt_oner').append(item.name);
					$('#total_member').append(item.total_member);
					$('#depart_date').append(item.depart_date);
					$('#depart_no').val(item.depart_no);
				});
				var content = '';
				data.team.forEach(function(item) {
					content += '<li onclick="openTeam(\'' + item.depart_name
							+ '\')">' + item.depart_name + '</li>';		
				});
				$('#depart_teamN').empty();
				$('#depart_teamN').append(content);

			},
			error : function(e) {
				console.log(e)
			}
		});
	}

	// 수정 버튼을 눌렀을 때 실행되는 함수
	document.getElementById('updateDpt').addEventListener('click', function() {
		makeEditable('depart_name');
		makeEditable('dpt_oner');
		var btn = document.getElementById('addOner');
		btn.style.display = 'block';
		this.innerHTML = '저장';
		// 수정 버튼의 클릭 이벤트를 저장 함수로 변경
		this.removeEventListener('click', arguments.callee);
		this.addEventListener('click', function() {
			// 저장 버튼이 클릭되었을 때 수행되는 함수
			// 폼을 submit
			document.getElementById('updateDptForm').submit();
		});
	});

	function makeEditable(id) {
		var element = document.getElementById(id);
		var value = element.textContent;

		// input 요소 생성
		var input = document.createElement('input');
		input.type = 'text';
		input.value = value;
		var nameAttribute = element.getAttribute('data-name');
		if (nameAttribute) {
			input.setAttribute('name', nameAttribute);
		}
		// 기존 요소를 input 요소로 교체
		element.innerHTML = '';
		element.appendChild(input);
	}

	//팀수정
	document.getElementById('updateTeam').addEventListener('click', function() {
		makeEditable('team_name');
		makeEditable('team_oner');
		var btn = document.getElementById('addTeamOner');
		btn.style.display = 'block';
		this.innerHTML = '저장';
		

		// 수정 버튼의 클릭 이벤트를 저장 함수로 변경
		this.removeEventListener('click', arguments.callee);
		this.addEventListener('click', function() {
			// 저장 버튼이 클릭되었을 때 수행되는 함수
			// 폼을 submit
			document.getElementById('updateTeamForm').submit();
		});
	});


	

</script>
</html>