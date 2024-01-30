<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	#common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_title ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 10%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 10%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul li:hover{background-color: #eee;}
		        
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
        
        
        /* 팝업 */
        #pop{
			width: 300px; height: 400px; background: white; color:#fff;
			position: absolute; top: 50%; left: 50%; text-align: center;
			border:2px solid #000; display: none;
		}
		
		#popno{
			width: 300px; height: 400px; background: white; color:#fff;
			position: absolute; top: 50%; left: 50%; text-align: center;
			border:2px solid #000; display: none;
		}
		
		button {
			border-radius: 3px; background-color:025464; color:white; padding: 5 10; border:none;
		}
    </style>
<body>
<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    
    <!-- -------------------------------------------util end------------------------------------------ -->
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
 	
 	
 	<h1 style="margin-bottom: 50px; padding-top: 100px;">시설 예약하기</h1>
 	
 	<table style="margin-left: 300px;">
 		<tr>
 			<td>
 			

 	
 		
 		<table style="margin-bottom: 50px;">
 		
 		<tr>
 			<td>
 			
 				<select id="rv">
 					<option > 공연장 </option>
 					<option > 회의장 </option>
 				</select>
 			
 			</td>
 			<td>
 			<h4 style="margin-left: 60px; " >시작날짜</h4>
 			<input type="date" id="start" style="margin-left: 60px; "/>
 			</td>
 		</tr>
 		 		<tr>
 			<td>
 			
 			
 			</td>
 			<td>
 			
 			<h4 style="margin-left: 60px; " >종료날짜</h4>
 			<input type="date" id="end" style="margin-left: 60px; "/>
 			</td>
 		</tr>
 		<tr>
 		
 			<td colspan="2">
 			
 				<textarea rows="" cols="2" style="width: 250px; height: 350px; resize: none;" id="content" placeholder="예약 사유를 적어주세요."></textarea>
 			
 			</td>
 		</tr>
 		
 		</table>
 		<button id="enter" style="color:white;">신청</button>
 			
 			
 			</td>
 			<td>
 			
 				
 		
 		<div class="list_form">
 		<section id="common_list_form">
 		<h3 class="sub_title">승인대기중</h3>
            <ul>
                <li class="list_title" id="list1">
                    <ul>
                        <li>no.</li>
                        <li>예약명</li>
                        <li>시작날짜</li>
                        <li>종료날짜</li>
                    </ul>
                </li>
				
				<li class="list_content" id="list_1">
				
				</li>

             </ul>
             
		</section>
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align:justify; margin-left: 220px;">
					<ul class="pagination" id="getpagination"></ul>
				</nav>
			</div>
		</div>
        </div>
 				
 				
 		<div class="list_form">
 		<section id="common_list_form">
 				<h3 class="sub_title">예약완료</h3>
            <ul>
                <li class="list_title" id="list1">
                    <ul>
                        <li>no.</li>
                        <li>예약명</li>
                        <li>시작날짜</li>
                        <li>종료날짜</li>
                    </ul>
                </li>
				
				<li class="list_content" id="list_2">
				
				</li>

             </ul>
             
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align:justify; margin-left: 40px;">
					<ul class="pagination" id="getpagination2"></ul>
				</nav>
			</div>
		</div>
		</section>
        </div>
		

		

 		<c:if test="${login!=null || depart_no==12}">
			
 		<div class="list_form">
 		<section id="common_list_form">
		<h3 class="sub_title">등록대기중</h3>
            <ul>
                <li class="list_title" id="list3">
                    <ul>
                        <li>no.</li>
                        <li>예약명</li>
                        <li>시작날짜</li>
                        <li>종료날짜</li>
                    </ul>
                </li>
				
				<li class="list_content" id="list_3">
				
				</li>

             </ul>
             
		</section>
        </div>
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align:justify; margin-left: 220px;">
					<ul class="pagination" id="getpagination3"></ul>
				</nav>
			</div>
		</div>
			
		</c:if>
 			
 			</td>
 		</tr>
 	
 	</table>
 	
 	<div>
 	

 	
 	</div>
 	
 	
 	<div id="pop" style="z-index: 999;">
 		<div>
 			<div id="popname"></div>
 		</div>
 		<div style="margin-top: 10px ; margin-bottom: 10px;">
 		시작날짜<div id="popstart" ></div>
 		</div>
 		<div style="margin-top: 10px ; margin-bottom: 10px;">
 		종료날짜<div id="popend" ></div>
 		</div>
 		<div style="height: 200px;">
 			<div id="popcont"></div>
 		
 		
 		</div>
 		<div>
 			<div id="close" style=" cursor:pointer; width: 100px; margin: auto;">close</div>
 		</div>
 	</div>
 	
 	<div id="popno" style="z-index: 999; height: 460px;" >
 	<div><h3>반려</h3></div>
 		<div>
 		
 			<textarea rows="" cols="" id="popcontent"  style="width: 200px; height: 350px; resize: none" placeholder="반려사유를 작성해주세요."></textarea>
 			
 		
 		
 		</div>
 		
 		<button id="register" style="z-index: 999; color: black;">반려</button>
 		<div>
 			<div id="closeno" style=" cursor:pointer; width: 100px; margin: auto;">close</div>
 		</div>
 		
 	</div>
 
 
    </section>
