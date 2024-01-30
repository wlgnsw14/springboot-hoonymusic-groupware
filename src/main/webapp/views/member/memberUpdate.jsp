<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>직원정보수정</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>
 img{
    margin-left: 250px;
    margin-top:10px;
    border: 1px solid #025464;
    }
    
    .button-member {
    background-color:  #025464;
    color: #fff; /* 흰색 텍스트 */
    padding: 10px 20px; /* 적절한 패딩 값 */
    border: none;
    border-radius: 4px; /* 둥근 모서리를 위한 값 */
    cursor: pointer;
}

.button-orange:hover {
    background-color: #FF8C00; /* 버튼에 호버될 때 변경될 색상 */
}

body{
	
	font-family: 'Arial', sans-serif;
}
    #memberDetail{margin-left: 20%; height: 100px;}
    #memberDetail .detailInner{position: relative; width: 900px; height:900px; padding:100px 0 0 15%;}
    #memberDetail .detailInner .detailBox{position: relative;}
    #memberDetail .detailInner .detailBox li{float: left;  width:70%; height: 30px; border-radius: 10px; border: 1px solid #025464; box-sizing: border-box;
    text-align: center;}
    #memberDetail .detailInner .detailBox li:nth-child(2n){width: 30%;}
    #memberDetail .detailInner .detailBox li:first-child{width: 100%; height: 250px;}
    #memberDetail .detailInner .detailBox li:last-child{width: 100%; height: 50px; padding:5px;}
</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
<section id="memberDetail">
	<form action="updateDo" id="updateDoForm"  method="post" enctype="multipart/form-data">
	<div class="detailInner">
		<ul class="detailBox">
			<li class="memberImg">
			<div class="imgBox">
			<c:forEach items="${file}" var="photo">
   			    <img id="previewImage${photo}" src="/photo/${photo}" width="140" height="200"/>	
    			<input type="file" name="uploadFile" accept="image/*" onchange="previewImage(this, 'previewImage${photo}')" />
			</c:forEach>			
			</div>
			</li>
			<c:forEach items="${dto}" var="detail">
			<li>ID</li>
			<li>${detail.member_id}</li>
			<li>PW</li>
			<li><input type="text" name="pw" value=""/></li>
			<li>이름</li>
			<li><input type="text" id="member_name" name="name" value="${detail.name}"/></li>
			<li>성별</li>
			<li><input type="text" name="gender" value="${detail.gender}"/></li>
			<li>생년월일</li>
			<li><input type="text" name="birth" value="${detail.birth}"/></li>
			<li>연락처</li>
			<li><input type="text" name="phone" value="${detail.phone}"/></li>
			<li>Email</li>
			<li><input type="text" name="email" value="${detail.email}"/></li>
			<li>주소</li>
			<li><input type="text" name="address" value="${detail.address}"/></li>
			<li>상세주소</li>
			<li><input type="text" name="address_detail" value="${detail.address_detail}"/></li>
			<li>입사일</li>
			<li><input type="text" name="hired" value="${detail.hired}"/></li>
			<li>직급</li>
			<li>
			<select name="member_position">
    			<option value="사원" th:selected="${detail.member_position == '사원'}">사원</option>
    			<option value="대리" th:selected="${detail.member_position == '대리'}">대리</option>
    			<option value="과장" th:selected="${detail.member_position == '과장'}">과장</option>
    			<option value="팀장" th:selected="${detail.member_position == '팀장'}">팀장</option>
    			<option value="부장" th:selected="${detail.member_position == '부장'}">부장</option>
    			<option value="이사" th:selected="${detail.member_position == '이사'}">이사</option>
    			<option value="대표" th:selected="${detail.member_position == '대표'}">대표</option>
			</select>			
            </li>
			<li>부서</li>
			<li>
			<select id="selectedDptno">
            		<c:forEach items="${depart}" var="department">
            		<c:if test="${department.depart_p_no eq 0}">
                	<option value="${department.depart_no}">${department.depart_name}</option>
            		</c:if>
            		</c:forEach>
        		</select>
			</li>
			<li>팀</li>
			<li>
			 <select id="teamSelect" name="depart_name">    
                 <c:forEach items="${depart}" var="department">
            		<c:if test="${department.depart_p_no eq 1}">
                	<option>${department.depart_name}</option>
                	</c:if>  
                	</c:forEach>
                 </select>
			</li>
			<li>연/월차수</li>
			<li><input type="text" name="total_leave" value="${detail.total_leave}"/></li>
			<input type="hidden" id="member_no" name="member_no" value="${detail.member_no}" />
			<li>
			<button class="button-member" onclick="location.href='memberList'">취소</button>
			<button class="button-member" type="button" id="updateBtn">수정</button>
			<button class="button-member" type="button" id="resign">퇴사</button>
			</li>
			</c:forEach>
		</ul>
	</div>
	</form>
</section>
    
 
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
//사진 업로드&미리보기
 function previewImage(input, previewId) {
        var preview = document.getElementById(previewId);     
        // FileReader 객체 생성
        var reader = new FileReader();
        // 파일이 로드되었을 때의 이벤트 핸들러
        reader.onload = function (e) {
            preview.src = e.target.result; // 미리보기 이미지를 새로운 사진으로 업데이트
        };
        // 파일 읽기 시작
        reader.readAsDataURL(input.files[0]);
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
	    if (pw.value === "") {
            alert("비밀번호를 입력해주세요.");
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
	
	document.getElementById('updateBtn').addEventListener('click', function() {
		    var confirmMessage = "수정된 정보를 저장하시겠습니까?";

		    if (confirm(confirmMessage)) {
	
		        document.getElementById('updateDoForm').submit();
		    } else {

		        console.log("수정 취소됨");
		    }
	});
	
	document.getElementById('resign').addEventListener('click', function() {
		 var member_no = $('#member_no').val();		 
		 var name =$('#member_name').val();
		    var confirmMessage = name + "을 정말로 퇴사처리 하시겠습니까?";

		    if (confirm(confirmMessage)) {
		    	window.location.href = '/delMember?member_no=' + member_no;
		    } else {
		        console.log("퇴사 취소됨");
		    }
	});
</script>
</html>