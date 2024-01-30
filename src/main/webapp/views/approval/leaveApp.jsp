<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hoony Music</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" type="text/css"/>
<link rel="stylesheet" href="/resources/richtexteditor/rte_theme_default.css"/>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/richtexteditor/rte.js"></script>
<script type="text/javascript" src='/resources/richtexteditor/plugins/all_plugins.js'></script>
<style>
	/* approval form */
        #approval_write{position:relative; margin-left: 15%;}
        #approval_write .top_area{position:fixed; top: 0; left: 15%; width:100%; padding: 30px 50px 17px 50px; border-bottom: 1px solid #ccc; background-color: #fff; z-index: 9997;}
        #approval_write .top_area h2{font-size: 24px; font-weight:500; padding-bottom:20px;}
        #approval_write .top_area .approval_btn{position:relative;}
        #approval_write .top_area .approval_btn li{position:relative; float: left; margin-left: 15px;}
        #approval_write .top_area .approval_btn li:nth-child(3){word-spacing: -1px;}
        #approval_write .top_area .approval_btn li:first-child{margin-left: 0; font-weight: 500;}
        #approval_write .top_area .approval_btn li svg{position:relative; top:3px;}
        #approval_write .top_area .approval_btn li a:hover{background-color: #efefef;}
        #approval_write .bottom_area{position:relative; padding-top: 125px; height: 1300px;}
        #approval_write .bottom_area .left_area{position:fixed; width: 300px; height: 100%; border-right: 1px solid #ccc; box-sizing: border-box; z-index: 9997; background-color: #fff;}
        #approval_write .bottom_area .left_area .btn_box{position:relative; height: 110px; margin-bottom: 20px;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn{position:relative; left: 50px; top: 30px; width: 200px; height: 50px; border-radius: 5px; border: 1px solid #bbb; text-align: center; line-height:45px; font-size: 16px; box-sizing: border-box; cursor: pointer;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn:hover{border: 1px solid #333; transition: 0.2s;}
        #approval_write .bottom_area .left_area .sortation_box{width: 100%;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn{padding-left: 50px; height: 31px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li{float: left; margin-left: 15px; text-align: center; cursor: pointer; padding: 0 7px 10px 7px;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li.on{border-bottom: 2px solid #025464; font-weight: 700;}
        #approval_write .bottom_area .left_area .sortation_box .list_btn li:first-child{margin-left: 0;}
        #approval_write .bottom_area .left_area .sortation_box>.list_box{border-top: 1px solid #ccc; width: 300px;  height: 640px; box-sizing: border-box; overflow: auto;}
        #approval_write .bottom_area .left_area .sortation_box .list_box>li{height: 100px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box>li.on{background-color: rgba(26, 170, 50, 0.1); border-left: 3px solid #025464;}
        #approval_write .bottom_area .left_area .sortation_box .list_box>li>ul>li{height: 100px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box{padding: 20px 50px;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box>div{float: left;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box{width:30%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box .img_box{width: 44px; height:44px; border-radius: 22px; overflow: hidden;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .left_box .img_box img{width:100%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box{width:70%;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .member_name{font-weight: 500;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .depart_name{font-size: 12px; color: #999; font-weight: 500;}
        #approval_write .bottom_area .left_area .sortation_box .list_box .info_box .right_box .approver_info .sortation{font-size: 12px; color: #999; font-weight: 500;}
        #approval_write .bottom_area .right_area{position: relative; height:1130px; margin-left: 300px; margin: 30px 180px 0 400px; border: 5px solid #e8e8e8; box-sizing: border-box; overflow: auto;}
        #approval_write .bottom_area .right_area .doc_form{width: 800px; height:790px; margin: 30px;}
        #approval_write .bottom_area .right_area .file_form{width: 800px; margin-top: 50px;}
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
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_name{height: 65px; line-height: 62px;}
        #approval_write .bottom_area .right_area .form_top .top_right .right_inner .sign_wrap .right_wrap .sign_date{height: 30px; line-height: 27px;}
        #approval_write .bottom_area .right_area .form_bottom{position:relative;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul{position: relative; width: 800px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li{position:relative; float: left; width:30%; border-bottom: 1px solid #333; border-right: 1px solid #333; box-sizing: border-box; padding: 5px; height: 36px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.head{width: 20%; text-align: center; font-weight: 500; background-color: #dedede;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.bor_top{border-top: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.reason_row{height: 300px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.reason_head{line-height:280px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(2n){width: 80%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(2n-1){border-left: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:last-child{width: 100%; background-color: #dedede; height: 130px; font-size: 13px; padding: 20px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:last-child span{font-size:11px; color: #8f8f8f;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li>input, #approval_write .bottom_area .right_area .form_bottom>div>ul>li>select{height: 100%; box-sizing: border-box; border: 1px solid #ccc;;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li>input.datepicker{width: 25%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li #testDatepicker1, #approval_write .bottom_area .right_area .form_bottom>div>ul>li #testDatepicker2{padding-left: 26px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li svg{position:absolute; left: 9px; top: 9px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li svg.svg_sec{left: 181px;}
        .file-list {height: 145px; border: 2px dashed #ddd; padding: 10px;}
        .file-list .filebox p {font-size: 13px; margin-top: 8px; display: inline-block;}
        .file-list .filebox .delete i{color: #aaa;margin-left: 5px;}
        .observer{display: none;}
        .input_style{width: 60px; padding-right: 10px; text-align: right;}

        /* approval select box css */
        #approval_light_box{position:fixed; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.5); z-index: 9999; display: none;}
        #approval_light_box .select_form_box{position: absolute; left:50%; top: 20%; background-color: #fff; width:700px; height:52%; transform: translateX(-50%); border-radius: 10px;}
        #approval_light_box .select_form_box .form_box_inner{position:relative; padding:40px;}
        #approval_light_box .select_form_box .form_box_inner .cancel_box{position:absolute; right:20px; top:20px; width:32px; height:32px; cursor: pointer;}
        #approval_light_box .select_form_box .form_box_inner h3{font-size:18px; font-weight:500; padding-bottom: 20px;}
        #approval_light_box .select_form_box .form_box_inner .select_form{width: 100%; height: 320px;}
        #approval_light_box .select_form_box .form_box_inner .select_form>div{box-sizing: border-box; float: left; height: 300px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .left_box{padding: 10px; width: 250px; border: 1px solid #ccc; overflow: auto;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box{padding-left: 10px; width: 350px; margin-left: 20px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box h6{font-size: 16px; font-weight: 500; padding: 0 0 10px 10px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div{border: 1px solid #ccc; height: 266px; box-sizing: border-box; padding: 15px 10px;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul{float: left;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:first-child{width: 32%;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:last-child{width: 65%;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:first-child li{font-size: 14px; font-weight: 500; padding-bottom: 20px; color: #333;}
        #approval_light_box .select_form_box .form_box_inner .select_form .right_box>div ul:last-child li{font-size: 14px; padding-bottom: 20px;}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li{font-size: 16px;}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li span{cursor: pointer; border: 1px solid rgba(0,0,0,0)}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li span.on{font-weight: 700; border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        #approval_light_box .select_form_box .form_box_inner .select_form ul li span:hover{border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        #approval_light_box .select_form_box .form_box_inner .select_form ul>li>ul{padding-top:3px;}
        #approval_light_box .select_form_box .form_box_inner .select_form ul>li>ul>li{padding-left:15px;}
        #approval_light_box .select_form_box .form_box_inner .btn_area{position:relative;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner{position: absolute; right:0;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner button{width:50px; height:35px; box-sizing: border-box; cursor: pointer;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner button:first-child{background-color: #eb568e; border: none; color: #fff;}
        #approval_light_box .select_form_box .form_box_inner .btn_area .btn_inner button:last-child{border: 1px solid #ccc;}

        /* approver select box css */
        #approver_light_box{position:fixed; top:0; left:0; width:100%; height:100%; background-color: rgba(0,0,0,0.5); z-index: 9999; display: none;}
        #approver_light_box .select_approver_box{position: absolute; left:50%; top: 15%; background-color: #fff; width:800px; height:66%; transform: translateX(-50%); border-radius: 10px;}
        #approver_light_box .select_approver_box .approver_box_inner{position:relative; padding:40px; height: 550px;}
        #approver_light_box .select_approver_box .approver_box_inner h3{font-size: 18px; font-weight: 500; padding-bottom: 20px;}
        #approver_light_box .select_approver_box .approver_box_inner .cancel_box{position:absolute; right:20px; top:20px; width:32px; height:32px; cursor: pointer;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap{position:relative; width: 100%; height: 400px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap h5{font-size: 16px; font-weight: 500; padding-bottom: 10px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap div{box-sizing: border-box;}

        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box{width: 250px; float: left; height: 400px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box .org_chart{width:100%; height: 100%; border: 1px solid #ccc; padding: 10px; overflow: auto;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li{font-size: 16px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li span, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p{cursor: pointer; border: 1px solid rgba(0,0,0,0); display: inline-block;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li span.on, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p.on{font-weight: 700; border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li span.hover, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul li p.hover{border: 1px solid rgba(146, 224, 255, 0.8); box-sizing: border-box; background-color: rgba(146, 224, 255, 0.1);}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul>li>ul{padding-top:3px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .left_box ul>li>ul>li{padding-left:15px;}
        .plus{display: none;}

        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box{width: 450px; margin-left: 20px; float: left; height: 400px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div{width: 100%; height: 44%;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div:first-child{margin-bottom:10.55%;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div{width: 100%; height: 100%; border: 1px solid #ccc;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>.picker{width: 10%; height:100%; border-right: 1px solid #ccc; cursor: pointer; text-align: center; line-height: 174px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>.picker:hover{background-color: #ededed; transition: 0.1s;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div{float: left; width: 90%; overflow: auto; height: 174px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li{float: left; padding: 8px 0 8px 2%; text-align: center; font-size: 13px;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li.head{border-bottom: 1px solid #ccc; font-size: 14px; font-weight: 500; background-color: #ededed;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li:first-child, #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li.name{width: 28%;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li:nth-child(2), #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li.position{width: 13%;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li:nth-child(3), #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li.team{width: 30%;}
        #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li:nth-child(4), #approver_light_box .select_approver_box .approver_box_inner .inner_wrap .right_box>div>div>div ul li.del{width: 21%; padding: 8px 2% 8px 0;}

        #approver_light_box .select_approver_box .approver_box_inner .btn_area{position:relative; bottom: -122%;}
        #approver_light_box .select_approver_box .approver_box_inner .btn_area .btn_inner{position: absolute; right:0; bottom: 0;}
        #approver_light_box .select_approver_box .approver_box_inner .btn_area .btn_inner button{width:50px; height:35px; box-sizing: border-box; cursor: pointer;}
        #approver_light_box .select_approver_box .approver_box_inner .btn_area .btn_inner button:first-child{background-color: #eb568e; border: none; color: #fff;}
        #approver_light_box .select_approver_box .approver_box_inner .btn_area .btn_inner button:last-child{border: 1px solid #ccc;}
</style>
</head>
<body>
	<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------form start------------------------------------------ -->
    <section id="approval_write">
        <div class="top_area">
            <h2 class="title">휴가신청서</h2>
            <ul class="approval_btn">
                <li><a href="javascript:" id="approval_do" onclick="approval_do()"><svg width="15" height="15" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="m7.5 9l-3 .54L5 6.5L10.73.79a1 1 0 0 1 1.42 0l1.06 1.06a1 1 0 0 1 0 1.42Z"/><path d="M12 9.5v3a1 1 0 0 1-1 1H1.5a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h3"/></g></svg> 결재요청</a></li>
                <li><a href="javascript:" onclick="approval_select_go()"><svg width="16" height="16" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M24 24v2h2.46A5.94 5.94 0 0 1 22 28a6.007 6.007 0 0 1-6-6h-2a7.984 7.984 0 0 0 14 5.265V30h2v-6zm-2-10a8.04 8.04 0 0 0-6 2.735V14h-2v6h6v-2h-2.46A5.94 5.94 0 0 1 22 16a6.007 6.007 0 0 1 6 6h2a8.01 8.01 0 0 0-8-8"/><path fill="currentColor" d="M12 28H6v-4h2v-2H6v-5h2v-2H6v-5h2V8H6V4h18v8h2V4a2 2 0 0 0-2-2H6a2 2 0 0 0-2 2v4H2v2h2v5H2v2h2v5H2v2h2v4a2 2 0 0 0 2 2h6Z"/></svg> 양식변경</a></li>
                <li><a href="javascript:" onclick="cancel_go()"><svg width="18" height="18" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M16 3C8.832 3 3 8.832 3 16s5.832 13 13 13s13-5.832 13-13S23.168 3 16 3m0 2c6.087 0 11 4.913 11 11s-4.913 11-11 11S5 22.087 5 16S9.913 5 16 5m-3.78 5.78l-1.44 1.44L14.564 16l-3.782 3.78l1.44 1.44L16 17.437l3.78 3.78l1.44-1.437L17.437 16l3.78-3.78l-1.437-1.44L16 14.564l-3.78-3.782z"/></svg> 취소</a></li>
            </ul>
        </div>
        <div class="bottom_area">
            <div class="left_area">
                <div class="btn_box">
                    <div class="approver_btn" onclick="approver_select_go()">결재선 지정</div>
                </div>
                <div class="sortation_box">
                    <ul class="list_btn">
                        <li class="on">결재선</li>
                        <li>참조자</li>
                    </ul>
                    <ul class="list_box approver sor_box">
                        <li class="on">
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
                                        <li class="sortation">기안</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="list_box">
                        	<ul class="vertical_appr">
	                        	
	                        </ul>
                        </li>
                    </ul>
                    <ul class="list_box observer sor_box vertical_obser">
                        
                    </ul>
                </div>
            </div>
            <div class="right_area">
                <form id="form_info" class="doc_form" action="approvalWrite.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="form_no" value="1">
                <ul class="horizontal_obser">
                	
                </ul>
                    <div class="form_top">
                        <h4 class="form_name">연 차 신 청 서</h4>
                        <div class="top_left">
                            <ul>
                                <li class="head">기안자</li>
                                <li><input type="text" value="${info.name}" readonly/></li>
                                <li class="head">소속</li>
                                <li><input type="text" value="${info.member_position}" readonly/></li>
                                <li class="head">기안일</li>
                                <li><input type="text" value="" class="doc_date" readonly/></li>
                                <li class="head">문서번호</li>
                                <li><input type="text" value="" readonly/></li>
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
                                        <div class="sign_name">${info.name}</div>
                                        <div class="sign_date doc_date"></div>
                                    </div>
                                </div>
                                <div class="horizontal_appr sign_wrap">
                                	
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_bottom">
                        <div class="bottom_inner">
                            <ul>
                                <li class="head bor_top">휴가 종류</li>
                                <li class="bor_top">
                                    <select>
                                        <option>연차</option>
                                        <option>조퇴</option>
                                        <option>지각</option>
                                        <option>경조</option>
                                        <option>공가</option>
                                        <option>질병휴가</option>
                                    </select>
                                </li>
                                <li class="head">기간 및 일시</li>
                                <li><input class="datepicker" type="text" id="testDatepicker1"><svg width="17" height="17" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                                    <g fill="none">
                                        <path fill="#B4ACBC" d="m2 9l13.267-2.843a3.5 3.5 0 0 1 1.466 0L30 9v15.8a5.2 5.2 0 0 1-5.2 5.2H7.2A5.2 5.2 0 0 1 2 24.8z"/>
                                        <path fill="#F3EEF8" d="m3 8l12.213-2.818a3.5 3.5 0 0 1 1.574 0L29 8v16.5a4.5 4.5 0 0 1-4.5 4.5h-17A4.5 4.5 0 0 1 3 24.5z"/>
                                        <path fill="#998EA4" d="M8 12a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm0 5.5a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm-.2 5.6c0-.11.09-.2.2-.2h2.8c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2H8a.2.2 0 0 1-.2-.2zM14.6 12a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm-.2 5.7c0-.11.09-.2.2-.2h2.8c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2h-2.8a.2.2 0 0 1-.2-.2zm.2 5.2a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zM21 12.2c0-.11.09-.2.2-.2H24c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2h-2.8a.2.2 0 0 1-.2-.2zm.2 10.7a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2H24a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2z"/>
                                        <path fill="#0084CE" d="M7.2 2A5.2 5.2 0 0 0 2 7.2V9h28V7.2A5.2 5.2 0 0 0 24.8 2zm14 15.5a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2H24a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2z"/>
                                    </g>
                                </svg>
                                ~
                                <input class="datepicker" type="text" id="testDatepicker2"><svg class="svg_sec" width="17" height="17" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                                    <g fill="none">
                                        <path fill="#B4ACBC" d="m2 9l13.267-2.843a3.5 3.5 0 0 1 1.466 0L30 9v15.8a5.2 5.2 0 0 1-5.2 5.2H7.2A5.2 5.2 0 0 1 2 24.8z"/>
                                        <path fill="#F3EEF8" d="m3 8l12.213-2.818a3.5 3.5 0 0 1 1.574 0L29 8v16.5a4.5 4.5 0 0 1-4.5 4.5h-17A4.5 4.5 0 0 1 3 24.5z"/>
                                        <path fill="#998EA4" d="M8 12a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm0 5.5a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm-.2 5.6c0-.11.09-.2.2-.2h2.8c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2H8a.2.2 0 0 1-.2-.2zM14.6 12a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm-.2 5.7c0-.11.09-.2.2-.2h2.8c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2h-2.8a.2.2 0 0 1-.2-.2zm.2 5.2a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zM21 12.2c0-.11.09-.2.2-.2H24c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2h-2.8a.2.2 0 0 1-.2-.2zm.2 10.7a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2H24a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2z"/>
                                        <path fill="#0084CE" d="M7.2 2A5.2 5.2 0 0 0 2 7.2V9h28V7.2A5.2 5.2 0 0 0 24.8 2zm14 15.5a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2H24a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2z"/>
                                    </g>
                                </svg>
                                &nbsp;&nbsp;
                                사용일수 : <input id="use_days" class="input_style" type="text" readonly/>
                                </li>
                                <li class="head">반차 여부</li>
                                <li>
                                    <span class="half_area">
                                        <input type="checkbox" id="start_date"> 시작일 ( <input type="radio" id="start_am" name="start"> 오전 &nbsp; <input type="radio" id="start_pm" name="start"> 오후 )
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="checkbox" id="end_date"> 종료일 ( <input type="radio" id="end_am" name="end"> 오전 &nbsp; <input type="radio" id="end_pm" name="end"> 오후 )
                                    </span>
                                </li>
                                <li class="head">연차 일수</li>
                                <li>잔여연차 : <input class="input_style" type="text" readonly/> &nbsp; 신청연차 : <input class="input_style" type="text" readonly/></li>
                                <li class="head reason_row reason_head">휴가 사유</li>
                                <li id="rich_editor" class="reason_row"></li>
                                <li>
                                    1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다.<br>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.</span><br>
                                    2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
                                    3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
                                </li>
                            </ul>
                        </div>
                    </div>
                <div class="file_form">
               	 <div id="file_btn">파일선택</div>
                    <input id="input_file" type="file" name="files" onchange="addFile(this);" multiple="multiple" />
                    <div class="file-list"></div>
                </div>
                </form>
            </div>
        </div>
        
    </section>
    <!-- -------------------------------------------form end------------------------------------------ -->


    <!-- -------------------------------------------select_approver start------------------------------------------ -->
    <div id="approver_light_box">
        <div class="select_approver_box">
            <div class="approver_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>결재선 지정</h3>
                <div class="inner_wrap">
                    <div class="left_box">
                        <h5>조직도</h5>
                        <div class="org_chart">
                            <ul>
                            	<c:forEach items="${departments}" var="depart">
                            		<c:if test="${depart.depart_p_no eq 0}">
                            			<li>
	                            			<span>
		                                        <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
		                                        <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> ${depart.depart_name}
		                                    </span>
		                                    <ul>
		                                    	<c:forEach items="${teams}" var="team">
			                                    	<c:if test="${depart.depart_no eq team.depart_p_no}">
			                                    		<li>
			                                    			<span>
				                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
				                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> ${team.depart_name}
				                                            </span>
				                                            <ul>
				                                            	<c:forEach items="${members}" var="member">
				                                            		<c:if test="${team.depart_no eq member.depart_no}">
				                                            			<li>
						                                                    <p data-member-no="${member.member_no}">
						                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
						                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
						                                                        </svg> ${member.name} ${member.member_position}
						                                                    </p>
						                                                </li>
				                                            		</c:if>
				                                            	</c:forEach>
				                                            </ul>
			                                    		</li>
			                                    	</c:if>
			                                    </c:forEach>
		                                    </ul>
	                                    </li>
                            		</c:if>
                            	</c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="right_box">
                        <div class="approver_area">
                            <h5>결재자</h5>
                            <div>
                                <div class="picker" onclick="approver_select()">
                                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path fill="currentColor" d="m18.78 11.37l-4.78-6a1 1 0 0 0-1.41-.15a1 1 0 0 0-.15 1.41L16.71 12l-4.48 5.37a1 1 0 0 0 .13 1.41A1 1 0 0 0 13 19a1 1 0 0 0 .77-.36l5-6a1 1 0 0 0 .01-1.27"/>
                                        <path fill="currentColor" d="M7 5.37a1 1 0 0 0-1.61 1.26L9.71 12l-4.48 5.36a1 1 0 0 0 .13 1.41A1 1 0 0 0 6 19a1 1 0 0 0 .77-.36l5-6a1 1 0 0 0 0-1.27Z"/>
                                    </svg>
                                </div>
                                <div class="approver_box">
                                    <ul>
                                        <li class="head">이름</li>
                                        <li class="head">직책</li>
                                        <li class="head">부서</li>
                                        <li class="head">
                                            <svg width="14" height="14" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg">
                                                <path fill="#555" d="M11.5-.031c-1.958 0-3.531 1.627-3.531 3.594V4H4c-.551 0-1 .449-1 1v1H2v2h2v15c0 1.645 1.355 3 3 3h12c1.645 0 3-1.355 3-3V8h2V6h-1V5c0-.551-.449-1-1-1h-3.969v-.438c0-1.966-1.573-3.593-3.531-3.593zm0 2.062h3c.804 0 1.469.656 1.469 1.531V4H10.03v-.438c0-.875.665-1.53 1.469-1.53zM6 8h5.125c.124.013.247.031.375.031h3c.128 0 .25-.018.375-.031H20v15c0 .563-.437 1-1 1H7c-.563 0-1-.437-1-1zm2 2v12h2V10zm4 0v12h2V10zm4 0v12h2V10z"/>
                                            </svg>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="observer_area">
                            <h5>참조자</h5>
                            <div>
                                <div class="picker" onclick="observer_select()">
                                    <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path fill="currentColor" d="m18.78 11.37l-4.78-6a1 1 0 0 0-1.41-.15a1 1 0 0 0-.15 1.41L16.71 12l-4.48 5.37a1 1 0 0 0 .13 1.41A1 1 0 0 0 13 19a1 1 0 0 0 .77-.36l5-6a1 1 0 0 0 .01-1.27"/>
                                        <path fill="currentColor" d="M7 5.37a1 1 0 0 0-1.61 1.26L9.71 12l-4.48 5.36a1 1 0 0 0 .13 1.41A1 1 0 0 0 6 19a1 1 0 0 0 .77-.36l5-6a1 1 0 0 0 0-1.27Z"/>
                                    </svg>
                                </div>
                                <div class="observer_box">
                                    <ul>
                                        <li class="head">이름</li>
                                        <li class="head">직책</li>
                                        <li class="head">부서</li>
                                        <li class="head">
                                            <svg width="14" height="14" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg">
                                                <path fill="#555" d="M11.5-.031c-1.958 0-3.531 1.627-3.531 3.594V4H4c-.551 0-1 .449-1 1v1H2v2h2v15c0 1.645 1.355 3 3 3h12c1.645 0 3-1.355 3-3V8h2V6h-1V5c0-.551-.449-1-1-1h-3.969v-.438c0-1.966-1.573-3.593-3.531-3.593zm0 2.062h3c.804 0 1.469.656 1.469 1.531V4H10.03v-.438c0-.875.665-1.53 1.469-1.53zM6 8h5.125c.124.013.247.031.375.031h3c.128 0 .25-.018.375-.031H20v15c0 .563-.437 1-1 1H7c-.563 0-1-.437-1-1zm2 2v12h2V10zm4 0v12h2V10zm4 0v12h2V10z"/>
                                            </svg>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn_area">
                        <div class="btn_inner">
                            <button onclick="setApprover()" id="">확인</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------select_approver end------------------------------------------ -->
</body>
<script>

function approval_do(){
	event.stopPropagation();
	var form = document.getElementById("form_info");
	var content = editor.getHTMLCode();
	var $date = $('input[name = "date"]');
	var $title = $('input[name = "title"]');
	var $content = $('input[name = "content"]');
	var $approver = $('input[name = "approver1"]');
	$content.val(content);
	
	if(content.length > (2*1024*1024)){
		// POST 방식은 순수 컨텐츠의 크기가 2MB 이상은 수용하지 못한다.
		// data:image는 별도의 파트가 아닌, 문자열과 함께하는 컨텐츠이기 때문에 2MB가 넘어가면 안된다.
		// 되도록이면 2MB를 넘으면 안되지만, 넘어야 할 경우라면 server.xml에서 조정 가능하다.
		// maxPostSize = -1 (무제한) maxPostSize = 허용바이트
		// <Connector maxPostSize="-1" connectionTimeout="20000" maxParameterCount="1000" port="8080" protocol="HTTP/1.1" redirectPort="8443"/>
		alert('컨텐츠의 크기가 너무 큽니다. 이미지의 갯수나 크기를 줄여 주세요.');
	}else if($date.val() == ''){
		alert("시행일자를 입력해 주세요.");
		$date.focus();
	}else if($title.val() == ''){
		alert("제목을 입력해 주세요.");
		$title.focus();
	}else if($content.val() == ''){
		alert("내용을 입력해 주세요.");
		$content.focus();
	}else if($approver.length == 0){
		alert("결재자를 선택해 주세요.");
		approver_select_go();
	}else{
		form.submit();
	}
}

function cancel_go(){
	var userResponse = confirm("작성한 내용은 저장되지 않습니다.\n취소하시겠습니까?");
	
	if (userResponse) {
		window.location.href = '/draftBox';
	}
}

// ------------------------------------ approver_select_box start ------------------------------------

var p_text = "";
var splite_text = "";
var member_name = "";
var member_position = "";
var member_team = "";
var member_no = "";

function approver_select_go(){
    $('#approver_light_box').fadeIn(500);
}

$('.cancel_box').on('click',function(){
    $('#approver_light_box').fadeOut(500);
    $('#approval_light_box').fadeOut(500);
});

function orgAddClass(){
    $('.org_chart>ul>li>ul>li>ul>li>p').addClass('orgMember');
}
orgAddClass();

$('p.orgMember').on('click', function() {
    $(this).addClass('on');
    $('p.orgMember').not(this).removeClass('on');
    $('span').not(this).removeClass('on');
    p_text = $('.org_chart p.on').text().trim();
    splite_text = p_text.split(' ');
    member_name = splite_text[0];
    member_position = splite_text[1];
    member_team = $('.org_chart p.on').closest('ul').siblings('span').text().trim();
    member_no = $(this).data('memberNo');
});

$('.org_chart>ul>li>span').on('click',function(){
    var $ul = $(this).siblings('ul');

    $ul.slideToggle(400,function(){
        if ($(this).is(":hidden")) {
            $(this).siblings('span').find('.minus').css('display','none');
            $(this).siblings('span').find('.plus').css('display','inline-block');
        }else{
            $(this).siblings('span').find('.minus').css('display','inline-block');
            $(this).siblings('span').find('.plus').css('display','none');
        }
    });
});
$('.org_chart>ul>li>ul>li>span').on('click',function(){
    var $ul = $(this).siblings('ul');

    $ul.slideToggle(300,function(){
        if ($(this).is(":hidden")) {
            $(this).siblings('span').find('.minus').css('display','none');
            $(this).siblings('span').find('.plus').css('display','inline-block');
        }else{
            $(this).siblings('span').find('.minus').css('display','inline-block');
            $(this).siblings('span').find('.plus').css('display','none');
        }
    });
});

var approver_count = 0;
var observer_count = 0;
var approver_class_num = 0;
var observer_class_num = 0;
var approver_arr = [];
var observer_arr = [];

// 중복 체크
function isDuplicate(arr, value) {
    return arr.indexOf(value.toString()) !== -1;
}

function approver_select(){
    if(approver_count > 2){
        alert('더 이상 추가할 수 없습니다.');
        return;
    } else if($('.org_chart>ul>li>span.on').length){
        alert('부서나 팀을 선택할 수 없습니다.');
        return;
    } else if($('.org_chart>ul>li>ul>li>span.on').length){
        alert('부서나 팀을 선택할 수 없습니다.');
        return;
    } else if(!$('.org_chart .on').length){
        alert('결재할 직원을 클릭해주세요.');
        return;
    } else{
        if (isDuplicate(approver_arr, member_no)) {
            alert("중복된 대상입니다.");
        } else {
            // 중복이 아니면 배열에 추가
            approver_arr.push(member_no.toString());
            approver_count++;
            approver_class_num++;
            var content = "";
            content += '<li class="name appr_list'+approver_class_num+'">'+member_name+'</li>';
            content += '<li class="position appr_list'+approver_class_num+'">'+member_position+'</li>';
            content += '<li class="team appr_list'+approver_class_num+'">'+member_team+'</li>';
            content += '<li class="del appr_list'+approver_class_num+'"><a href="javascript:" onclick="approver_selected_del(this)" id='+member_no+' class="appr_list'+approver_class_num+'"><svg width="14" height="14" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg"><path fill="#555" d="M11.5-.031c-1.958 0-3.531 1.627-3.531 3.594V4H4c-.551 0-1 .449-1 1v1H2v2h2v15c0 1.645 1.355 3 3 3h12c1.645 0 3-1.355 3-3V8h2V6h-1V5c0-.551-.449-1-1-1h-3.969v-.438c0-1.966-1.573-3.593-3.531-3.593zm0 2.062h3c.804 0 1.469.656 1.469 1.531V4H10.03v-.438c0-.875.665-1.53 1.469-1.53zM6 8h5.125c.124.013.247.031.375.031h3c.128 0 .25-.018.375-.031H20v15c0 .563-.437 1-1 1H7c-.563 0-1-.437-1-1zm2 2v12h2V10zm4 0v12h2V10zm4 0v12h2V10z"/></svg></a></li>';
            $('.approver_box>ul').append(content);
        }
        
        $('.approver_box>ul>li.name').each(function(index){
            $(this).attr('data-index',index+1);
        });
     }
}

function observer_select(){
    if(observer_count > 9){
        alert('더 이상 추가할 수 없습니다.');
        return;
    } else if($('.org_chart>ul>li>span.on').length){
        alert('부서나 팀을 선택할 수 없습니다.');
        return;
    } else if($('.org_chart>ul>li>ul>li>span.on').length){
        alert('부서나 팀을 선택할 수 없습니다.');
        return;
    } else if(!$('.org_chart .on').length){
        alert('참조할 직원을 클릭해주세요.');
        return;
    } else{
    	if (isDuplicate(observer_arr, member_no)) {
            alert("중복된 대상입니다.");
        } else {
            // 중복이 아니면 배열에 추가
            observer_arr.push(member_no.toString());
        	observer_count++;
            observer_class_num++;
            var content = "";
            content += '<li class="name obser_list'+observer_class_num+'">'+member_name+'</li>';
            content += '<li class="position obser_list'+observer_class_num+'">'+member_position+'</li>';
            content += '<li class="team obser_list'+observer_class_num+'">'+member_team+'</li>';
            content += '<li class="del obser_list'+observer_class_num+'"><a href="javascript:" onclick="observer_selected_del(this)" id='+member_no+' class="obser_list'+observer_class_num+'"><svg width="14" height="14" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg"><path fill="#555" d="M11.5-.031c-1.958 0-3.531 1.627-3.531 3.594V4H4c-.551 0-1 .449-1 1v1H2v2h2v15c0 1.645 1.355 3 3 3h12c1.645 0 3-1.355 3-3V8h2V6h-1V5c0-.551-.449-1-1-1h-3.969v-.438c0-1.966-1.573-3.593-3.531-3.593zm0 2.062h3c.804 0 1.469.656 1.469 1.531V4H10.03v-.438c0-.875.665-1.53 1.469-1.53zM6 8h5.125c.124.013.247.031.375.031h3c.128 0 .25-.018.375-.031H20v15c0 .563-.437 1-1 1H7c-.563 0-1-.437-1-1zm2 2v12h2V10zm4 0v12h2V10zm4 0v12h2V10z"/></svg></a></li>';
            $('.observer_box>ul').append(content);
            console.log("observer : "+observer_arr);
        }
        
        $('.observer_box>ul>li.name').each(function(index){
            $(this).attr('data-index',index+1);
        });
     }
}

function approver_selected_del(element){
    var class_value = $(element).attr('class');
    var remove_no = $(element).attr('id').toString();
    approver_arr = approver_arr.filter(function (item) {
        return item !== remove_no;
    });
    $('li.' + class_value).remove();
    approver_count--;
    $('.approver_box>ul>li.name').each(function(index){
        $(this).attr('data-index',index+1);
    });
}

function observer_selected_del(element){
    var class_value = $(element).attr('class');
    var remove_no = $(element).attr('id').toString();
    observer_arr = observer_arr.filter(function (item) {
        return item !== remove_no;
    });
    $('li.' + class_value).remove();
    console.log("observer : "+observer_arr);
    observer_count--;
    $('.observer_box>ul>li.name').each(function(index){
        $(this).attr('data-index',index+1);
    });
}

function setApprover(){
	$('#approver_light_box').fadeOut(50);
	
	$.ajax({
	    url: 'setApprover.ajax',
	    type: 'POST',
	    dataType:'JSON',
	    contentType: 'application/json',
	    data: JSON.stringify({
	        approver: approver_arr,
	        observer: observer_arr
	    }),
	    success: function(data) {
	        console.log("setApprover.ajax 성공");
	        drawApprover(data);
	        if(data.observer != 0){
	        	drawObserver(data);
	        } else{
	        	$('.vertical_obser').empty();
	        	$('.horizontal_obser').empty();
	        }
	    },
	    error: function(error) {
	        console.error("setApprover.ajax 실패");
	    }
	});
}

function drawApprover(apprList){
	
	var verContent = "";
	var horContent = '<div class="left_wrap"><p>승<br>인</p></div>';
	
	if(apprList.approver != 0){
		apprList.approver.forEach(function(item, idx){
			verContent += '<li>';
			verContent += '<div class="info_box"><div class="left_box"> <div class="img_box">';
			verContent += '<a href="javascript:"><img src="/resources/img/common/'+item.file_newname+'" alt="'+item.member_no+'_'+item.name+'"></a></div></div>';
			verContent += '<div class="right_box"><ul class="approver_info">';
			verContent += '<li class="member_name"><a href="javascript:">'+item.name+' '+item.member_position+'</a></li>';
			verContent += '<li class="depart_name">'+item.depart_name+'</li>';
			verContent += '<li class="sortation">결재</li>';
			verContent += '</ul></div></div></li>';
			
			horContent += '<div class="right_wrap">';
			horContent += '<div class="sign_rank">'+item.member_position+'</div>';
			horContent += '<div class="sign_name">'+item.name+'</div>';
			horContent += '<div class="sign_date"></div>';
			horContent += '<input type="hidden" name="approver'+(idx+1)+'">';
			horContent += '</div>';
			
			$('.vertical_appr').empty();
			$('.vertical_appr').append(verContent);
			$('.horizontal_appr').empty();
			$('.horizontal_appr').append(horContent);
			$('input[name="approver'+(idx+1)+'"]').val(item.member_no);
		});
	} else{
		$('.vertical_appr').empty();
		$('.horizontal_appr').empty();
	}
	
}

function drawObserver(apprList){
	
	var verContent = "";
	var horContent = "";
	
	apprList.observer.forEach(function(item, idx){
		verContent += '<li>';
		verContent += '<div class="info_box"><div class="left_box"> <div class="img_box">';
		verContent += '<a href="javascript:"><img src="/resources/img/common/'+item.file_newname+'" alt="'+item.member_no+'_'+item.name+'"></a></div></div>';
		verContent += '<div class="right_box"><ul class="approver_info">';
		verContent += '<li class="member_name"><a href="javascript:">'+item.name+' '+item.member_position+'</a></li>';
		verContent += '<li class="depart_name">'+item.depart_name+'</li>';
		verContent += '<li class="sortation">결재</li>';
		verContent += '</ul></div></div></li>';
		
		horContent += '<li><input type="hidden" name="observer" class="observer'+(idx+1)+'"></li>';
			
		$('.vertical_obser').empty();
		$('.vertical_obser').append(verContent);
		$('.horizontal_obser').empty();
		$('.horizontal_obser').append(horContent);
		$('input[class="observer'+(idx+1)+'"]').val(item.member_no);
	});
	
}





// ------------------------------------ approver_select_box end --------------------------------------



// ------------------------------------ approval_select_box start ------------------------------------
var dataIndexValue = 0;

/*----------------------------------- datepicker start -------------------------------------------
$( "#testDatepicker" ).datepicker({
    dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dateFormat: 'yy/mm/dd'
});
----------------------------------- datepicker end -------------------------------------------*/

// ----------------------------------- sortation tabs start -------------------------------------------
function tabs(index){
    $('.list_btn>li[data-index='+index+']').addClass('on');
    $('.list_btn>li[data-index!='+index+']').removeClass('on');
    $('.sor_box[data-index='+index+']').stop().fadeIn(1000);
    $('.sor_box[data-index!='+index+']').css('display','none');
}

$('.sor_box').each(function(index){
    $(this).attr('data-index',index)
});

$('.list_btn>li').each(function(index){
     $(this).attr('data-index',index);
     $(this).click(function(){
        tabs(index);
     });
});
// ----------------------------------- sortation tabs end -------------------------------------------

// ----------------------------------- text editor start ------------------------------------------
var config = {}
config.toolbar = "basic"; // 이 부분이 주석되면 모든 기능이 다 나타난다.
config.editorResizeMode = "height"; // 에디터 크기 조절안됨 
var editor = new RichTextEditor("#rich_editor", config);

// 이미지 업로드
// 1. 서버로 바이너리 업로드(우리가 그동안 해 왔던)
// 2. data:image방식 - 이미지의 바이너리를 16진수의 문자로 변환하는 방식
// 장점 : 서버에 별도의 파일처리를 하지 않아도 된다.
// 단점 : 파일만 별도로 용량제어가 안된다. / 원래 이미지보다 사이즈가 커진다.
function save(){
	var content = editor.getHTMLCode();
	$('input[name="content"]').val(content);
	console.log((content.length/1024/1024)+'MB');
	if(content.length > (2*1024*1024)){
		// POST 방식은 순수 컨텐츠의 크기가 2MB 이상은 수용하지 못한다.
		// data:image는 별도의 파트가 아닌, 문자열과 함께하는 컨텐츠이기 때문에 2MB가 넘어가면 안된다.
		// 되도록이면 2MB를 넘으면 안되지만, 넘어야 할 경우라면 server.xml에서 조정 가능하다.
		// maxPostSize = -1 (무제한) maxPostSize = 허용바이트
		// <Connector maxPostSize="-1" connectionTimeout="20000" maxParameterCount="1000" port="8080" protocol="HTTP/1.1" redirectPort="8443"/>
		alert('컨텐츠의 크기가 너무 큽니다. 이미지의 갯수나 크기를 줄여 주세요!');
	}else{
		$('form').submit();
	}
}
// ----------------------------------- text editor end ------------------------------------------

var fileNo = 0;
var filesArr = new Array();

/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 5;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    }

    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

        const file = obj.files[i];

        // 첨부파일 검증
        if (validation(file)) {
            // 파일 배열에 담기
            var reader = new FileReader();
            reader.onload = function () {
                filesArr.push(file);
            };
            reader.readAsDataURL(file)

            // 목록 추가
            let htmlData = '';
            htmlData += '<div id="file' + fileNo + '" class="filebox">';
            htmlData += '   <p class="name">' + file.name + '</p>';
            htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
            htmlData += '</div>';
            $('.file-list').append(htmlData);
            fileNo++;
        } else {
            continue;
        }
    }
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (50 * 1024 * 1024)) {
        alert("최대 파일 용량인 50MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    document.querySelector("#file" + num).remove();
    filesArr[num].is_delete = true;
}

// input file 버튼 수정
$('#file_btn').on('click',function(event){
	event.stopPropagation();
	document.getElementById("input_file").click();  
});

$('.cancel_box').on('click',function(){
    $('#approval_light_box').fadeOut(500);
});

$('.cancel_btn').on('click',function(){
    $('#approval_light_box').fadeOut(500);
    $('#approver_light_box').fadeOut(500);
});

$('.select_form>.left_box>ul>li>span').on('click',function(){
    $(this).siblings('ul').slideToggle(300);
});

$('span').on('click', function() {
    $(this).addClass('on');
    $('span').not(this).removeClass('on');
    $('p').not(this).removeClass('on');
    dataIndexValue = $(this).data('index');
});

$('.select_form_box .left_box>ul>li>ul>li>span').each(function(index){
    $(this).attr('data-index',index+1);
});

$('.select_form_box .left_box>ul>li>ul>li>span').on('click',function(){
    var selectedFormName = $(this).text();
    $('.selected_form_name').text(selectedFormName);
});

// 현재 날짜를 가져오기 위한 함수
function getCurrentDate() {
var currentDate = new Date();

var year = currentDate.getFullYear();
var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더하고 두 자리로 맞춰줍니다.
var day = ('0' + currentDate.getDate()).slice(-2);

var formattedDate = year + '-' + month + '-' + day;
return formattedDate;
}

// 가져온 날짜를 특정 태그에 넣기
$('.cur_date').text(getCurrentDate());
$('.doc_date').val(getCurrentDate());
$('.doc_date').text(getCurrentDate());

// ------------------------------------ approval_select_box end ------------------------------------



</script>
</html>