</body>
<script>

// -------------------------------- toggle start ------------------------------------------

//-------------------------------- toggle end ------------------------------------------
//--------------------------------등록-------------------------------------------------


//-------------------------------search---------------------------------------------

var search = "";
var showPage=1;//페이징을 위한 변수
var showPage2=1;
var showPage3=1;
var searchtag ="";



//--------------------------------ajax list------------------------------------------



call(showPage);
call2(showPage2);
call3(showPage3);


function call(showPage){
   $.ajax({
        type : 'POST',
        url : '/reservnogetlist',
        data:{
        	
        	'pagePerNum':5
        	,'page':showPage
        	
        },
        dataType:'json',
        success:function(data){
        	//alert("성공");
        	
        	paging1(data);
        	
            console.log(data);
            var content ='';
            var all = 0;

            data.list.forEach(function(item,idx){
                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
                content += '<ul>';
                content += '<li>'+item.res_no+'</li>';
                content += '<li ><a style="cursor:pointer" onClick="reservDetail('+item.res_no+')">'+item.res_name+'</a></li>';
                content += '<li >'+item.res_start+'</li>';
                content += '<li >'+item.res_end+'</li>';
                content += '</ul>';
            });
            $('#list_1').empty();
            $('#list_1').append(content);

        },error:function(e){
            console.log(e);
            alert("실패");
        }
    });

}   
   

   function paging1(list){
	   console.log("list : ", list);
		$('#getpagination').twbsPagination({
			startPage:list.currPage,//보여줄 페이지
			totalPages:list.pages,//총페이지수(총갯수/페이지당 보여줄 게시물수) : 서버에서 계산해서 가져와야 한다.
			visiblePages:5,//[1][2][3][4][5]
			onPageClick:function(e,page){//번호 클릭시 실행할 내용
			
					
					if(showPage!=page){
						

						console.log("con1 : "+page);
						showPage = page;//클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
						
						call(page);
						
			}

			}
			
		});
   }
   
   
   
   
   
   function call2(showPage2){
	   $.ajax({
	        type : 'POST',
	        url : '/reservlist',
	        data:{
	        	
	        	'pagePerNum':5
	        	,'page':showPage2
	        	
	        },
	        dataType:'json',
	        success:function(data){
	        	//alert("성공");
	        	
	        	paging2(data);
	        	
	            console.log(data);
	            var content ='';
	            var all = 0;

	            data.list.forEach(function(item,idx){
	                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
	            	content += '<ul>';
	            	content += '<li>'+item.res_no+'</li>';
	            	content += '<li ><a style="cursor:pointer" onClick="reservDetail('+item.res_no+')">'+item.res_name+'</a></li>';
	                content += '<li >'+item.res_start+'</li>';
	                content += '<li >'+item.res_end+'</li>';
	                content += '</ul>';
	            });
	            $('#list_2').empty();
	            $('#list_2').append(content);

	        },error:function(e){
	            console.log(e);
	            alert("실패");
	        }
	    });

	}   
	   

	   function paging2(list){
		   console.log("list : ", list);
			$('#getpagination2').twbsPagination({
				startPage:list.currPage,//보여줄 페이지
				totalPages:list.pages,//총페이지수(총갯수/페이지당 보여줄 게시물수) : 서버에서 계산해서 가져와야 한다.
				visiblePages:5,//[1][2][3][4][5]
				onPageClick:function(e,page){//번호 클릭시 실행할 내용
				
						
						if(showPage2!=page){
							

							console.log("con1 : "+page);
							showPage2 = page;//클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
							
							call2(page);
							
				}

				}
				
			});
	   }
	//-------------------------------어드민----------------------------------
	
	
	
	function call3(showPage3){
	   $.ajax({
	        type : 'POST',
	        url : '/reservAdmin',
	        data:{
	        	
	        	'pagePerNum':5
	        	,'page':showPage3
	        	
	        },
	        dataType:'json',
	        success:function(data){
	        	//alert("성공");
	        	
	        	paging3(data);
	        	
	            console.log(data);
	            var content ='';
	            var all = 0;

	            data.list.forEach(function(item,idx){
	                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
	            	content += '<ul>';
	            	content += '<li>'+item.res_no+'</li>';
	            	content += '<li ><a style="cursor:pointer" onClick="reservDetail('+item.res_no+')">'+item.res_name+'</a></li>';
	            	content += '<li >'+item.res_start+'</li>';
	                content += '<li >'+item.res_end+'</li>';
	                content += '<button style="color:white;" onClick="location.href='+"'reservOk?res_no="+item.res_no+"'"+'">승인</button>';
	                content += '<button style="color:white;" onClick="reservNo('+item.res_no+')">반려</button>';
	                
	                content += '</ul>';
	            });
	            $('#list_3').empty();
	            $('#list_3').append(content);

	        },error:function(e){
	            console.log(e);
	            alert("실패");
	        }
	    });

	}   
	   

	   function paging3(list){
		   console.log("list : ", list);
			$('#getpagination3').twbsPagination({
				startPage:list.currPage,//보여줄 페이지
				totalPages:list.pages,//총페이지수(총갯수/페이지당 보여줄 게시물수) : 서버에서 계산해서 가져와야 한다.
				visiblePages:5,//[1][2][3][4][5]
				onPageClick:function(e,page){//번호 클릭시 실행할 내용
				
						
						if(showPage3!=page){
							

							console.log("con1 : "+page);
							showPage3 = page;//클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
							
							call3(page);
							
				}

				}
				
			});
	   }
	
	
	
	
   //-------------------------------팝업------------------------------------------
   
   
   function reservDetail(res_no){
	   
	   console.log(res_no);
	   $(document).ready(function(){
				$('#pop').show();
		});
	   
	   $.ajax({
	        type : 'POST',
	        url : '/reservdetail',
	        data:{
	        	"res_no" : res_no
	        },
	        dataType:'json',
	        success:function(data){
	        	var content = "";
	        	
	        	//alert("성공");
	        	console.log(data);
				console.log(data[0].res_name);
				document.getElementById("popname").innerText=data[0].res_name;
				document.getElementById("popstart").innerText=data[0].res_start;
				document.getElementById("popend").innerText=data[0].res_end;
				document.getElementById("popcont").innerText=data[0].res_content;
				
				

	        },error:function(e){
	            console.log(e);
	            alert("실패");
	        }
	    });
	   
	   
	   
	   
	   
	   $(document).ready(function(){
			$('#close').click(function(){
				$('#pop').hide();
			});
		});
   }

   
   
