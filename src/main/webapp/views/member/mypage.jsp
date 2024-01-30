<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
   <head>
      <meta charset="UTF-8">
      <title>HoonyMusic</title>
      <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7f33f996b442a5d86588bc9173489c3&libraries=services" type="text/javascript"></script>
   </head>
   <style>
           #common_list_form{padding-left:15%;}
           #common_list_form .big_title{padding: 50px 50px;}
           #common_list_form .list_form{position:relative;}
           
           #profile-input{display: none;}
           
           #mypage-profile{
            display: flex;
            justify-content: center;
            height: 280px;
            width: 230px;
            border-radius: 10px;
            margin: 10px;
            margin-left: 50px;
            margin-top: 10px;
         }
         
         #profile-form{
            margin-left: 70px;
            margin-bottom: 10px;
            margin-top: 20px;
         }
         
         #profile-form
         
         #mypage-name{
            font-weight: bolder;
            margin-left: 10px;
         }
         
         #member-update-form{
            border: 1px solid lightgray;
            border-radius: 3px;
            margin: 10px;
         }
         
         #member-update-form>span{
            padding: 10px;
         }
         
         #member-update-form>input[type="text"]{
            margin: 10px; 0px;
            height: 30px;
            width: 500px;
         }
         
         .mypage-update-div{
            pause: 10px;
         }
         
         .mypage-update-div>div{
            display: flex;
         }
         
         .mypage-update>span{
            width: 50px;
            padding: 10px;
         }
         
         .mypage-update>input{
            height: 30px;
            width: 500px;
            margin: 10px 0px;
         }
         
         input[type="reset"], input[type="button"], #imgModify, #totalModify{
            height: 30px;
            width: 50px;
            border-radius: 3px;
              background-color:025464;
              color:white;
              padding: 5 10;
              border:none;
              margin: 10px;
         }
         
         .right-container>span{
            position: relative;
            left: -2px;
            margin: 10px;
         }
         
         
         .infor{
            margin: 10px;
         }
         
         .infor input[type="text"]{
            position: relative;
            width: 500px;
            height: 30px;
            margin: 10px 0px;
            margin-left: 15px;
         }
         
         .infor span{
            padding: 10px;
         }
         
         #totalBtn{
            position: relative;
            left: 500px;
         }

       </style>
   <body>
      <%@ include file="/views/nav.jsp" %>
       <!-- -------------------------------------------list_form start------------------------------------------ -->
       <section id="common_list_form">
           <h2 class="big_title">프로필</h2>
           <div class="list_form">
                    <section class="max1920px">
            <section class="mypage-section">
               <div class="main-section section-shadow casrd profile-info">
                  <div class="right-container">
                     <img src="/photo/${loginMember.file_newname}" id="mypage-profile" alt="mypage-profile" onclick="fn_updateProfile()"  width="300" height="300">
                     <form action="${path}/member/profile" method="post" enctype="multipart/form-data" id="profile-form">
                        <input type="file" name="profileImg" id="profile-input" accept="image" required>
      
                        <div>
                           <input type="reset" value="취소" onclick="fn_resetProfile()">
                           <button id = "imgModify" onclick="fn_profileSubmit()">수정</button>
                        </div>
                     </form>
                     <span><strong id="mypage-name">${loginMember.name}</strong> 님</span>
                  </div>
               </div>
   
               <div class="mypage-update-div">
                  <div class="main-section section-shadow card">
                     <div class="right-container">
                        <form action="${path}/member/info" method="post" id="member-update-form">
                           <span>아이디</span>
                           <input type="text" value="${loginMember.member_id}" disabled>
   
                           <div class="mypage-update">
                              <span>비밀번호</span>
                              <input type="password" name="newPw" id="new-pw" placeholder="새로운 비밀번호를 입력해주세요." required>
                           </div>
                           
                           <div class="infor">
                              <span>이름</span>
                              <input type="text" value="${loginMember.name}" disabled>
                           </div>
                           
                           <div class="infor">
                              <span>부서</span>
                              <input type="text" value="${loginMember.depart_p_name}" disabled>
                           </div>
                           
                           <div class="infor">
                              <span>팀</span>
                              <input type="text" value="${loginMember.depart_name}" disabled>
                           </div>
                           
                           <div class="infor">
                              <span>직급</span>
                              <input type="text" value="${loginMember.member_position}" disabled>
                           </div>
   
                           <div class="mypage-update">
                              <span>연락처</span>
                              <input type="tel" name="phone" id="phone" value="${loginMember.phone}" required>
                              <p>* 전화번호 입력 시 하이픈(-) 제외하고 입력하세요.</p>
                           </div>
   
                           <div class="mypage-update">
                              <span>주소 검색</span>
                              <input type="text" name="mainAddress" id="mainAddress" value="${loginMember.address}" required>
                              <input type="button" onclick="fn_searchAddr(event)" value="검색">
                           </div>
   
                           <div class="mypage-update">
                              <span>상세 주소</span>
                              <input type="text" name="detailAddress" id="detailAddress">
                           </div>
                           
                           <span>입사일</span>
                           <input type="text" id="hireDate" value="${loginMember.hired}" disabled>
   
                           <div class="mypage-update">
                              <span>이메일</span>
                              <input type="email" name="email" id="email" value="${loginMember.email}" required>
                           </div>
   
                           <span>생년월일</span>
                           <input type="text" value="${loginMember.birth}" disabled>
   
                           <div id="totalBtn">
                              <input type="button" value="취소" onclick="cancleSignup()">
                              <button id="totalModify" onclick="fn_updateMember()">수정</button>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </section>
         </section>
           </div>
       </section>
       <!-- -------------------------------------------list_form end------------------------------------------ -->
   </body>
   <script>
      
      function cancleSignup(){
         if (confirm("수정을 취소하시겠습니까?")) {
            location.href="/main";
         } else {}
      }
      
      // 프로필 사진 변경
      function fn_updateProfile(){
         $("#profile-input").click();
         $("#profile-input").change(()=>{
            const fileName = $("#profile-input")[0].files[0].name;
            console.log(fileName);
            const fileSrc = URL.createObjectURL($("#profile-input")[0].files[0]);
            console.log(fileSrc);
            $("#mypage-profile").attr("src", fileSrc);
         });
      }
      
      // 프로필 취소
      function fn_resetProfile(){
         $("#profile-input").val('');
         $("#mypage-profile").attr("src", "${path}/upload/profile/${loginMember.profileImg}");
      }
      
      // 프로필 전송
      function fn_profileSubmit(){
         if($("#profile-input").val() != ''){
            $("#profile-form").submit();
            console.log("수정 폼 제출 성공!");
         } else{
            alert("변경할 이미지를 업로드 하세요!");
            fn_updateProfile();
         }
      }
      
      //주소API id="mainAddress"
      function fn_searchAddr(event) {
         event.preventDefault();
          //카카오 지도 발생
         new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            document.getElementById("mainAddress").value = data.address; // 주소 넣기              
            console.log('도로명주소 : ' + data.roadAddress);
            document.querySelector("input[name=detailAddress]").focus(); //상세입력 포커싱                
            }
         }).open();
      }
      
      // 개인 정보 수정
      function fn_updateMember(){
         const regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
         const newPw = $("#new-pw").val();
         const phone = $("#phone").val();
         const mainAddress = $("#mainAddress").val();
         const email = $("#email").val();

         if(newPw==null||newPw==""){
            alert("비밀번호를 입력해주세요!");
            $("#new-pw").focus();
         } else if(!regPwd.test(newPw)){ 
            alert("비밀번호는 영문자, 숫자, 특수문자를 조합해 8글자 이상이여야합니다.");
            $("#new-pw").val('');
            $("#new-pw").focus();
            return;
         } else if(phone==null||phone==""){
            alert("전화번호를 입력해주세요!");
            $("#phone").focus();
         } else if(mainAddress==null||mainAddress==""){
            alert("주소를 입력해주세요!");
            $("#mainAddress").focus();
         } else if(email==null||email==""){
            alert("이메일을 입력해주세요!");
            $("#email").focus();
         } else{
            $("#member-update-form").submit();
         }
      }
   </script>
</html>