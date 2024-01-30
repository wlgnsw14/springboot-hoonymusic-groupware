<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>

		#common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .titleWrap{position: relative; display: flex;}
        #common_list_form .count{position: absolute; top: 80px; left: 220px;}
        #common_list_form #mailListAllCheck{width: 20px; height: 50px;}
        #common_list_form #toolbar{display:flex;align-items:center;padding-left:2%;}
        #common_list_form #toolbar li{margin-right: 18px;}
        #common_list_form #toolbar #readOption{width:100%; height:100%;}
        
        
        #common_list_form .list_form{position:relative; width: 90%; margin-left: 50px;}
        #common_list_form .list_form .list_title ul{width: 100%;}
        #common_list_form .list_form .list_title ul li{float: left;}
        #common_list_form .list_form .list_title #readOption{cursor: pointer;}
        #common_list_form .list_form .list_title #mailListAllCheck{width: 20px; height: 50px;}
        #common_list_form .list_form .list_title .btn_submenu{border: 1px solid black; width: 55px; height: 30px; text-align: center; cursor: pointer;}
        #common_list_form .list_form .list_title .btn_submenu .btn_tool{position: relative; top: 5px;}
        #common_list_form .list_form .list_content{padding-top:30px;}
        #common_list_form .list_form .list_content ul{width: 100%; height: 40px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box; text-align: center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 5%;}
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 5%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 30%;}
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 20%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 30%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
        
        #common_list_form .search_box{position: relative; margin: 0px 0 10px 15px; border: 1px solid #fff; display: flex;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}

        #del_modal{
			display: none; 
			width:300px; 
			height:150px; 
			background: rgb(237, 237, 237); 
			border:1px solid gray; 
			text-align:center;
			position:absolute; 
			left:50%; 
			bottom: 50%;
		}
		
		.modalBtnNo, .modalBtnYes{
			height: 35px;
			width: 80px;
			color: white;
			border: none;
			border-radius: 10px;
			background-color: gray;
		}

		.pagingBox .container{width:100%;}
    </style>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------mailWrap start------------------------------------------------- -->
    <section id="common_list_form">
        <div class="titleWrap">
            <h2 class="big_title"> 받은 메일함 </h2>
            <span class="count">
                    전체 메일 
                <span class="num">
                    <strong id="totalMail"><!-- 전체 메일 숫자 --></strong>
                </span>
                    / 안읽은 메일
                <span class="num">
                    <strong id="unreadMail"><!-- 안읽은 메일 숫자 --></strong>
                </span>
            </span>
        </div>


        <div class="list_form">
			<!-- 검색 바 -->
            <ul class="search_box">
            	<li>
            		<input type="text" id="search_info" onkeydown="handleKeyDown(event)" placeholder="사원명 또는 제목을 입력해주세요.">
                </li>
                <li class="btn_box">
                     <div class="search_btn">
                     	<img src="/resources/img/common/search.png" alt="검색 버튼" onclick="search()">
                     </div>
               	</li>
			</ul>
            <ul>
                <li class="list_title">
                    <ul id="toolbar">
                        <!-- 툴바 -->
                        <li>
                            <input type="checkbox" id="mailListAllCheck" name="mailAllcheck" value="off">
                        </li>
                        <li class="btn_submenu">
                            <a class="btn_tool" data-role="button" onclick="delModal()">
                                <span class="txt_caution">삭제</span>
                            </a>
                        </li>
                        <li class="btn_submenu">
                            <select id="readOption">
                                <option value="all">전체</option>
                                <option value="read">읽음</option>
                                <option value="unread">안읽음</option>
                            </select>
                        </li>
                    </ul>
                </li>

                <li class="list_content">
                    
                </li>
            </ul>
        </div>

        <div id="paging" class="pagingBox">
            <!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
            <div class="container">
                <nav aria-label="Page navigation" style="text-align: center">
                    <ul class="pagination" id="pagination"></ul>
                </nav>
            </div>
        </div>

		<!-- 모달 -->
		<div id="del_modal">
			<div style="margin:30px 0; font-size:24px;">삭제 하시겠습니까?</div>
			<button onclick="delNo()" class="modalBtnNo">아니요</button>
			<button onclick="delYes()" class="modalBtnYes">예</button>	
		</div>
    </section>
    <!-- -------------------------------------------mailWrap end------------------------------------------------- -->
