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
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box; text-align: center;}
        #common_list_form .list_form .list_title ul li:first-child{width: 20%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 20%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 20%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 20%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 20%;}
        #common_list_form .list_form .list_content ul{width: 100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box; text-align: center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 20%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 20%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 20%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 20%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 20%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}

        #common_list_form .search_box{position: relative; margin: 0px 0 10px 50px; border: 1px solid #fff; display: inline-block;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}
    </style>
<body>
    <%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">음원</h2>
        <h3 class="sub_title">계약 현황</h3>
        <!-- 검색 바 -->
        <ul class="search_box">
            <li>
                <input type="text" id="search_info" onkeydown="handleKeyDown(event)" placeholder="음원명 또는 가수명을 입력해주세요.">
            </li>
            <li class="btn_box">
                <div class="search_btn">
                    <img src="./img/search.png" alt="검색 버튼" onclick="search()">
                </div>
            </li>
        </ul>
        
        <div class="list_form">
            <ul>
                <li class="list_title">
                    <ul>
                        <li>음원명</li>
                        <li>저작권자명</li>
                        <li>계약 시작일</li>
                        <li>계약 만료일</li>
                        <li>담당자</li>
                    </ul>
                </li>
                <li class="list_content" id="songList">
                    
                </li>
            </ul>
        </div>
        <div id="paging" class="pagingBox">
            <div class="container">
                <nav aria-label="Page navigation" style="text-align: center;">
                    <ul class="pagination" id="pagination">

                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
</body>
<script>
	var showPage = 1;
	var searchInfo = "";
	
	listCall(showPage);
	
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
            url: "songSearch",
            data: {"search_info": searchInfo, "page": showPage},
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
    
    function listCall(page){
    	
    	showPage = page;
    	
        $.ajax({
            type: "GET",
            url: "song/list",
            data: {"search_info": searchInfo,"page": page},
            dataType: "JSON",
            success: function(data){
                console.log(data);
                drawList(data);
                updatePagination(data.pages);
            },
            error: function(e){
                console.log(e);
            }
        });
    }

    function drawList(list){
        console.log(list);

        var content = "";

        list.list.forEach(function(item, index){
            content+='<ul>';
            content+='<li><a href="song/list/detail?song_no='+item.song_no+'">'+item.song_name+'</a></li>';
            content+='<li>'+item.song_owner+'</li>';
            var sdate = new Date(item.song_startDate);
            var startDate = sdate.toLocaleDateString("ko-KR");
            content+='<li>'+startDate+'</li>';
            var edate = new Date(item.song_endDate);
            var endDate = edate.toLocaleDateString("ko-KR");
            content+='<li>'+endDate+'</li>';
            content+='<li>'+item.name+' '+item.member_position+'</li>'; // member 테이블	
            content+='</ul>';
        });

        $("#songList").empty();
        $("#songList").append(content);
    }
    
    function updatePagination(totalPages) {
    	$("#pagination").twbsPagination('destroy'); // 기존 페이징 제거
    	
	    $("#pagination").twbsPagination({
	        startPage: showPage,
	        totalPages: totalPages,
	        visiblePages: 5,
            onPageClick: function(e, page){
                if(showPage != page){
                    console.log(page);
                    showPage = page;
                    listCall(page);
                }
            }
	    });
	}
</script>
</html>