function reservNo(res_no){
	   
	   console.log(res_no);
	   $(document).ready(function(){
				$('#popno').show();
		});
	   
		$("#register").on("click", function(){
		var content = $('#popcontent').val();
			console.log(content);
	   var con = $("#popcontent").val().length;
	   
	   if(con<2){
			   if (!confirm("반려 사유가 적혀있지 않습니다. 정말로 반려하시겠습니까?")) {
		            alert("취소되었습니다.");
		        } else {
		            alert("반려되었습니다.");
				   $.ajax({
				        type : 'POST',
				        url : '/reservNo',
				        data:{
				        	"res_no" : res_no
				        	,"res_content" : content
				        },
				        dataType:'text',
				        success:function(data){
				        	var content = "";
				        	
				        	alert("성공");
				        	location.href="/reserve";
							
				        },error:function(e){
				            console.log(e);
				            alert("실패");
				        }
				    });
		        }
		   
	   }else{
	   
		   if (!confirm("정말로 반려하시겠습니까?")) {
	            alert("취소되었습니다.");
	        } else {
	            alert("반려되었습니다.");
			   $.ajax({
			        type : 'POST',
			        url : '/reservNo',
			        data:{
			        	"res_no" : res_no
			        	,"res_content" : content
			        },
			        dataType:'text',
			        success:function(data){
			        	var content = "";
			        	
			        	//alert("성공");
			        	location.href="/reserve";
						
			        },error:function(e){
			            console.log(e);
			            alert("실패");
			        }
			    });
	        
	        
	        }
		   
		   
	   
		   
	   }
	   
	   
	   
		});
	   $(document).ready(function(){
			$('#closeno').click(function(){
				$('#popno').hide();
			});
		});
}


	

