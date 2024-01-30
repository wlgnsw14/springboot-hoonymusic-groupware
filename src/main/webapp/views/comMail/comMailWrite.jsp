<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<link rel="stylesheet" href="resources/richtexteditor/rte_theme_default.css" />

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="resources/richtexteditor/rte.js"></script>
<script type="text/javascript" src='resources/richtexteditor/plugins/all_plugins.js'></script>


</head>
<style>
		.left_box{width: 250px; float: left; height: 400px;}
		.left_box .org_chart{width:100%; height: 100%; border: 1px solid #ccc; padding: 10px; overflow: auto;}
        .left_box ul li{font-size: 16px;}
        .left_box ul li span, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p{cursor: pointer; border: 1px solid rgba(0,0,0,0); display: inline-block;}
        .left_box ul li span.on, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p.on{font-weight: 700; border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        .left_box ul li span.hover, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p.hover{border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        .left_box ul>li>ul{padding-top:3px;}
        .left_box ul>li>ul>li{padding-left:15px; cursor: pointer;}
        .plus{display: none;}

        #write_form {
        	position: relative;
            margin: 50px auto; /* 가운데 정렬을 위한 마진 설정 */
            width: 80%;
            left: 130px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        
        th{width: 20%; text-align: center; width: 10%;}

        input[type="text"] {
            padding: 8px;
        }

        #rich_deditor {
            margin-top: 10px;
            border: 1px solid #ddd;
        }
        
        #send{
        	float: right;
        	border-radius: 3px;
        	background-color:025464;
        	color:white;
        	padding: 5 10;
        	border:none;
        	margin: 10px;
        	position: relative;
        	right: 10px;
        }
        
        .titleWrap{
        	position: relative;
        	top: 40px;
        }
        
        .contentWrap{
        	margin-top: 80px;
        }
        
        .all_del{
    		margin: 10px;
    		border-radius: 3px;
    		background-color:025464;
    		padding: 2 10 5 10;
    		border:none;
    		height: 22px;
    		cursor: pointer;
    		color: white;
    		margin-left: 10px;
        }
        
        span{color: white;}
        
        .fileBox{display: flex;height: 48px; align-items: center;}
        #select_file{margin-top:10px;}
		#organization{margin:5 0 5 10; border-radius: 3px; background-color:025464; color:white; padding: 5 10; border:none;}
		#sender_ul{display: flex; margin: 10px;}
		#inputSubject{margin: 10px; width: 98%;}
		.select_file_custom{cursor: pointer; border-radius: 3px;background-color:025464;color:white;padding: 5 10;border:none; margin: 10px;}
		.file_list ul{display: flex;}
		.file_list ul li{margin-right: 5px;}
		.file_delete{cursor: pointer;}
    </style>
<body>
  	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------mailWrap start------------------------------------------------- -->
    <form action="writeMail.do" method="POST" id="write_form" enctype="multipart/form-data">
        <div class="titleWrap">
	        <h2 class="big_title"> 메일 쓰기 </h2>
        </div>
        
        <div class="contentWrap">
            <table>
                <tr>
                    <td  class="" colspan="2" style="border: none;"><input type="button" id="send" value="보내기" onclick="save()"/></td>
                </tr>
                <tr>
                    <th>&nbsp;받는 사람 &nbsp;&nbsp;</th>
                    <td>
                        <div>
                            <ul id="sender_ul">
                                <li>
                                	<c:if test="${not empty sender}">
                                   		<input type="text" name="receiver" id="inputReceiver" value="${sender}" readonly>
                                	</c:if>
                                	<c:if test="${empty sender}">
                                   		<input type="text" name="receiver" id="inputReceiver" value="" placeholder="받는 사람을 입력하세요.">
                                	</c:if>
                                	<input type="hidden" name="member_no" value="">
                                </li>
                                <li>
                                    <input type="button" id="organization" value="주소록"/>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>&nbsp;제목 &nbsp;&nbsp;</th>
                    <td><input type="text" name="note_subject" id="inputSubject" placeholder="제목을 입력하세요."></td>
                </tr>
                <tr>
                    <th>&nbsp;파일첨부 &nbsp;&nbsp;</th>
                    <td>
                        <div class="fileBox">
                            <a class="btn_file">
                                <span>
                                	<label class="select_file_custom" for="select_file">
                                	파일 선택
                                	</label>
                                    <input type="file" id="select_file" name="files" multiple style="display:none">
                                </span>
                            </a>
                            <a>
                                <span class="all_del" onclick="all_del()">모두삭제</span>
                            </a>
                        </div>
                    </td>
                </tr>
                <tr>
                	<td colspan="2">
                    	<div class="file_list">
                            <!-- 첨부 파일란 -->
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div id="rich_deditor"></div>
                        <!-- 작성글은 div 에 담겨지는데, div 는 서버로 전송이 불가능하다. -->
                        <input type="hidden" name="note_content" value=""/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <!-- -------------------------------------------mailWrap end------------------------------------------------- -->
    
    
<!-- 주소록 팝업 모달 -->
<div class="modal fade" id="organizationModal" tabindex="-1" role="dialog" aria-labelledby="organizationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document" style="margin-left: 300px; width: 300px; height: 500px;">
        <div class="modal-content" >
			<div class="modal-body">
				<div>
					<div class="left_box">
						<h5>주소록</h5>
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
			</div>
			<div class="modal-footer" style="margin-top: 450px;">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
document.getElementById('organization').addEventListener('click', function() {
	$('#organizationModal').modal('show');
});

$(document).on('click', 'p', function() {
    // 클릭한 p 태그의 데이터 가져오기
    var memberNo = $(this).data('member-no');   
    var memberName = $(this).data('name'); 
    console.log("Member No:", memberNo);
    $('input[name="receiver"]').val(memberName);
    $('input[name="member_no"]').val(memberNo);
    $('#organizationModal').modal('hide');
});



$('.org_chart>ul>li>span').on('click',function(){
    var $ul = $(this).siblings('ul');

    $ul.slideToggle(400,function(){
        if ($(this).is(":hidden")) {
            $(this).siblings('span').find('.minus').css('display','none');
            $(this).siblings('span').find('.plus').css('display','inline-block');
        }else{
            $(this).siblings('span').find('.minus').css('display','inline-block');
            $(this).siblings('span').find('.plus').css('display','none');
        }
    });
});
$('.org_chart>ul>li>ul>li>span').on('click',function(){
    var $ul = $(this).siblings('ul');

    $ul.slideToggle(300,function(){
        if ($(this).is(":hidden")) {
            $(this).siblings('span').find('.minus').css('display','none');
            $(this).siblings('span').find('.plus').css('display','inline-block');
        }else{
            $(this).siblings('span').find('.minus').css('display','inline-block');
            $(this).siblings('span').find('.plus').css('display','none');
        }
    });
});



//--------------------------------------mail start-----------------------------------------------------
	var $inputReceiver = $("#inputReceiver");
	var $inputSubject = $("#inputSubject");
	var $rich_deditor = $("#rich_deditor");


    $(document).ready(function() {
		// 세션에서 저장된 정보 읽어오기
		var selectInfo = JSON.parse(sessionStorage.getItem("selectInfo"));
		
		console.log("선택된 메일 정보", selectInfo);
	
		// 가져온 이름을 inputReceiver의 value로 설정
	    if (selectInfo && selectInfo.sender) {
	        $("#inputReceiver").val(selectInfo.sender);
	    }
			
		// 세션에서 사용이 끝난 정보는 삭제
		sessionStorage.removeItem('selectInfo');
	});
	
    var config = {}
    //config.toolbar = "basic"; // 이 부분이 주석 되면 모든 기능이 다 나타난다.
    config.editorResizeMode = "none"; // 에디터 크기 조절 안됨
    var editor = new RichTextEditor("#rich_deditor", config);
    
	var fileList = [];
    
    // 파일이 선택될 때마다 파일 리스트에 추가
    $("#select_file").on("change", function(){
    	var files = $(this)[0].files;
    	
    	for (var i = 0; i < files.length; i++) {
			fileList.push(files[i]);
			addFileToUI(files[i]);
		}
    });
    
    // 파일 리스트
    function addFileToUI(file) {
		var content = "";
		
		content += '<ul>';
		content += '<li><span class="file_name">' + file.name + '</span></li>';
		content += '<li><span class="file_size">' + formatFileSize(file.size) + '</span></li>';
		content += '<li><span class="file_delete" onclick="deleteFile(\'' + file.name +'\')">X</span></li>';
		content += '</ul>';
		
		$(".file_list").append(content);
	}
    
    // 파일 크기 포맷
    function formatFileSize(size) {
    	if (size < 1024) {
            return size + 'B';
        } else if (size < 1024 * 1024) {
            return (size / 1024).toFixed(2) + 'KB';
        } else {
            return (size / (1024 * 1024)).toFixed(2) + 'MB';
        }
	}
    
    // 모두 삭제 버튼 - 파일 리스트 초기화 및 UI에서 삭제
    function all_del() {
		fileList = [];
		$(".file_list").empty();
	}
    
 	// 개별 파일 삭제 함수
    function deleteFile(fileName) {
        fileList = fileList.filter(function(file) {
            return file.name !== fileName;
        });
        $('.file_list').empty();
        fileList.forEach(function(file) {
            addFileToUI(file);
        });
    }

    // 저장 버튼을 누르면 실행되는 함수 save
    function save(){
        var content = editor.getHTMLCode();
        $('input[name="note_content"]').val(content);
       
    	 // FormData 객체 생성
        var formData = new FormData(document.getElementById("write_form"));
    	
     	/* // 파일 리스트를 FormData에 추가
        for (var i = 0; i < fileList.length; i++) {
            formData.append("files", fileList[i]);
        } */
     	
     	// XMLHttpRequest 객체 생성
        var xhr = new XMLHttpRequest();

        // POST 방식, URL, 동기 여부 설정
        xhr.open('POST', document.getElementById('write_form').action, true);
		

	    // 폼 데이터 전송
	    xhr.send(formData);

        // 서버 응답 처리
        xhr.onload = function() {
            if (xhr.status === 200) {
                // 성공 시 동작
                console.log(xhr.responseText);
                // 여기에 성공 시 동작을 추가할 수 있습니다.
            } else {
                // 실패 시 동작
                console.error(xhr.statusText);
                // 여기에 실패 시 동작을 추가할 수 있습니다.
            }
        };
        
        location.href="/sendMail";
    }
//--------------------------------------mail end-----------------------------------------------------
</script>
</html>