</body>
<script>
//-------------------------------------------mailWrap start-------------------------------------------------
	// 받은 메일함 리스트 호출
	var showPage = 1;
	var searchInfo = "";
	var loginNo = "${sessionScope.loginMember.member_no}";
	
	$(document).ready(function(){
	    $.ajax({
	        type: "get",
	        url: "receiveMail/counts.ajax",
	        dataType: "JSON",
	        success: function(data){
	            console.log(data);
	
	            // 전체 메일 갯수 업데이트
	            $("#totalMail").text(data.totalMail);
	            // 안 읽은 메일 갯수 업데이트
	            $("#unreadMail").text(data.unreadMail);
	        },
	        error: function(e){
	            console.log(e);
	        }
	    });
	    
	    searchInfo = $("#search_info").val();
	    var readOption = $("#readOption").val();
	    listCall(showPage, searchInfo, readOption);
	});
	
	
	// 검색
	function handleKeyDown(event){
	    // 엔터키 keycode == 13
	    if(event.keyCode === 13){
	        search();
	    }
	}
	
	function search(){
	    console.log($("#search_info").val());
	    
	    showPage = 1;
	    searchInfo = $("#search_info").val();
	
	    $.ajax({
	        type: "GET",
	        url: "receiveMail/search.ajax",
	        data: {"search_info": searchInfo, "page": showPage, "loginNo": loginNo, 'readOption':$('#readOption').val()},
	        dataType: "JSON",
	        success: function(data){
	        	drawList(data);
	        	updatePagination(data.pages);
	        },
	        error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	// 받은 쪽지 읽음 여부 필터링
	$('#readOption').change(function(){
	    console.log($('#readOption').val());
	    listCall(showPage, searchInfo, $('#readOption').val());
	});
	
	function listCall(page, search_info, readOption){
	    
	    showPage = page;
	
	    $.ajax({
	        type: "get",
	        url: "receiveMail/list.ajax",
	        data:{"search_info": search_info, "page": page, "loginNo": loginNo, 'readOption': readOption},
	        dataType: "JSON",
	        success: function(data){
	            console.log("받은 메일함 리스트 호출!!");
	            drawList(data);
	            updatePagination(data.pages);
	        },
	        error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	function drawList(list){
	    console.log("drawList 호출!!!");
	    console.log("list : "+list);
	
	    var content = "";
	
	    list.list.forEach(function(item, idx){
	        content += '<ul>';
	        content += '<li><input type="checkbox" name="receiveCheck" value="' + item.note_no + '"/></li>';
	        content +='<li>' 
	            if(item.receive_state=== "0"){
	                content+='<img src="/resources/img/common/unread.png" alt="unreadImage" width=20 height=20/>';
	            }else if(item.receive_state=== "1"){
	                content+='<img src="/resources/img/common/read.png" alt="readImage" width=20 height=20/>';
	            }
	        content +='</li>';
	        content += '<li><span class="name">' + item.sender_name + '</span></li>';
	        content += '<li><a href="receiveMail/list/detail?note_no='+item.note_no+'">' + item.note_subject + '</a></li>';
	        content += '<li><span class="date">' + item.note_date + '</span></li>';
	        content += '<li>'
	            if (item.file_size == null) {
	                content += '<span class="num">' + 0 + 'KB</span></li>';
	             } else{
	                content += '<span class="num">' + item.file_size + 'KB</span></li>';
	             }
	        content += '</ul>';
	    });
	    $('.list_content').empty();
	    $('.list_content').append(content);
	}
	
	function updatePagination(totalPages) {
		$("#pagination").twbsPagination('destroy'); // 기존 페이징 제거
		
		 $("#pagination").twbsPagination({
		        startPage: showPage, 
		        totalPages: totalPages, 
		        visiblePages:5,
		        onPageClick:function(e,page){ 
		            if(showPage != page){ 
		                console.log(page);	
		                showPage=page; 
		                listCall(page, searchInfo, $('#readOption').val());
		            }
		        }
		    });
		}
	
	// 받은 쪽지 체크 박스
	$("#mailListAllCheck").on("click", function(){
	    var $chk = $('input[name="receiveCheck"]'); 
	    //console.log($chk);
	    console.log($(this).is(":checked")); 
	    if($(this).is(":checked")){
	        $chk.prop("checked",true);
	    }else{
	        $chk.prop("checked",false);
	    }
	});
	
	// 받은 쪽지 삭제 모달창
	function delModal(){
		$('input[name="receiveCheck"]:checked').each(function(idx,item){
			console.log('체크됨!');
			document.getElementById('del_modal').style.display = 'block';
		});
	}
	
	// 받은 메일 '아니요 버튼 클릭
	function delNo(){
	    document.getElementById('del_modal').style.display = 'none';
	}
	
	// 받은 메일 '예' 버튼 클릭(리스트에서 숨김 처리)
	function delYes(){
	    var chkArr = [];
	
	    $('input[name="receiveCheck"]:checked').each(function(idx,item){
		//console.log(idx, $(item).val()); 
			var val = $(item).val();
			
		    if(val != 'on'){
		       	chkArr.push(val);
		    }
	    });
	    console.log(chkArr);
	
	    $.ajax({
	        type: "get",
	        url: "receiveMail/delMail.ajax",
	        data: {'delList': chkArr},
	        dataType: "JSON",
	        success: function(data){
	            console.log("success".data);
	
	            $('#del_modal').modal('hide');
	            listCall(showPage, searchInfo, $('#readOption').val());
	        },
	        error: function(e){
	            console.log(e);
	        }
	    });
	}
//-------------------------------------------mailWrap end-------------------------------------------------
</script>
</html>