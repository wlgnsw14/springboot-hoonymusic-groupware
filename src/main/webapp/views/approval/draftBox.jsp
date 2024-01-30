<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hoony Music</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: 700;
            font-style: normal;
        }
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: 500;
            font-style: normal;
        }
        @font-face {
            font-family: 'GmarketSansLight';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
            font-weight: 300;
            font-style: normal;
        }

        *{margin:0; padding:0;}
        li{list-style: none;}
        a{text-decoration: none;}
        img{border:none; display: block;}
        body, header, section, footer, div, ul, li, p, a, span, input, textarea, h2, h3, h4, h5, h6, select{font-family: 'Noto Sans KR', sans-serif; color: #222; font-size: 14px;}
        h1{font-family: 'GmarketSansMedium'; color:#222;}

        #nav{position:fixed; width:15%; height:100%; box-shadow: 0 0 3px 0.5px rgb(228, 228, 228); background-color: #fff; overflow: auto; border-right: 1px solid #ccc; box-sizing: border-box;}
        #nav .nav_inner{padding-top: 40px;}
        #nav .logo{padding: 0 0 30px 40px;}
        #nav .logo a{color:#222; font-size:20px;}
        #nav .gnb ul{display: none;}
        #nav .gnb li{padding:10px 0 10px 40px; font-size:14px; font-family: 'GmarketSansMedium', sans-serif; color:#888; letter-spacing: 0.5px; word-spacing: -2px;}
        #nav .gnb li.dep2{padding-left:50px;}
        #nav .gnb li.dep3{padding-left:60px;}
        #nav .gnb a:hover li{color:#222; background-color: #eee;}
        #nav .gnb li.active{color:#222; background-color: #eee;}
        #nav .gnb a li{position:relative;}
        #nav .gnb a li .arrow{position:absolute; right:30px; top:12px;}
        #nav .gnb a li .arrow svg{width:100%; transition:0.3s;}

        #util{position:fixed; right:0; height: 80px;}
        #util .util_inner{position:relative; top:30px; right:50px; width:195px; height: 55px;}
        #util .util_inner li{width: 55px; height: 55px; border-radius: 25px; background-color: #fff; float:left; margin-right:15px; cursor: pointer; overflow: hidden; box-shadow: 1px 1px 3px 1px #ddd;}
        #util .util_inner li:last-child{margin-right:0;}
        #util .util_inner li svg{position:relative; top:15px; left:15px;}
        #util .util_inner li img{width:100%;}

        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 30px 50px; font-size:24px; font-weight: 500;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 36px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:7px 0 7px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 13%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 12%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 45%;}
        #common_list_form .list_form .list_title ul li:nth-child(5){width: 10%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 34px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li div{width:40px; height: 24px; line-height: 24px; font-size: 12px; color: #fff; text-align: center;}
        #common_list_form .list_form .list_content ul li div.red {background-color: #eb5252;}
        #common_list_form .list_form .list_content ul li div.gray{background-color: #969292;}
        #common_list_form .list_form .list_content ul li div.green{background-color: #5da754;}
        #common_list_form .list_form .list_content ul li:first-child{width: 13%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 12%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 45%;}
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 10%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
        #common_list_form .search_box{position: relative; margin: 0 0 10px 50px; border: 1px solid #fff; display: inline-block;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box #search_type{width: 70px; height: 28px; border: 1px solid #ccc; border-right: none;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover #search_type{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}
        #common_list_form .pageNum{float: right; margin-right: 50px;}
        #common_list_form .pageNum #viewPageNum{width: 50px; height: 28px; border: 1px solid #ccc;}
    </style>
</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">기안함</h2>
        <ul class="search_box">
            <li>
                <select id="search_type">
                    <option value="1">결재자</option>
                    <option value="2">제목</option>
                </select>
            </li>
            <li>
                <input type="text" id="search_info" placeholder="검색" onkeydown="handleKeyDown(event)"/>
            </li>
            <li class="btn_box" onclick="search()">
                <div class="search_btn">
                    <img src="/resources/img/common/search.png" alt="검색 버튼">
                </div>
            </li>
        </ul>
        <div class="pageNum">
        	<select id="viewPageNum">
        		<option value="5">5</option>
        		<option value="10">10</option>
        		<option value="15">15</option>
        	</select>
        </div>
        
        <div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
                        <li>기안일</li>
                        <li>완료일</li>
                        <li>결재양식</li>
                        <li>제목</li>
                        <li>현재 결재자</li>
                        <li>결재상태</li>
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
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
</body>
<script>
var showPage=1;
draftListCall(showPage);

$('#viewPageNum').change(function(){
	// 페이지당 보여줄 게시물 갯수가 변경되면 페이징 처리 UI 를 지우고 다시 그려 준다.
	// 안그럼 처음에 계산한 페이지 값을 그대로 들고 있게 된다.
	$('#pagination').twbsPagination('destroy');
	draftListCall(showPage);
});

function search(){
	$('#pagination').twbsPagination('destroy');
	draftListCall(showPage);
}

// 검색
function handleKeyDown(event){
    // 엔터키 keycode == 13
    if(event.keyCode === 13){
    	search();
    }
}
  
  function draftListCall(page){
	  $.ajax({
			type:'get',
			url:'draftListCall.ajax',
			data:{'viewPageNum':$('#viewPageNum').val(), 'page':page, 'searchType':$('#search_type').val(), 'searchInfo':$('#search_info').val()},
			dataType:'JSON',
			success: function(data){
				console.log("draftListCall data 가져옴");
				drawDraftList(data);
			},
			error:function(e){
				console.log("draftListCall 에러");
			}
		});
  }
  
  function drawDraftList(draftList){
	  console.log(draftList);
	  
	  var content = "";
	  draftList.list.forEach(function(item, idx){
		  content += '<ul>';
		  content += '<li>'+item.approval_start+'</li>';
		  if(item.approval_end == null){
			  content += '<li>-</li>';
		  }else{
			  content += '<li>'+item.approval_end+'</li>';
		  }
		  if(item.form_no == '1'){
			  content += '<li>기안서</li>';
		  }else if(item.form_no == '2'){
			  content += '<li>품의서</li>';
		  }else if(item.form_no == '3'){
			  content += '<li>휴가신청서</li>';
		  }else if(item.form_no == '4'){
			  content += '<li>음원 계약 신청서</li>';
		  }else if(item.form_no == '5'){
			  content += '<li>음원 계약 취소 신청서</li>';
		  }else if(item.form_no == '6'){
			  content += '<li>음반 계약 신청서</li>';
		  }else if(item.form_no == '7'){
			  content += '<li>음반 계약 취소 신청서</li>';
		  }else if(item.form_no == '8'){
			  content += '<li>저작권 계약 신청서</li>';
		  }else if(item.form_no == '9'){
			  content += '<li>저작권 계약 취소 신청서</li>';
		  }else if(item.form_no == '10'){
			  content += '<li>고객사 계약 신청서</li>';
		  }else if(item.form_no == '11'){
			  content += '<li>고객사 계약 취소 신청서</li>';
		  }
		  
		  if(item.form_no == '1'){
			  content += '<li><a href="draftDocDetail?approval_no='+item.approval_no+'">'+item.approval_title+'</a></li>';
		  }else if(item.form_no == '2'){
			  content += '<li><a href="expenseReqDetail?approval_no='+item.approval_no+'">'+item.approval_title+'</a></li>';
		  }else if(item.form_no == '3'){
			  content += '<li><a href="leaveAppDetail?approval_no='+item.approval_no+'">'+item.approval_title+'</a></li>';
		  }else if(item.form_no == '4'){
			  content += '<li>음원 계약 신청서</li>';
		  }else if(item.form_no == '5'){
			  content += '<li>음원 계약 취소 신청서</li>';
		  }else if(item.form_no == '6'){
			  content += '<li>음반 계약 신청서</li>';
		  }else if(item.form_no == '7'){
			  content += '<li><a href="recordContCancelAppDetail?approval_no='+item.approval_no+'">'+item.approval_title+'</a></li>';
		  }else if(item.form_no == '8'){
			  content += '<li><a href="crd2?approval_no='+item.approval_no+'">'+item.approval_title+'</a></li>';
		  }else if(item.form_no == '9'){
			  content += '<li>저작권 계약 취소 신청서</li>';
		  }else if(item.form_no == '10'){
			  content += '<li>고객사 계약 신청서</li>';
		  }else if(item.form_no == '11'){
			  content += '<li>고객사 계약 취소 신청서</li>';
		  }
		  
		
		  content += '<li>'+item.name+'</li>';
		  if(item.document_state == '0'){
			  content += '<li><div class="green">진행중</div></li>';
		  }else if(item.document_state == '1'){
			  content += '<li><div class="gray">완료</div></li>';
		  }else if(item.document_state == '2'){
			  content += '<li><div class="red">반려</div></li>';
		  }
		  content +='</ul>';
	  });
	  $('.list_content').empty();
	  $('.list_content').append(content);
	  
	//$('#pagination').twbsPagination('destroy');
	 	$('#pagination').twbsPagination({
			startPage: draftList.currPage,
			totalPages: draftList.pages,
			visiblePages: 5, 
			onPageClick:function(e,page){ 
				if(showPage != page){ 
					showPage=page;
					draftListCall(page);
				}
			}
		}); 
	  
  }
</script>
</html>