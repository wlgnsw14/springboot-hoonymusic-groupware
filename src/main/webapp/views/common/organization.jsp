<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
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
        body, header, section, footer, div, ul, li, p, a, span, input, textarea{font-family: 'Noto Sans KR', sans-serif; color: #222; font-size: 14px;}
        h1, h2, h3, h4, h5, h6{font-family: 'GmarketSansMedium'; color:#222;}

        #nav{position:fixed; width:15%; height:100%; box-shadow: 0 0 3px 0.5px rgb(228, 228, 228); background-color: #fff; overflow: auto;}
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
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_title ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}

        #bottom_music{position:fixed; width:100%; height:80px; bottom:0; background-color: #eb568e;}
        
        #departModal{
        	display: none;
            position: fixed;
            top: 60%;
            left: 30%;
            transform: translate(-50%, -50%);
            padding: 20px;
            border: 1px solid black;
            background-color: lightgray;
            z-index: 1;
            width: 200px;
            height: 300px;
        }

        #departModal li{
            cursor: pointer;
            margin-bottom: 10px;
        }

        .teamList, .memberList{
            /* display: none; */
            margin-top: 10px;
        }
        
         /* 모달 스타일 */
        #memberModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 40%;
            top: 40%;
            width: 60%;
            height: 20%;
            overflow: auto;
        }

        /* 모달 내용 스타일 */
        #memberInfo {
            background-color: #fefefe;
            margin: 1% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* 닫기 버튼 스타일 */
        .close {
        	display: none;
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
<body>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    <div id="nav">
        <div class="nav_inner">
            <h1 class="logo"><a href="javascript:">Hoony Music</a></h1>
            <ul class="gnb">
                <a href="javascript:"><li class="dep1">게시판</li></a>
                <a href="javascript:"><li class="dep1" data-index="1">쪽지
                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                    </svg></div>
                </li></a>
                <ul data-index="1">
                    <a href="javascript:"><li class="dep2">쪽지 쓰기</li></a>
                    <a href="javascript:"><li class="dep2">받은 쪽지함</li></a>
                    <a href="javascript:"><li class="dep2">보낸 쪽지함</li></a>
                    <a href="javascript:"><li class="dep2">휴지통</li></a>
                </ul>
                <a href="javascript:"><li class="dep1" data-index="2">전자결재
                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                    </svg></div>
                </li></a>
                <ul data-index="2">
                    <a href="javascript:"><li class="dep2">결재 대기 문서</li></a>
                    <a href="javascript:"><li class="dep2">결재 예정 문서</li></a>
                    <a href="javascript:"><li class="dep2">참조 대기 문서</li></a>
                    <a href="javascript:"><li class="dep2" data-index="3">결재 보관함
                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                            </svg></div>
                    </li></a>
                    <ul data-index="3">
                        <a href="javascript:"><li class="dep3">삭제 문서</li></a>
                        <a href="javascript:"><li class="dep3">수정 문서</li></a>
                    </ul>
                </ul>
                <a href="javascript:"><li class="dep1" data-index="4">일정관리
                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                        <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                    </svg></div>
                </li></a>
                <ul data-index="4">
                    <a href="javascript:"><li class="dep2">전사 일정</li></a>
                    <a href="javascript:"><li class="dep2" data-index="5">부서 일정
                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                            </svg></div>
                    </li></a>
                    <ul data-index="5">
                        <a href="javascript:"><li class="dep3">일정 쓰기</li></a>
                        <a href="javascript:"><li class="dep3">일정 예약</li></a>
                    </ul>
                    <a href="javascript:"><li class="dep2" data-index="6">내 일정
                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                            </svg></div>
                    </li></a>
                    <ul data-index="6">
                        <a href="javascript:"><li class="dep3">일정 쓰기</li></a>
                        <a href="javascript:"><li class="dep3">일정 예약</li></a>
                    </ul>
                </ul>
                <a href="javascript:"><li class="dep1">공용자료실</li></a>
                <a href="javascript:"><li class="dep1">시설예약</li></a>
                <a href="javascript:"><li class="dep1">근태관리</li></a>
                <a href="javascript:"><li class="dep1">차량관리</li></a>
                <a href="javascript:"><li class="dep1">복지몰</li></a>
            </ul>
        </div>
        
	    <div>
	        <button onclick="showDepartModal()">조직도</button>
	    </div>
	
	    <!-- 부서 모달 팝업 -->
	    <div id="departModal">
	        <ul id="departments">
	            <!-- 부서 목록이 들어갈 공간 -->
	        </ul>
	    </div>
		
	    <!-- 직원 정보 모달 팝업 -->
	    <div id="memberModal">
	        <div id="memberInfo">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <!-- 직원 정보 -->
	        </div>
	    </div>
    </div>
    

    <!-- -------------------------------------------nav end------------------------------------------ -->
    <!-- -------------------------------------------util start------------------------------------------ -->
    <div id="util">
        <ul class="util_inner">
            <li class="search">
                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#eb568e" d="M10 18a7.952 7.952 0 0 0 4.897-1.688l4.396 4.396l1.414-1.414l-4.396-4.396A7.952 7.952 0 0 0 18 10c0-4.411-3.589-8-8-8s-8 3.589-8 8s3.589 8 8 8m0-14c3.309 0 6 2.691 6 6s-2.691 6-6 6s-6-2.691-6-6s2.691-6 6-6"/>
                </svg>
            </li>
            <li class="Notification">
                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#eb568e" d="M4 8a8 8 0 1 1 16 0v4.697l2 3V20h-5.611a4.502 4.502 0 0 1-8.777 0H2v-4.303l2-3zm5.708 12a2.5 2.5 0 0 0 4.584 0zM12 2a6 6 0 0 0-6 6v5.303l-2 3V18h16v-1.697l-2-3V8a6 6 0 0 0-6-6"/>
                </svg>
            </li>
            <li class="profile"><img src="./img/kang.jpg" alt="231217_강태오"></li>
        </ul>
    </div>
    <!-- -------------------------------------------util end------------------------------------------ -->

    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">

        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
    <script>

// -------------------------------- toggle start ------------------------------------------
    document.addEventListener('DOMContentLoaded', function () {
        var dep1Items = document.querySelectorAll('.gnb .dep1[data-index]');
        var dep2Items = document.querySelectorAll('.gnb .dep2[data-index]');

        dep1Items.forEach(function (item) {
        item.addEventListener('click', function () {
            var dataIndex = item.getAttribute('data-index');
            var targetUl = document.querySelector('.gnb ul[data-index="' + dataIndex + '"]');
            var isActive = targetUl.classList.contains('active');

            if (!isActive) {
                $(targetUl).stop().slideDown(300);
                $(targetUl).addClass('active');
                $(targetUl).siblings('ul').removeClass('active').slideUp(300);
                $(this).addClass('active');
                $(this).find('.arrow>svg').css('transform','rotate(90deg)');
                if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
                    $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
                    $(this).parents('a').siblings().find('li.active').removeClass('active');
                }
            } else {
                $(targetUl).stop().slideUp(300);
                $(targetUl).removeClass('active');
                $(this).find('.arrow>svg').css('transform','rotate(0deg)');
                $(this).removeClass('active');
            }
        });
        });

        dep2Items.forEach(function (item) {
        item.addEventListener('click', function (e) {
            var dataIndex = item.getAttribute('data-index');
            var targetUl = document.querySelector('.gnb ul ul[data-index="' + dataIndex + '"]');
            var isActive = targetUl.classList.contains('active');

            if (!isActive) {
                $(targetUl).stop().slideDown(300);
                $(targetUl).addClass('active');
                $(targetUl).siblings('ul').removeClass('active').slideUp(300);
                $(this).addClass('active');
                $(this).find('.arrow>svg').css('transform','rotate(90deg)');
                if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
                    $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
                    $(this).parents('a').siblings().find('li.active').removeClass('active');
                }
            } else {
                $(targetUl).stop().slideUp(300);
                $(targetUl).removeClass('active');
                $(this).find('.arrow>svg').css('transform','rotate(0deg)');
                $(this).removeClass('active');
            }
        });
        });
    });