$("#enter").on("click", function(){
	
	start = $("#start").val();
	
	var start = $("#start").val().length;
	var end = $("#end").val().length;
	var content = $("#content").val().length;
	if(start < 2 ){
		alert("시작날짜를 지정해주세요");
	    $("#start").focus();
	}else if(end < 2 ){
		alert("시작날짜를 지정해주세요");
	    $("#end").focus();
	}else if(content <2){
		
		
	        if (!confirm("예약사유가 안적혀있습니다. 정말로 시설을 예약하시겠습니까?")) {
	        	
	            alert("취소되었습니다.");
	            
	        } else {
	        	
	            alert("예약되었습니다.");
	            
	            var start = $("#start").val();
				var end = $("#end").val();
				var text = $("#content").val();
				var rv = $("#rv option:selected").val();
				console.log($("#rv option:selected").val());
				location.href="reserveget?start="+start+"&end="+end+"&text="+text+"&rv="+rv;
				
	        }
	    
			
	}else{
		
		if (!confirm("정말로 시설을 예약하시겠습니까?")) {
        	
            alert("취소되었습니다.");
            
        } else {
        	
            alert("예약되었습니다.");
            
            var start = $("#start").val();
			var end = $("#end").val();
			var text = $("#content").val();
			var rv = $("#rv option:selected").val();
			console.log($("#rv option:selected").val());
			location.href="reserveget?start="+start+"&end="+end+"&text="+text+"&rv="+rv;
			
        }
		
	}
	
	console.log(search);
	
});




//--------------예약날짜 제한----------------



// 시작날짜(min 속성)
var sDate = new Date();
// 종료날짜(max 속성)
var eDate = new Date();

sDate.setDate(sDate.getDate());     // 시작날짜의 날짜를 +1일 한다.
let minStr = sDate.toISOString().split('T')[0];
$("#start").prop("min", minStr);

$("#end").prop("max", sDate+30);
//결과 (현재날짜 : 2023-02-14)

</script>
