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
        #common_list_form .titleWrap{display: flex; position: relative;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .count{position: absolute; top: 60px; left: 180px;}
        #common_list_form .toolBarWrap{position: relative;}
        #common_list_form{padding-left:15%;}
        #common_list_form .titleWrap{display: flex; position: relative;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .count{position: absolute; top: 60px; left: 180px;}
        #common_list_form .toolBarWrap{position: relative;}
        #common_list_form .list_form{position:relative; width: 90%; margin-left: 50px;}
        #common_list_form .list_form .list_content {padding-top: 60px;}
        #common_list_form .list_form .list_content ul{width: 100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left;border-top: 1px solid #999; padding:5px 0 5px 10px; box-sizing: border-box; text-align: center;}
        #common_list_form .list_form .list_content ul li{width: 20%;}
        #common_list_form .list_form .list_content ul li:nth-child(2n){width: 80%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        
        #common_list_form .list_form .list_content .first_list li{width:100%; border-bottom:1px solid lightgray;}
        #common_list_form .list_form .list_content .second_list li:nth-child(2n-1){font-weight:bold;}
        #common_list_form .list_form .list_content .second_list li:nth-child(2n){width:70%;border-right: 1px solid lightgray;}
        #common_list_form .list_form .list_content .second_list li{float: left; width: 30%; border:1px solid lightgray;box-sizing: border-box;margin-bottom: 6px;}
        #common_list_form .list_form .list_content .second_list li:nth-child(7){height:100px;}
        #common_list_form .list_form .list_content .second_list li:nth-child(8){height:100px;overflow:auto;width:70%;}
        #common_list_form .list_form .list_content .second_list li:nth-child(9){width:100%;}
        #common_list_form .list_form .list_content .second_list li:nth-child(10){height: 400px;overflow:auto;width:100%;}
        
        #common_list_form .search_box{position: absolute; margin: 0px 0 10px 50px; border: 1px solid #fff; display: inline-block; left: 250px; top: -10px;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}
        
        
        .txt{font-size:20;border: 1px solid black;padding: 5px;}
        .btn_submenu{margin-right: 12px; cursor: pointer;}
        .toolbar{display:flex;}
        
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
        
    </style>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------mailWrap start------------------------------------------------- -->
    <section id="common_list_form">
        <div class="titleWrap">
            <h2 class="big_title"> 받은 메일 상세보기 </h2>
        </div>
        <div class="list_form">
            <ul>
                <li class="list_title">
                    <ul class="toolbar" >
                        <!-- 툴바 -->
                        <li class="btn_submenu">
                            <a class="btn_tool" data-role="button" onclick="location.href='/writeMail?note_no=${reMailDetail.note_no}'">
                                <span class="txt">답장</span>
                            </a>
                        </li>
                        <li class="btn_submenu">
                            <a class="btn_tool" data-role="button" onclick="delModal()">
                                <span class="txt">삭제</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="list_content">
                    <ul class = "first_list">
                        <li>
                            <h2>${reMailDetail.note_subject}</h2>
                        </li>
                    </ul>
                    <ul class="second_list">
                        <li>보낸 사람 </li>
                        <li>${reMailDetail.sender_name}</li>
                        <li>받는 사람 </li>
                        <li>${reMailDetail.receiver_name}</li>
                        <li>보낸 날짜</li>
                        <li>${reMailDetail.note_date}</li>
                        <li class="get_file">첨부 파일</li>
                        <li>
                        	<c:forEach items="${list}" var="file">
								<span class="fileName">${file.file_oriname}</span>
								<button onclick="location.href='/download.do?newName=${file.file_newname}&oriName=${file.file_oriname}'">download</button>
							</c:forEach>
                        </li>
                        <li>내용</li>
                        <li> ${reMailDetail.note_content}</li>
                    </ul>
                </li>
            </ul>            
        </div>
        
        <input type="hidden" id="hidden" value="${reMailDetail.note_no}">

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
    // 받은 쪽지 삭제 모달창
    function delModal(){
        document.getElementById('del_modal').style.display = 'block';
    }

    // 받은 메일 '아니요 버튼 클릭
    function delNo(){
        document.getElementById('del_modal').style.display = 'none';
    }

	 // 받은 메일 '예' 버튼 클릭(리스트에서 숨김 처리)
    function delYes(){
    	var note_no = $("#hidden").val();
    	console.log("보낸 메일 번호 : "+note_no);
    	
    	// 삭제 버튼을 클릭하면 메일 리스트로 이동
        window.location.href = "/delReMailDetail?note_no="+note_no; 

        document.getElementById('del_modal').style.display = 'none';
    }
    //-----------------------------------mail end--------------------------------------------
</script>
</html>