//-------------------------------- toggle end ------------------------------------------

/*  
        // 부서 모달 팝업
        function showDepartModal(){
            var departModal = $("#departModal");
            
            if (departModal.css("display") == "none") {
            	departModal.show();
            	
            	getDepartmentList();
			} else {
				departModal.hide();
			}
        }
        
        // 멤버 팝업 띄우기
        function showMemberModal(content){
        	var memberModal = $("#memberModal");
        	var memberInfo = $("#memberInfo");
        	var close = $(".close");
        	
        	if (memberModal.is(":visible")) {
        		memberInfo.empty().append(content);
			} else {
				memberInfo.append(content);
                memberModal.show();
			}
        	
        	close.show();
        }
        
        function getDepartmentList(){
        	// 부서 리스트를 가져오는 AJAX
            $.ajax({
                type: "GET",
                url: "/organization/departments",
                dataType: "JSON",
                success: function(departments){
                    // 부서 목록
                    var departmentList = $("#departments");
                    departmentList.empty();
                    
                    departments.forEach(function(department){
                        var li = $('<li class="departList"><span onclick="toggleDepart(' + department.depart_no + ')">' + department.depart_name + '</span></li>');
                        departmentList.append(li);
                    });
                },
                error: function(e){
                    console.log(e);
                }
            });
        }
        

        // 팀 리스트를 가져오는 AJAX
        function toggleDepart(depart_no){
            $.ajax({
                type: "GET",
                url: "/organization/teams/" + depart_no,
                dataType: "JSON",
                success: function(departments){
                    // 팀 리스트를 생성
                    var teamList = '<ul>';
                    departments.forEach(function(department){
                        teamList += '<li class="teamList"><span onclick="toggleTeam(' + department.depart_no + ')">' + department.depart_name + '</span></li>';
                    });
                    teamList += '</ul>';

                    // 해당 부서의 팀 리스트가 표시될 위치
                    var teamLocation = $(".departList").eq(depart_no - 1);
                    // eq(depart_no - 1)
                    teamLocation.append(teamList);
                    teamLocation.show();

                    $(".memberList").eq(depart_no - 1).hide();
                },
                error: function(e){
                    console.log(e);
                }
            });
        }

        // 해당 팀의 직원 목록을 가져오는 AJAX 
        function toggleTeam(depart_no){
            $.ajax({
                type: "GET",
                url: "/organization/members/" + depart_no,
                dataType: "JSON",
                success: function(members){
                    // 직원 리스트를 생성
                    var memberList = '<ul>';
                    members.forEach(function(member){
                    	console.log("멤버 번호 : "+member.member_no);
                        memberList += '<li class="memberList"><p data-member-no="'+ member.member_no  +'" onclick="getMemberDetail(' + member.member_no + ')">' + member.name + '</p></li>';
                    });
                    memberList += '</ul>';

                    // 해당 팀의 직원 리스트가 표시될 위치
                    var memberLocation  = $(".teamList").eq(depart_no - 5);
                    
                    memberLocation.append(memberList);
                    memberLocation.show();
                },
                error: function(e){
                    console.log(e);
                }
            });
        }
        
        // 직원 정보 표시 팝업
        function getMemberDetail(member_no){
        	$.ajax({
                type: "GET",
                url: "/organization/detail/" + member_no,
                success: function(member) {
                	var popupContent = '<div style="display: flex;">';
                	
                	member.forEach(function(item){
	                	console.log("멤버 정보", item);
                		
	                    // 팝업의 내용을 생성
	                    popupContent += 
	                        '<div style="flex: 1;">' +
	                        '<img src="' + item.profileImg + '" alt="프로필 사진" style="max-width: 100%;">' +
	                        '<p>' + item.name + ' ' + item.member_position + '</p>' +
	                        '</div>' +
	                        '<div style="flex: 1; padding-left: 10px;">' +
	                        '<p><strong>직급:</strong> ' + item.member_position + '</p>' +
	                        '<p><strong>연락처:</strong> ' + item.phone + '</p>' +
	                        '<p><strong>이메일:</strong> ' + item.email + '</p>' +
	                        '</div>' +
	                        '</div>';
                	});

                    // 팝업 생성 및 표시
                    showMemberModal(popupContent);
                },
                error: function(e) {
                    console.log(e);
                }
        	});
        }
        
     	// 팝업 닫기 함수
        function closeModal() {
            var modal = $("#memberModal");
            var close = $(".close");
            modal.hide();
            close.hide();
        }
        */
        
        
        var selecEl = null;
        
        // 부서 모달 팝업
        function showDepartModal(){
            var departModal = $("#departModal");
            
            if (departModal.css("display") == "none") {
            	departModal.show();
            	
            	getDepartmentList();
			} else {
				departModal.hide();
			}
        }
        
        // 멤버 팝업 띄우기
        function showMemberModal(content){
        	var memberModal = $("#memberModal");
        	var memberInfo = $("#memberInfo");
        	var close = $(".close");
        	
        	if (memberModal.is(":visible")) {
        		memberInfo.empty().append(content);
			} else {
				memberInfo.append(content);
                memberModal.show();
			}
        	
        	close.show();
        }
        
        function getDepartmentList(){
        	// 부서 리스트를 가져오는 AJAX
            $.ajax({
                type: "GET",
                url: "/organization/departments",
                dataType: "JSON",
                success: function(departments){
                    // 부서 목록
                    var departmentList = $("#departments");
                    departmentList.empty();
                    
                    departments.forEach(function(department){
                        var li = $('<li class="departList"><span onclick="toggleDepart(' + department.depart_no + ')">' + department.depart_name + '</span></li>');
                        departmentList.append(li);
                    });
                },
                error: function(e){
                    console.log(e);
                }
            });
        }
        

        // 팀 리스트를 가져오는 AJAX
        function toggleDepart(depart_no){
            // 팀 리스트
            var teamList = $("#teamListUl" + depart_no);
            // 해당 부서의 팀 리스트가 표시될 위치
            var teamLocation = $(".departList").eq(depart_no - 1);

            if(teamList.length){
                teamList.toggle();
            } else{
                $.ajax({
                    type: "GET",
                    url: "/organization/teams/" + depart_no,
                    dataType: "JSON",
                    success: function(departments){
                        teamList = $('<ul id="teamListUl'+depart_no+'" class="teamListUl"></ul>');

                        departments.forEach(function(department){
                            var teamItem = $('<li class="teamList"><span onclick="toggleTeam(' + department.depart_no + ')">' + department.depart_name + '</span></li>');
                            teamList.append(teamItem);
                        });
                        
                        teamLocation.append(teamList);
                        teamLocation.slideDown(300);
    
                        $(".memberList").eq(depart_no - 1).slideUp(300);
                    },
                    error: function(e){
                        console.log(e);
                    }
                });
            }

            toggleElement(teamLocation);

        }

        // 해당 팀의 직원 목록을 가져오는 AJAX 
        function toggleTeam(depart_no){
            // 직원 리스트
            var memberList = $("#memberListUl" + depart_no);
            // 해당 팀의 직원 리스트가 표시될 위치
            var memberLocation  = $(".teamList").eq(depart_no - 5);

            if(memberList.length){
                memberList.toggle();
            } else{
                $.ajax({
                    type: "GET",
                    url: "/organization/members/" + depart_no,
                    dataType: "JSON",
                    success: function(members){
                        memberList = $('<ul id="memberListUl'+ depart_no +'" class="memberListUl"></ul>');
                        members.forEach(function(member){
                            var memberItem = $('<li class="memberList"><p data-member-no="'+ member.member_no  +'" onclick="getMemberDetail(' + member.member_no + ')">' + member.name + '</p></li>');
                            memberList.append(memberItem);
                        });
                        
                        memberLocation.append(memberList);
                        memberLocation.slideDown(300);
                    },
                    error: function(e){
                        console.log(e);
                    }
                });
            }

            toggleElement(memberLocation);
        }

        function toggleElement(element){
            // 클릭한 요소에 토글 스타일 적용 및 이전에 선택된 요소의 스타일 제거
            if(selecEl){
                selecEl.removeClass("active");
            }
            selecEl = element;
            element.addClass("active");
        }
        
        // 직원 정보 표시 팝업
        function getMemberDetail(member_no){
        	$.ajax({
                type: "GET",
                url: "/organization/detail/" + member_no,
                success: function(member) {
                	var popupContent = '<div style="display: flex;">';
                	console.log(member);
                	
                	member.list.forEach(function(item){
	                    // 팝업의 내용을 생성
	                    popupContent += 
	                        '<div style="flex: 1;">' +
	                        '<img src="' + item.file_newname + '" alt="프로필 사진" style="max-width: 100%;">' +
	                        '<p>' + item.name + ' ' + item.member_position + '</p>' +
	                        '</div>' +
	                        '<div style="flex: 1; padding-left: 10px;">' +
	                        '<p><strong>직급:</strong> ' + item.member_position + '</p>' +
	                        '<p><strong>연락처:</strong> ' + item.phone + '</p>' +
	                        '<p><strong>이메일:</strong> ' + item.email + '</p>' +
	                        '</div>' +
	                        '</div>';
                	});

                    // 팝업 생성 및 표시
                    showMemberModal(popupContent);
                },
                error: function(e) {
                    console.log(e);
                }
        	});
        }
        
     	// 팝업 닫기 함수
        function closeModal() {
            var modal = $("#memberModal");
            var close = $(".close");
            modal.hide();
            close.hide();
        }
    </script>
</html>