<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 50%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 50%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}

		
		li button, input[type="button"] {
		    padding: 5px 10px;
		    cursor: pointer;
		    margin-right: 5px;
		    border-radius: 3px;background-color:#025464;color:white;padding: 5 10;border:none;
		}
		
		.searchbox {
	        text-align: center; 
	        margin-top: 20px; 
	    }
	
	    .searchbox h5 {
	        margin-bottom: 0; 
	    }
	
	    #board_name {
	        width: 400px;
	    }
    
    </style>
<body>
<%@ include file="/views/nav.jsp" %>
  <!-- -------------------------------------------list_form start------------------------------------------ -->
  
    <section id="common_list_form">
	<h2 class="big_title">공지사항</h2>
	<h3 class="sub_title">부서 게시판</h3>
        <div class="allpadding" style="padding-left: 50px;padding-right: 50px;">
	        <div class="writebox" >
	        <li><button onclick="location.href='boardWrite'">글작성</button></li>
	        </div>
	        <br/>
	
	        <div class="list_form">
	            <ul>
	                <li class="list_title">
	                    <ul>
	                        <li>글번호</li>
	                        <li>제목</li>
	                        <li>작성자</li>
	                        <li>작성일자</li>
	                        <li>조회수</li>
	                    </ul>
	                </li>
	                <li class="list_content" id="list">
	
	                </li>
	            </ul>
	        </div>
        </div>
        <br/>
        <!------- 검색 ------->
        <div class="searchbox" >
			<div><input type="text" id="board_name" onkeydown="handleKeyDown(event)"/>
			<input type="button" value="검색" onclick="listCall('1')" /></div>
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

	
	var showPage = 1;
	
	listCall(showPage);
	

	function listCall(page){
		console.log("ajax시작");
		$.ajax({
			type:'get',
			url:'list',
			data:{
				 'page': page,
				 'board_name': $('#board_name').val()
			},
			dataType:'json', // 받는 타입
			success:function(data){
				console.log(data);
				console.log("------listCall-----");
				drawList(data);	
			},
			error:function(e){
				console.log(e);
			}
		});
		
	}

	function drawList(list){
		var content = '';
		list.list.forEach(function(item, idx){
			content += '<ul>';
			content += '<li>'+item.board_no+'</li>';
			content+='<li><a href="boardDetail?board_no='+item.board_no+'">'+item.board_title+'</a></li>';
			content += '<li>'+item.board_depart+'</li>';
			content += '<li>'+item.board_date+'</li>';
			content += '<li>'+item.bHit+'</li>';			
			content += '</ul>';
		});
		$('#list').empty(); 
		$('#list').append(content);
		
		
		//페이징 처리 UI 그리기(플러그인 사용)
		$('#pagination').twbsPagination({
			startPage:list.currPage, // 보여줄 페이지
			totalPages:list.pages, // 총 페이지 수(총 갯수/페이지 당 보여줄 게시물 수) : 서버에서 계산해서 가져와야 함
			visiblePages:5, // [1][2][3][4][5]
			onPageClick:function(e, page){ // 번호 클릭 시 실행할 내용
				//console.log(e);
				if(showPage != page){ // 1페이지 보고있는데 1페이지를 또 클릭하진 않을 거니까 (클릭하지 않은 것이라고 생각하기)
					console.log(page);
					showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
					listCall(page);
				}
			}
			
		});
	}



	function handleKeyDown(event) {
	    // 엔터 키의 keyCode는 13
	    if (event.keyCode === 13) {
	        // 엔터 키를 눌렀을 때 실행할 검색 함수 호출
	        search();
	    }
	}


</script>
</html>