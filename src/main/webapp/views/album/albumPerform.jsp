<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
</head>
<style>
        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box; text-align:center;}
        #common_list_form .list_form .list_title ul li:first-child{width: 20%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 20%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(5){width: 15%;} 
        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 20%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 20%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 15%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
		
		#common_list_form .search_box{position: relative; margin: 0 0 10px 50px; border: 1px solid #fff; display: inline-block;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box select{width: 70px; height: 28px; border: 1px solid #ccc; border-right: none;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}
        
        .searchbox{
			width: 90%;
		    height: 6%;
		    display: flex;
		    position: relative;
		    left: 65%;
        }
</style>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">음반</h2>
        <h3 class="sub_title">실적 관리</h3>
       <!----------- 검색 ------------>
        <ul class="search_box">
            <li>
                <input type="text" id="search_info" placeholder="검색" onkeydown="handleKeyDown(event)"/>
            </li>
            <li class="btn_box">
                <div class="search_btn">
                    <img src="./img/search.png" alt="검색 버튼" onclick="search()">
                </div>
            </li>
        </ul>
		 <!------- 리스트 ------->
        <div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
                        <li>음반명</li>
                        <li>아티스트명</li>
                        <li>날짜</li>
                        <li>담당자</li>
                        <li>수익(KRW)</li>
                        <li>총 재고량</li>
                    </ul>
                </li>
                <li class="list_content" id="albumPerformList">
                    
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
//-------------------------------- list start ------------------------------------------
var showPage=1;
listCall(showPage);

function listCall(page){	
	$.ajax({
		type:'get',
		url:'albumList',
		data:{'page':page, "a_name": $('#search_info').val()}, 
		dataType:'JSON',
		success: function(data){
			console.log(data);
			drawList(data);	
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	console.log(list);
	var content='';
	list.list.forEach(function(item,idx){ 
		content+='<ul>';
		content+='<li>'+item.alb_name+'</li>';
		content+='<li>'+item.art_name+'</li>'; // artist 테이블
		if(item.albsold_date==null){
			content+='<li> - </li>';
		}else{
			var date = new Date(item.albsold_date); // album_sold 테이블	
			var soldDate = date.toLocaleDateString("ko-KR");
			content+='<li>'+soldDate+'</li>';
		}
		content+='<li>'+item.name+' '+item.member_position+'</li>'; // member 테이블
		content+='<li>'+item.albsold_profit.toLocaleString()+'</li>';
		content+='<li>'+item.total_albsold_stock+'</li>'; // album_sold 테이블	
		content+='</ul>';
	});
	$('#albumPerformList').empty();
	$('#albumPerformList').append(content);
	
	$('#pagination').twbsPagination('destroy');
	$('#pagination').twbsPagination({
		startPage: list.currPage,
		totalPages: list.pages, 
		visiblePages:5, 
		onPageClick:function(e,page){ 
			if(showPage != page){ 
				console.log(page);	
				showPage=page; 
				listCall(page);
			}
		}
	});
}

//-------------------------------- list end ------------------------------------------


//-------------------------------- 검색 start ------------------------------------------
function handleKeyDown(event) {
    // 엔터 키의 keyCode는 13
    if (event.keyCode === 13) {
        // 엔터 키를 눌렀을 때 실행할 검색 함수 호출
        search();
    }
}

function search(){
    showPage = 1; // 검색 시 페이지를 1로 초기화
    listCall(showPage);
}
//-------------------------------- 검색 end ------------------------------------------

</script>
</html>