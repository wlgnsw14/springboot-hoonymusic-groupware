<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>계정 생성</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7f33f996b442a5d86588bc9173489c3&libraries=services" type="text/javascript"></script>
<style>

    body {

        margin: 0;
        padding: 0;
    }

    #memberBox {
    	margin-left:600px;
    	padding-top:120px;
    	padding-bottom:60px;
        max-width: 900px;
        height:900px;
  
        
        border-radius: 5px;
        position:relative;
    }

    .registTable{
        width: 100%;
        height:100%;
        border-collapse: collapse;
        border-radius: 10px;
        border:1px solid #025464;
   	    font-family: 'Helvetica', Arial, sans-serif;
        
    }

    th, td {
        padding: 10px;
        border: 1px solid #025464;
        text-align: center;
        

    }

    input[type="file"] {
        display: none;
        margin-left:250px;
    }

    .phoneBox, .emailBox {
        width: 80px;
    }

    .registBtn {
        cursor: pointer;
        border-radius: 3px;background-color:025464;color:white;padding: 5 10;border:none;
    }

    .registBtn:hover {
        background-color: #45a049;
    }



    .registInput {
        width: 50%;
        padding: 8px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
        border-radius: 4px;
    }

    input[type="radio"] {
        margin-right: 5px;
    }

    .phoneBox{width:50px;}
   
    .selDate{width:150px;}
	
	.registImg{height:220px;}
	
	.img{margin-left:250px;}
	
	.btnPosition{text-align: center;}

</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
<div id="memberBox">
<form action="join" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
     <table class="registTable">
     	<tr>
             <th class="registImg" colspan="2">
        		 <img id="idImage" class="img" src="#" alt="ID Image Preview" style="max-width: 140px; max-height: 200px;"/>
   			 </th>   
     	</tr>
   		<tr>
   			<th colspan="2" class="fileBtn">
       			 <input type="file" name="uploadFile" accept="image/*" onchange="previewImage(this, 'idImage')"/>
   			 </th>  	
   		</tr>
         <tr>
             <th>PW</th>
             <th>
                 <input type="password" class="registInput" name="pw" readonly value="1111"/>
             </th>
         </tr>
         <tr>
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" class="registInput" name="name"/>
             </th>
         </tr>
         <tr>
             <th>성별</th>
             <th>
                 <input type="radio" name="gender" value="남" 
                     checked/>남
                 <input type="radio" name="gender" value="여"/>여
             </th>
         </tr>
         <tr>
             <th>생년월일</th>
             <th>
                 <select id="birthYearSelect" class="selDate" name="birthY">
                 </select>년
                 <select id="birthMonthSelect" class="selDate" name="birthM">
                 </select>월
                 <select id="birthDaySelect" class="selDate" name="birthD">
                 </select>일
             </th>
         </tr>
         <tr>
             <th>연락처</th>
             <th>
                 <input type="text" class="phoneBox" name="phone1" readonly value="010"/>-
                 <input type="text" class="phoneBox" name="phone2"/>-
                 <input type="text" class="phoneBox" name="phone3" />                        
             </th>
         </tr>
         <tr>
             <th>이메일</th>
             <th>
                 <input type="text" class="emailBox" name="email1"/>@
                 <select name="email2" class="selDate">
                 	<option>gmail.com</option>
                 	<option>naver.com</option>
                 	<option>hanmail.com</option>
                 </select>
             </th>
         </tr>
         <tr>
			<th>주소</th>
			<th>
					<input type="text" class="radio-value-detail" id="addr_kakao" name="address" readonly>
					<button id="addr" class="registBtn" onclick="showMap(event)">주소찾기</button>	
			</th>		
		</tr>
			<tr>
				<th>상세 주소</th>
				<th><input type="text" class="registInput" name="address_detail" placeholder="상세주소를 입력해 주세요."></th>
			</tr>
         <tr>
             <th>입사일</th>
             <th>
                 <select id="yearSelect" name="hiredY" class="selDate">
                 </select>년
                 <select id="monthSelect" name="hiredM" class="selDate">
                 </select>월
                 <select id="daySelect" name="hiredD" class="selDate">
                 </select>일
             </th>
         </tr>
         <tr>
          <th>직급</th>
             <th>
                 <select name="member_position" class="selDate">
                 	<option>사원</option>
                 	<option>대리</option>
                 	<option>과장</option>
                 	<option>팀장</option>
                 	<option>부장</option>
                 	<option>이사</option>
                 	<option>대표</option>
                 </select>
             </th>
         </tr>
         <tr>
          <th>부서</th>
             <th>
                 <select id="selectedDptno" class="selDate">
            		<c:forEach items="${depart}" var="department">
            		<c:if test="${department.depart_p_no eq 0}">
                	<option value="${department.depart_no}">${department.depart_name}</option>
            		</c:if>
            		</c:forEach>
        		</select>
             </th>
         </tr>
         <tr>
          <th>팀</th>
             <th>
                 <select id="teamSelect" name="depart_name" class="selDate">    
                 <c:forEach items="${depart}" var="department">
            		<c:if test="${department.depart_p_no eq 1}">
                	<option>${department.depart_name}</option>
                	</c:if>  
                	</c:forEach>
                 </select>
             </th>
         </tr>
         <tr>
             <th colspan="2" class="btnPosition">
             	 <button type="button" class="registBtn" onclick="cancelForm()">취소</button>
             	 <button type="submit" class="registBtn">생성</button>
          
             </th>
         </tr>
     </table>
 </form>
 </div>
</body>
<script>
var depart_no=1;

