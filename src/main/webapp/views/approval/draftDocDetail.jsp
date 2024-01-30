<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hoony Music</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<style>
	/* approval form */
        #approval_write{position:relative; margin-left: 15%;}
        #approval_write .top_area{position:fixed; top: 0; left: 15%; width:100%; padding: 30px 50px 22px 50px; border-bottom: 1px solid #ccc; background-color: #fff; z-index: 9997;}
        #approval_write .top_area h2{font-size: 24px; font-weight:500; padding-bottom:20px;}
        #approval_write .top_area h2 span{color: #999;}
        #approval_write .top_area .approval_btn{position:relative;}
        #approval_write .top_area .approval_btn li{position:relative; float: left; margin-left: 15px;}
        #approval_write .top_area .approval_btn li:nth-child(3){word-spacing: -1px;}
        #approval_write .top_area .approval_btn li:first-child{margin-left: 0; font-weight: 500;}
        #approval_write .top_area .approval_btn li svg{position:relative; top:3px;}
        #approval_write .top_area .approval_btn li a:hover{background-color: #efefef;}
        #approval_write .bottom_area{position:relative; padding-top: 130px; height: 1230px;}
        #approval_write .bottom_area .left_area{position:fixed; width: 300px; height: 100%; border-right: 1px solid #ccc; box-sizing: border-box; z-index: 9997; background-color: #fff;}
        #approval_write .bottom_area .left_area .btn_box{position:relative; height: 110px; margin-bottom: 20px;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn{position:relative; left: 50px; top: 30px; width: 200px; height: 50px; border-radius: 5px; border: 1px solid #bbb; text-align: center; line-height:45px; font-size: 16px; box-sizing: border-box; cursor: pointer;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn:hover{border: 1px solid #333; transition: 0.2s;}
        #approval_write .bottom_area .left_area .sortation_box{width: 100%; padding-top: 20px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn{padding-left: 50px; height: 31px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li{float: left; margin-left: 15px; text-align: center; cursor: pointer; padding: 0 7px 10px 7px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li.on{border-bottom: 2px solid #eb568e; font-weight: 700;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li:first-child{margin-left: 0;}
        #approval_write .bottom_area .left_area .sortation_box .list_box{border-top: 1px solid #ccc; height: 500px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box>li{height: 100px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box>li.on{background-color: rgba(248, 174, 226, 0.2); border-left: 3px solid #eb568e;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box{padding: 20px 50px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box>div{float: left;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box{width:30%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box .img_box{width: 44px; height:44px; border-radius: 22px; overflow: hidden;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box .img_box img{width:100%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box{width:70%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .member_name{font-weight: 500;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .depart_name{font-size: 12px; color: #999; font-weight: 500;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .sortation{font-size: 12px; color: #999; font-weight: 500;}
        #approval_write .bottom_area .right_area{position: relative; height:1080px; margin-left: 300px; margin: 30px 180px 0 400px; border: 5px solid #e8e8e8; box-sizing: border-box; overflow: auto;}
        #approval_write .bottom_area .right_area .doc_form{width: 800px; height:790px; margin: 30px;}
        #approval_write .bottom_area .right_area .file_form{margin-top: 50px;}
        #approval_write .bottom_area .right_area .file_form #input_file{display: none;}
        #approval_write .bottom_area .right_area .file_form #file_btn{background-color: #fff; width: 53px;  border: 1px solid #ddd; cursor: pointer; padding: 7px; margin-bottom: 10px;}
        #approval_write .bottom_area .right_area .file_form #file_btn:hover{transition: 0.2s; border: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_top{position:relative; height: 300px;}
        #approval_write .bottom_area .right_area .form_top .form_name{font-size: 36px; margin-bottom: 30px; text-align: center;}
        #approval_write .bottom_area .right_area .form_top>div{float: left;}
        #approval_write .bottom_area .right_area .form_top .top_left{width:40%;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul{width: 310px;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li{float: left; width: 30%; border-bottom: 1px solid #333; border-left: 1px solid #333; box-sizing: border-box; padding: 5px;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li input{border: none;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li:nth-child(2n){width: 70%; border-right: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li:nth-child(1),#approval_write .bottom_area .right_area .form_top .top_left>ul>li:nth-child(2){border-top: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_top .top_left>ul>li.head{text-align: center; font-weight: 500; background-color: #dedede;}
        #approval_write .bottom_area .right_area .form_top .top_right{position:relative; width: 60%;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner{position:absolute; right:0;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner>div{float: left;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner>.draftsman{margin-right: 5px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap{position:relative;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap>div{float: left;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .left_wrap{position:relative; width: 25px; height: 125px; background-color: #dedede; text-align: center; border: 1px solid #333; box-sizing: border-box;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .left_wrap>p{position:relative; top: 40px; font-weight: 500;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap{width:80px; height: 125px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap>div{border-bottom: 1px solid #333; border-right: 1px solid #333; box-sizing: border-box; text-align: center; font-size: 13px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_rank{height: 30px; border-top: 1px solid #333; line-height: 27px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name{position: relative; height: 65px; line-height: 62px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name .stamp{position: absolute; top: 3px; left: 50%; transform: translateX(-50%);}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name.appr_ok{line-height: 100px; font-weight: 500;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name.appr_no{line-height: 60px; font-weight: 500;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name.appr_no span{position: absolute; left: 50%; top: 20px; transform: translateX(-50%); color: #d63737; font-size: 12px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_date{height: 30px; line-height: 27px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .appr_no_date{color: #d63737;}
        #approval_write .bottom_area .right_area .form_bottom{position:relative;}
        #approval_write .bottom_area .right_area .form_bottom>div{position:relative; height: 100px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul{position: relative; width: 800px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li{position:relative; float: left; width:30%; border-bottom: 1px solid #333; border-right: 1px solid #333; box-sizing: border-box; padding: 5px; height: 36px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.head{width: 18%; text-align: center; font-weight: 500; background-color: #dedede;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.bor_top{border-top: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.bor_left{border-left: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(2){width: 24%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(4){width: 40%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(6){width: 82%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(7){width: 100%; height: auto; padding: 15px; min-height: 400px; margin-bottom: 30px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li>input, #approval_write .bottom_area .right_area .form_bottom>div>ul>li>select{width: 100%; height: 100%; box-sizing: border-box; border: 1px solid #ccc;;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li #testDatepicker{padding-left: 26px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li svg{position:absolute; left: 9px; top: 9px;}
        .file-list {position:relative; padding: 10px;}
        .file-list .filebox{position: relative; }
        .file-list .filebox:last-child{padding-bottom: 30px;}
        .file-list .filebox p {font-size: 13px; margin-top: 8px; display: inline-block;}
        .file-list .filebox .down_btn{border: 1px solid #ddd; box-sizing: border-box; font-size: 11px; padding: 2px; margin-left: 5px; color: #666;}
        .file-list .filebox .down_btn:hover{border: 1px solid #999;}
        .observer{display: none;}
        .input_style{width: 60px; padding-right: 10px; text-align: right;}
		
        /* approve box css */
        #approve{display: none;}
        #return{display: none;}
        #withdrawl{display: none;}
        .approve_light_box{position:fixed; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.5); z-index: 9999;}
        .approve_light_box .approve_box{position: absolute; left:50%; top: 22%; background-color: #fff; width:500px; height:45%; transform: translateX(-50%); border-radius: 10px;}
        .approve_light_box .approve_box .approve_box_inner{position:relative; padding:40px; height: 330px;}
        .approve_light_box .approve_box .approve_box_inner h3{font-size: 18px; font-weight: 500; padding-bottom: 40px;}
        .approve_light_box .approve_box .approve_box_inner .cancel_box{position:absolute; right:20px; top:20px; width:32px; height:32px; cursor: pointer;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap{position:relative; width: 100%; height: 300px;}
        .approve_light_box .approve_box .approver_box_inner .inner_wrap h5{font-size: 16px; font-weight: 500; padding-bottom: 10px;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap div{box-sizing: border-box;}

        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box{position: relative;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box ul{float: left;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_title{width: 20%; padding-right: 10%;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content{width: 70%;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box ul li:first-child{padding-bottom: 25px;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content li:last-child{height: 150px;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content li textarea{width: 100%; height: 100%; resize: none; border: 1px solid #ccc; padding: 5px; color: #222;}
        .approve_light_box .approve_box .approve_box_inner .inner_wrap .info_box .info_content li .appr_list li{padding-bottom: 10px;}

        .approve_light_box .approve_box .approve_box_inner .btn_area{position:relative; bottom: -92%;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner{position: absolute; right:0; bottom: 0;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner button{width:50px; height:35px; box-sizing: border-box; cursor: pointer;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner button:first-child{background-color: #eb568e; border: none; color: #fff;}
        .approve_light_box .approve_box .approve_box_inner .btn_area .btn_inner button:last-child{border: 1px solid #ccc;}
</style>
</head>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------form start------------------------------------------ -->
    <section id="approval_write">
        <div class="top_area">
            <h2 class="title">${info.approval_title} <span>in 업무기안</span></h2>
            <ul class="approval_btn">
                <c:choose>
					<c:when test="${(info.document_state eq 0 && info.approval_state eq 0 && docAuth eq 1) || (info.document_state eq 0 && info.approval_state eq 1 && docAuth eq 2) || (info.document_state eq 0 && info.approval_state eq 2 && docAuth eq 3)}">
						<li><a href="javascript:" onclick="approve_box_go(${info.approval_no})"><svg width="15" height="15" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="m7.5 9l-3 .54L5 6.5L10.73.79a1 1 0 0 1 1.42 0l1.06 1.06a1 1 0 0 1 0 1.42Z"/><path d="M12 9.5v3a1 1 0 0 1-1 1H1.5a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h3"/></g></svg> 결재</a></li>
                		<li><a href="javascript:" onclick="return_box_go(${info.approval_no})"><svg width="18" height="18" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M754.752 480H160a32 32 0 1 0 0 64h594.752L521.344 777.344a32 32 0 0 0 45.312 45.312l288-288a32 32 0 0 0 0-45.312l-288-288a32 32 0 1 0-45.312 45.312z"/></svg> 반려</a></li>
                		<li><a href="javascript:" onclick="list_go()"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg> 목록</a></li>
					</c:when>
					<c:when test="${info.approval_state eq 0 && docAuth eq 0}">
						<li><a href="javascript:" onclick="withdrawl_box_go(${info.approval_no})"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.95 11a8 8 0 1 0-.5 4m.5 5v-5h-5"/></svg> 회수</a></li>
						<li><a href="javascript:" onclick="list_go()"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg> 목록</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:" onclick="list_go()"><svg width="18" height="18" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg> 목록</a></li>
					</c:otherwise>
				</c:choose>
            </ul>
        </div>
        <div class="bottom_area">
            <div class="left_area">
                <div class="sortation_box">
                    <ul class="list_btn">
                        <li class="on">결재선</li>
                        <li>참조자</li>
                    </ul>
                    <ul class="list_box approver">
                    <li>
                        <div class="info_box">
                             <div class="left_box">
                                  <div class="img_box">
                                      <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
                                  </div>
                              </div>
                              <div class="right_box">
                                  <ul class="approver_info">
                                      <li class="member_name"><a href="javascript:">${info.name}&nbsp;${info.member_position}</a></li>
                                      <li class="depart_name">${info.depart_name}</li>
                                      <li class="sortation">기안 상신</li>
                                 </ul>
                             </div>
                         </div>
                     </li>
                     <c:forEach items="${apprInfo}" var="appr" >
                     	<c:choose>
							<c:when test="${(appr.approval_order eq 1 && appr.approval_state eq 0)}">
								 <li class="on">
							</c:when>
							<c:when test="${(appr.approval_order eq 2 && appr.approval_state eq 1)}">
								 <li class="on">
							</c:when>
							<c:when test="${(appr.approval_order eq 3 && appr.approval_state eq 2)}">
								 <li class="on">
							</c:when>
							<c:otherwise>
								<li>
							</c:otherwise>
						</c:choose>
                        	<div class="info_box">
	                               <div class="left_box">
	                                   <div class="img_box">
	                                       <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
	                                   </div>
	                               </div>
	                               <div class="right_box">
	                                   <ul class="approver_info">
	                                       <li class="member_name"><a href="javascript:">${appr.name}&nbsp;${appr.member_position}</a></li>
	                                       <li class="depart_name">${appr.depart_name}지원팀</li>
	                                       <c:choose>
												<c:when test="${appr.processing_result eq 1}">
													 <li class="sortation">결재 승인</li>
												</c:when>
												<c:when test="${appr.processing_result eq 2}">
													 <li class="sortation">결재 반려</li>
												</c:when>
												<c:otherwise>
													<li class="sortation">결재 대기</li>
												</c:otherwise>
											</c:choose>
	                                   </ul>
	                               </div>
	                           </div>
                        	</li>
                       </c:forEach>
                    </ul>
                    <ul class="list_box observer">
                    	<c:forEach items="${refInfo}" var="ref">
                    		<li>
	                            <div class="info_box">
	                                <div class="left_box">
	                                    <div class="img_box">
	                                        <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
	                                    </div>
	                                </div>
	                                <div class="right_box">
	                                    <ul class="approver_info">
	                                        <li class="member_name"><a href="javascript:">${ref.name}&nbsp;${ref.member_position}</a></li>
	                                        <li class="depart_name">${ref.depart_name}</li>
	                                        <li class="sortation">참조</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </li>
                    	</c:forEach>
                    </ul>
                </div>
            </div>
            <div class="right_area">
                <form id="form_info" class="doc_form" action="approvalWrite" method="post" enctype="multipart/form-data">
                <input type="hidden" name="form_no">
                <input type="hidden" name="observer" class="observer1">
                <input type="hidden" name="observer" class="observer2">
                    <div class="form_top">
                        <h4 class="form_name">업 무 기 안</h4>
                        <div class="top_left">
                            <ul>
                                <li class="head">기안자</li>
                                <li>${info.name}</li>
                                <li class="head">소속</li>
                                <li>${info.depart_name}</li>
                                <li class="head">기안일</li>
                                <li>${info.approval_start}</li>
                                <li class="head">문서번호</li>
                                <c:choose>
								    <c:when test="${info.document_state eq 1}">
								        <li>${info.approval_end}${info.approval_no}</li>
								    </c:when>
								    <c:otherwise>
								        <li><input type="text" value="" readonly/></li>
								    </c:otherwise>
								</c:choose>
                            </ul>
                        </div>
                        <div class="top_right">
                            <div class="right_inner">
                                <div class="draftsman sign_wrap">
                                    <div class="left_wrap">
                                        <p>신<br>청</p>
                                    </div>
                                    <div class="right_wrap">
                                        <div class="sign_rank">${info.member_position}</div>
                                        <div class="sign_name appr_ok">${info.name}
                                            <img class="stamp" src="/resources/img/common/stamp.png" alt="승인">
                                        </div>
                                        <div class="sign_date">${info.approval_start}</div>
                                    </div>
                                </div>
                                <div class="approver sign_wrap">
                                    <div class="left_wrap">
                                        <p>승<br>인</p>
                                    </div>
                                    <c:forEach items="${apprInfo}" var="appr">
                                    	<div class="right_wrap">
	                                        <div class="sign_rank">${appr.member_position}</div>
	                                        <c:choose>
											    <c:when test="${appr.processing_result eq 1}">
											    	<div class="sign_name appr_ok">${appr.name}
			                                            <img class="stamp" src="/resources/img/common/stamp.png" alt="승인">
			                                        </div>
											    </c:when>
											    <c:when test="${appr.processing_result eq 2}">
											    	<div class="sign_name appr_no">${appr.name}</div>
											    </c:when>
											    <c:otherwise>
											        <div class="sign_name">${appr.name}</div>
											    </c:otherwise>
											</c:choose>
	                                        <c:choose>
											    <c:when test="${appr.processing_date ne null}">
											        <div class="sign_date">${appr.processing_date}</div>
											    </c:when>
											    <c:otherwise>
											        <div class="sign_date"></div>
											    </c:otherwise>
											</c:choose>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_bottom">
                        <div class="bottom_inner">
                            <ul>
                                <li class="head bor_top bor_left">시행일자</li>
                                <li class="bor_top">${info.approval_start}</li>
                                <li class="head bor_top">협조팀명</li>
                                <li class="bor_top">${info.depart_name}</li>
                                <li class="head bor_left">제목</li>
                                <li>${info.approval_title}</li>
                                <li class="bor_left">${info.approval_content}</li>
                            </ul>
                        </div>
                        <div class="file_form">
		                    <div class="file-list">
		                    	<c:forEach items="${fileInfo}" var="file">
		                    		<div class="filebox"><p class="name">${file.file_oriname}</p> <a href="download.do?newName=${file.file_newname}&oriName=${file.file_oriname}" class="down_btn">다운로드</a></div>
		                    	</c:forEach>
		                    </div>
		                </div>
                    </div>
                </form>
            </div>
        </div>
        
    </section>
    <!-- -------------------------------------------form end------------------------------------------ -->

    <!-- -------------------------------------------approve_box start------------------------------------------ -->
    <div id="approve" class="approve_light_box">
        <div class="approve_box">
            <div class="approve_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>결재하기</h3>
                <div class="inner_wrap">
                    <div class="info_box">
                        <form id="approve_do" action="approve.do" method="post">
                        	<input type="hidden" name="approval_no">
                            <ul class="info_title">
                                <li>결재문서명</li>
                                <li>결재의견</li>
                            </ul>
                            <ul class="info_content">
                                <li>asdasd</li>
                                <li><textarea placeholder="의견을 작성해 주세요." name="approveReason"></textarea></li>
                            </ul>
                        </form>
                    </div>
                    <div class="btn_area">
                        <div class="btn_inner">
                            <button onclick="approve_go()">승인</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------approve_box end------------------------------------------ -->

    <!-- -------------------------------------------return_box start------------------------------------------ -->
    <div id="return" class="approve_light_box">
        <div class="approve_box">
            <div class="approve_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>반려하기</h3>
                <div class="inner_wrap">
                    <div class="info_box">
                        <form id="return_do" action="return.do" method="post">
                        	<input type="hidden" name="approval_no">
                            <ul class="info_title">
                                <li>결재문서명</li>
                                <li>반려결재의견</li>
                            </ul>
                            <ul class="info_content">
                                <li>asdasd</li>
                                <li><textarea placeholder="의견을 작성해 주세요." name="returnReason"></textarea></li>
                            </ul>
                        </form>
                    </div>
                    <div class="btn_area">
                        <div class="btn_inner">
                            <button onclick="return_go()">반려</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------return_box end------------------------------------------ -->


    <!-- -------------------------------------------withdrawl_box start------------------------------------------ -->
    <div id="withdrawl" class="approve_light_box">
        <div class="approve_box">
            <div class="approve_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>회수하기</h3>
                <div class="inner_wrap">
                    <div class="info_box">
                        <form id="withdrawl_do" action="withdrawl.do" method="post">
                        	<input type="hidden" name="approval_no">
                            <ul class="info_title">
                                <li>결재문서명</li>
                                <li>결재자</li>
                            </ul>
                            <ul class="info_content">
                                <li>asdasd</li>
                                <li>
                                    <ul class="appr_list">
                                    	<c:forEach items="${apprInfo}" var="appr">
                                    		<li>${appr.name}&nbsp;${appr.member_position}<br/>${appr.depart_name}</li>
                                    	</c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </form>
                    </div>
                    <div class="btn_area">
                        <div class="btn_inner">
                            <button onclick="withdrawl_go()">확인</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------withdrawl_box end------------------------------------------ -->
</body>
<script>

// ------------------------------------ approval_detail start ------------------------------------

function approve_box_go(num){
    $('#approve').fadeIn(500);
    $('input[name="approval_no"]').val(num);
}

function approve_go(){
    if($('textarea[name="approveReason"]').val().length == 0){
        alert("의견을 작성해 주세요.");
    }else{
        $('#approve_do').submit();
    }
}

function return_box_go(num){
    $('#return').fadeIn(500);
    $('input[name="approval_no"]').val(num);
}

function return_go(){
    if($('textarea[name="returnReason"]').val().length == 0){
        alert("의견을 작성해 주세요.");
    }else{
        $('#return_do').submit();
    }
}

function withdrawl_box_go(num){
    $('#withdrawl').fadeIn(500);
    $('input[name="approval_no"]').val(num);
}

function withdrawl_go(){
    $('#withdrawl_do').submit();
}

function list_go(){
	window.history.back();
}

$('.cancel_box').on('click',function(){
    $('#approve').fadeOut(500);
    $('#return').fadeOut(500);
    $('#withdrawl').fadeOut(500);
});

$('.cancel_btn').on('click',function(){
    $('#approve').fadeOut(500);
    $('#return').fadeOut(500);
    $('#withdrawl').fadeOut(500);
    
});


// ------------------------------------ approval_detail end ------------------------------------


// ----------------------------------- sortation tabs start -------------------------------------------
function tabs(index){
            $('.list_btn>li[data-index='+index+']').addClass('on');
            $('.list_btn>li[data-index!='+index+']').removeClass('on');
            $('.list_box[data-index='+index+']').stop().fadeIn(1000);
            $('.list_box[data-index!='+index+']').css('display','none');
        }

        $('.list_box').each(function(index){
            $(this).attr('data-index',index);
        })

        $('.list_btn>li').each(function(index){
            $(this).attr('data-index',index);
            $(this).click(function(){
                tabs(index);
            })
        })
// ----------------------------------- sortation tabs end -------------------------------------------

</script>
</html>