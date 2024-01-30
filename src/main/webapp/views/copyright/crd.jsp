<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@ include file="/views/nav.jsp" %>
<style>
	#common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_title ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 45%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 45%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
		        
        
        
        
        
        
        
        
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        #back {
            background-color:  #007aff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        #back {
			border-radius: 3px; background-color:025464; color:white; padding: 5 10; border:none;
		}
    </style>
<body>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    
    <!-- -------------------------------------------nav end------------------------------------------ -->
    <!-- -------------------------------------------util start------------------------------------------ -->
    
    <!-- -------------------------------------------util end------------------------------------------ -->
    <!-- -------------------------------------------list_form start------------------------------------------ -->
     <section id="common_list_form">
        <h2 class="big_title">저작권상세보기</h2>
        <h3 class="sub_title" style="margin-left: 80px;">저작권정보</h3>

        <div class="list_form">
        <table style="margin-left:auto;margin-right:auto;">
        <tr style="border: solid 1px black; border-collapse: collapse;">
        	<td style="border: solid 1px black; border-collapse: collapse; ">
        	저작권번호
        	${data.cr_no}
        	</td>
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	음원명
        	${data.cr_namae}
        	</td>
        </tr>
        <tr style="border: solid 1px black; border-collapse: collapse;">
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	요금
        	${data.cr_price} 원
        	</td>
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	아티스트명
        	${data.cr_name}
        	</td>
        </tr>
        <tr style="border: solid 1px black; border-collapse: collapse;">
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	담당자
        	${data.cr_member}
        	</td>
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	비고
        	</td>
        </tr>        
        
        </table>
        <button id="back" style="color: white; margin-left: 170px;" >뒤로가기</button>
        </div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">

        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
<script>

// -------------------------------- toggle start ------------------------------------------

//-------------------------------- toggle end ------------------------------------------
$("#back").on("click", function(){
	
	location.href="copyrightlist";
	
});

</script>
