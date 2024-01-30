<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Hoony Music</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');
	
	        @font-face {
	            font-family: 'EF_jejudoldam';
	            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_jejudoldam.woff2') format('woff2');
	            font-weight: normal;
	            font-style: normal;
	        }
	        
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
	        body, header, section, footer, div, ul, li, p, a, span, input, textarea, h2, h3, h4, h5, h6{font-family: 'Noto Sans KR', sans-serif; color: #222; font-size: 14px;}
	        h1{font-family: 'EF_jejudoldam'; color:#222; font-size: 42px; color:#333;}
			
			
			#login{position: relative;}
	        #login .left_area{position: fixed; top:0; left: 0; width: 45%; height: 100%; background-color: #025464; color:#eee;}
	        #login .left_area h1{position: relative; left: 30%; top: 50%; font-size: 58px; transform: translate(-10%, -70%); line-height: 72px;}
	        #login .right_area{position: fixed; top:0; right:0; width: 65%; height: 100%; background-color: #dedede; border-top-left-radius: 60px; overflow: hidden;}
	        #login .right_area .login_inner{position: relative; background-color: #fff; width: 500px; height: 420px; left: 50%; top: 50%; transform: translate(-50%, -50%); padding: 50px 30px 0 30px; border-radius: 10px; box-shadow: 0,0,1,1,0.3; bottom: -500px;}
	        #login .right_area .login_inner input[type="text"], #login .right_area .login_inner input[type="password"]{width: 97%; height: 40px; border-radius: 1px; border: 1px solid #ccc; padding: 5px 0 5px 3%;}
	        #login .right_area .login_inner input[type="text"]:active, #login .right_area .login_inner input[type="password"]:active{box-shadow: 0,0,0,1,0.3;}
	        #login .right_area .login_inner input[type="text"]{margin-bottom: 25px;}
	        #login .right_area .login_inner input[type="password"]{margin-bottom: 40px;}
	        #login .right_area .login_inner .login_title{font-size: 28px; text-align: center; margin-bottom: 50px;}
	        #login .right_area .login_inner .login_box{position:relative;}
	        #login .right_area .login_inner .login_box .info{position: relative; font-size: 16px; font-weight: 500; margin-bottom: 5px;}
	        #login .right_area .login_inner #login_btn{width: 100%; height: 50px; background-color: #025464; color: #fff; font-weight: 500; font-size: 16px; text-align: center; line-height: 50px; letter-spacing: 2px; cursor: pointer;}
	        #login .right_area .login_inner .id_save{margin-left: 3px; font-weight: 500;}
	        #login .right_area .login_inner #login_btn{margin-top: 10px;}
	        #login .right_area .login_inner #login_btn:hover{background-color: #0a6577; transition: 0.3s;}
	        #login .right_area .login_inner #remember-id{cursor: pointer;}
	        #login .right_area img{width: 100%; opacity: 0.1; position:fixed; left: 35%; top: 0;}
		</style>
	</head>
	
	<body>
		 <section id="login">
			<div class="left_area">
				<h1 onclick="fn_loginPage()">HOONY<br>MUSIC</h1>
			</div>	
			
			<div class="right_area">
				<form action="${path}/login" method="post" id="login-form">
					<img src="${path}/resources/img/common/bgImg.jpg" alt="배경이미지">
					<div class="login_inner">
						<h4 class="login_title">Login</h4>
						<div class="login_box">
							<p class="login_id info">아이디</p>
							<input type="text" name="member_id" class="login-input" id="id" value="${cookie.userid.value}" placeholder="아이디를 입력해 주세요.">
							
							<p class="login_pw info">비밀번호</p>
							<input type="password" name="pw" class="login-input" id="pw" placeholder="비밀번호를 입력해 주세요.">
						</div>
						<input type="checkbox" id="remember-id">
						<span class="id_save">아이디 저장하기</span>
						<button id="login_btn" onclick="fn_login()">로그인</button>
					</div>
				</form>
			</div>
		</section>
	</body>
	
	<script>
		$(document).ready(function(){
			//저장된 아이디
			var id=getCookie("rememberId");
			$("#id").val(id);
			if($("#id").val()!=""){
				$("#remember-id").attr("checked",true);
			}
			
			//아이디 저장 체크박스
			$("#remember-id").change(function(){
				if($("#remember-id").is(":checked")){
					setCookie("rememberId", $("#id").val(), 7);
				}else{
					deleteCookie("rememberId");
				}
			});
			
			//아이디 저장이 선택된 상태로 아이디 입력시
			$("#id").keyup(function(){
				if($("#remember-id").is(":checked")){
					setCookie("rememberId", $("#id").val());
				}
			});

			// 쿠키저장
			function setCookie(cookieName, value, day){
				var date = new Date();
				date.setDate(date.getDate() + day);	// 오늘부터 7일
				
				var cookieValue = escape(value) + ((day==null) ? "" : "; expires=" + date.toUTCString());	// 날짜를 포함한 값 지정
				document.cookie = cookieName + "=" + cookieValue;	// 쿠키 생성
			}

			// 쿠키 값 불러오기
			function getCookie(cookieName){
				cookieName = cookieName + "=";

				var cookieData = document.cookie;	// 쿠키 값
				var start = cookieData.indexOf(cookieName);	// 아이디의 시작 인덱스
				var cookieValue = "";

				if(start != -1){ //	값이 존재하는 경우
					start += cookieName.length;

					var end = cookieData.indexOf(";", start);	// 아이디 끊어낼 기준

					if(end == -1) end = cookieData.length;	// -14이 나오면 데이터 길이를 기준으로 함
					cookieValue = cookieData.substring(start, end);
				}
				return unescape(cookieValue);	// 아이디 반환
			}

			// 쿠키 삭제
			function deleteCookie(cookieName){
				var expireData = new Date();
				expireData.setDate(expireData.getDate() - 1);	// 지정된 날짜에서 -1
				document.cookie = cookieName + "=" + "; expires=" + expireData.toUTCString();	// 해당 쿠키 기간 만료로 삭제
			}
		});
		
		// 값 확인 후 로그인 실행
		function fn_login(){
		console.log($("#id").val());
			if($("#id").val()!=""&&$("#pw").val()!=""){
				$("#login-form").submit();
			}
		}
	
		//로고 클릭 시 로그인 페이지
		function fn_loginPage(){
			location.href="${path}/loginPage";
		}
	</script>
</html>