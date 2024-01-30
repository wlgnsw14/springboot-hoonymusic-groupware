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
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 10%; padding-left: 45px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 15%; padding-left:50px;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 25%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 25%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 25%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 60px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box; height: 100px; line-height:93px;}
        #common_list_form .list_form .list_content ul li:first-child{width: 10%; padding-left:50px;}
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 25%;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 25%;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
        #common_list_form .list_form .list_content ul li:last-child{width: 25%;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
       
        h3{padding-left: 4%; padding-bottom: 2%;}
        .artBtn{margin: 0px 0px 20px 50px; background-color: white;border: 1px solid black;padding: 5px;}
        
    </style>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title"><img width="142" height="99" src="https://cdnimg.melon.co.kr/resource/image/web/common/logo_melon142x99.png" alt="Melon"></h2>
        <h2 class="sub_title">실시간 멜론 차트</h2>
        <h3>${date}&nbsp;&nbsp;&nbsp;${time}</h3>
        <input type="button" value="소속 아티스트만 보기" class="artBtn" onclick="musicArtistCall()"/>
        <input type="button" value="전체 차트 보기" class="artBtn" onclick="musicChartCall('')"/>
        <div class="list_form">
            <ul>
                <li class="list_title">
					<ul>
                        <li>순위</li>
                        <li>-</li>
                        <li>곡 정보</li>
                        <li>아티스트</li>
                        <li>앨범</li>
                    </ul>
                </li>
                <li class="list_content" id="musicChart">

                </li>
            </ul>
        </div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
</body>
<script>
//------------------------------- music chart start ------------------------------------------
var artNames = [];
musicChartCall(artNames);

function musicChartCall(artNames){	
	$.ajax({
		type:'get',
		url:'musicChartCall',
		data:{}, 
		dataType:'JSON',
		success: function(data){
			console.log(data);
			// data의 artName 이 artNames 에 포함된 리스트만 그리기
			if(artNames!=''){
				console.log('비어있지 않아!');
				console.log(artNames);
				drawList(data, artNames);
			}else{
				console.log('비어있어!');
				drawList(data, []);	
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list, artNames){
	console.log(list);
	var content='';
	list.forEach(function(item,idx){ 
		if (artNames.length === 0 || artNames.some(function (artName) 
				{ return item.artName.includes(artName); })) { // artNames 에 있는 artName 만 가져오기 
			content+='<ul>';
			content+='<li>'+item.rank+'</li>'; 
			content+='<li><a href="https://www.melon.com/album/detail.htm?albumId='+item.albNo+'"><img src="'+item.imgSrc+'" width="90" height="90"/></a></li>';
			content+='<li>'+item.songName+'</li>';
			content+='<li id="artName">'+item.artName+'</li>';
			content+='<li>'+item.albName+'</li>';
			content+='</ul>';
		}
	});
	$('#musicChart').empty();
	$('#musicChart').append(content);
}
//------------------------------- music chart end ------------------------------------------


//------------------------------- 소속 아티스트 불러오기 start ------------------------------------------
function musicArtistCall(){
	// ${item.artName} 만 가져와서 배열에 담기 
	var artNameArray = [];
	var artNameElements = document.querySelectorAll('#musicChart li#artName');
 	artNameArray = Array.from(artNameElements).map(function(element) {
	    return element.textContent.trim(); // 앞, 뒤 공백 제거 
	}); 
	console.log(artNameArray); 
	
 	$.ajax({
		type:'post',
		url:'musicArtistCall',
		data:JSON.stringify({artNameArray:artNameArray}), // JSON 형태로 데이터 보내기 
		contentType:'application/json',
		dataType:'JSON',
		success: function(data){
			//console.log(data);
			// 전역 변수 artNames 배열에 누적하기 
			artNames = artNames.concat(data);
			//console.log(artNames); // ['Red Velvet', '세븐틴'] 같이 출력됨 
			musicChartCall(artNames);
		},
		error:function(e){
			console.log(e);
		}
	}); 
}
//-------------------------------- 소속 아티스트 불러오기 end ------------------------------------------

</script>
</html>