$('#selectedDptno').change(function(){
	console.log($(this).val());
	depart_no = $(this).val();
	
	 $.ajax({
	        type: "POST",
	        url: "teamList",
	        data: { 'depart_no': depart_no },
	        success: function(data) {
	        	console.log(data);

	            var content =''; 
	            data.team.forEach(function(item, idx){
	            	content+='<option>'+item.depart_name+'</option>';	
	            });
	            $('#teamSelect').empty();
	        	$('#teamSelect').append(content);

	        }
	    });
});
//주소API id="addr_kakao"
function showMap(event){
	event.preventDefault();
    //카카오 지도 발생
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
            document.getElementById("addr_kakao").value = data.address; // 주소 넣기              
            console.log('도로명주소 : ' + data.roadAddress);
            document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱                
        }
    }).open();
}

// 취소 -> 페이지 이동
function cancelForm() {
    window.location.href = '/';
}

//현재 년도, 월, 일 가져오기
var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = currentDate.getMonth() + 1; // JavaScript에서 월은 0부터 시작하므로 +1 해줍니다.
var currentDay = currentDate.getDate();

//생년월일 -> 년

var birthYearSelect = document.getElementById("birthYearSelect");

for (var i = currentYear; i >= currentYear - 50; i--) {
    var yearOption = document.createElement("option");
    yearOption.value = i;
    yearOption.text = i;
    birthYearSelect.add(yearOption);
}

// 옵션을 추가할 셀렉트 엘리먼트에 접근
var yearSelect = document.getElementById("yearSelect");
var monthSelect = document.getElementById("monthSelect");
var daySelect = document.getElementById("daySelect");
var birthMonthSelect = document.getElementById("birthMonthSelect");
var birthDaySelect = document.getElementById("birthDaySelect");

// 현재 년도만 옵션으로 추가
var yearOption = document.createElement("option");
yearOption.value = currentYear;
yearOption.text = currentYear;
yearSelect.add(yearOption);

// 1월부터 12월까지 월 옵션 추가
for (var i = 1; i <= 12; i++) {
    var monthOption = document.createElement("option");
    monthOption.value = i < 10 ? "0" + i : "" + i; // 한 자리 수일 경우 앞에 0 추가
    monthOption.text = i < 10 ? "0" + i : "" + i;
    monthSelect.add(monthOption);
 
    var birthMonthOption = document.createElement("option");
    birthMonthOption.value = i < 10 ? "0" + i : "" + i;
    birthMonthOption.text = i < 10 ? "0" + i : "" + i;
    birthMonthSelect.add(birthMonthOption);
}

// 1일부터 31일까지 일 옵션 추가
for (var i = 1; i <= 31; i++) {
    var dayOption = document.createElement("option");
    dayOption.value = i < 10 ? "0" + i : "" + i; // 한 자리 수일 경우 앞에 0 추가
    dayOption.text = i < 10 ? "0" + i : "" + i;
    daySelect.add(dayOption);
    
    var birthDayOption = document.createElement("option");
    birthDayOption.value = i < 10 ? "0" + i : "" + i;
    birthDayOption.text = i < 10 ? "0" + i : "" + i;
    birthDaySelect.add(birthDayOption);
}

// 현재 년, 월, 일을 선택한 상태로 설정
yearSelect.value = currentYear;
monthSelect.value = currentMonth < 10 ? "0" + currentMonth : "" + currentMonth;
birthMonthSelect.value = currentMonth < 10 ? "0" + currentMonth : "" + currentMonth;
daySelect.value = currentDay < 10 ? "0" + currentDay : "" + currentDay;
birthDaySelect.value = currentDay < 10 ? "0" + currentDay : "" + currentDay;

// 사진 업로드&미리보기
function previewImage(input, imageId) {
    var fileInput = input;
    var imageElement = document.getElementById(imageId);

    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            imageElement.src = e.target.result;
        };

        reader.readAsDataURL(fileInput.files[0]);
    }
}

function validateForm() {
    // 폼 요소들을 가져옵니다.
    var uploadFile = document.getElementsByName("uploadFile")[0];
    var pw = document.getElementsByName("pw")[0];
    var name = document.getElementsByName("name")[0];
    var phone2 = document.getElementsByName("phone2")[0];
    var phone3 = document.getElementsByName("phone3")[0];
    var email1 = document.getElementsByName("email1")[0];
    var address = document.getElementsByName("address")[0];
    var addressDetail = document.getElementsByName("address_detail")[0];

    // 값이 비어있는지 확인합니다.
    if (!uploadFile.files[0]) {
        alert("이미지를 업로드해주세요.");
        return false;
    }
    if (name.value === "") {
        alert("이름을 입력해주세요.");
        return false;
    }
    if (!isValidString(name.value)) {
        alert("올바른 이름을 입력해주세요.");
        return false;
    }
    if (phone2.value === "" || phone3.value === "") {
        alert("전화번호를 모두 입력해주세요.");
        return false;
    }
    if (!isValidPhoneNumber(phone2.value) || !isValidPhoneNumber(phone3.value)) {
        alert("올바른 전화번호를 입력해주세요. (숫자 4자리씩)");
        return false;
    }
    if (email1.value === "") {
        alert("이메일 주소를 입력해주세요.");
        return false;
    }
    if (!isValidEmail(email1.value)) {
        alert("올바른 이메일 주소를 입력해주세요. (특수문자와 한글 불가)");
        return false;
    }
    if (address.value === "") {
        alert("주소를 입력해주세요.");
        return false;
    }
    if (addressDetail.value === "") {
        alert("상세 주소를 입력해주세요.");
        return false;
    }
    return true;
}
// 문자열이 유효한지 확인하는 함수
function isValidString(str) {
    return /^[가-힣a-zA-Z]+$/.test(str);
}
function isValidPhoneNumber(number) {
    return /^\d{4}$/.test(number);
}
function isValidEmail(email) {
    return /^[a-zA-Z0-9]+$/.test(email);
}
</script>
</html>