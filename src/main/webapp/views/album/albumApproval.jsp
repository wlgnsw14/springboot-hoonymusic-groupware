<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hoony Music</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" type="text/css"/>
<link rel="stylesheet" href="/resources/richtexteditor/rte_theme_default.css"/>
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/richtexteditor/rte.js"></script>
<script type="text/javascript" src='/resources/richtexteditor/plugins/all_plugins.js'></script>
<style>
	/* approval form */
        #approval_write{position:relative; margin-left: 15%;}
        #approval_write .top_area{position:fixed; top: 0; left: 15%; width:100%; padding: 30px 50px 22px 50px; border-bottom: 1px solid #ccc; background-color: #fff; z-index: 9997;}
        #approval_write .top_area h2{font-size: 24px; font-weight:500; padding-bottom:20px;}
        #approval_write .top_area .approval_btn{position:relative;}
        #approval_write .top_area .approval_btn li{position:relative; float: left; margin-left: 15px;}
        #approval_write .top_area .approval_btn li:nth-child(3){word-spacing: -1px;}
        #approval_write .top_area .approval_btn li:first-child{margin-left: 0; font-weight: 500;}
        #approval_write .top_area .approval_btn li svg{position:relative; top:3px;}
        #approval_write .top_area .approval_btn li a:hover{background-color: #efefef;}
        #approval_write .bottom_area{position:relative; padding-top: 130px; height: 1300px;}
        #approval_write .bottom_area .left_area{position:fixed; width: 300px; height: 100%; border-right: 1px solid #ccc; box-sizing: border-box; z-index: 9997; background-color: #fff;}
        #approval_write .bottom_area .left_area .btn_box{position:relative; height: 110px; margin-bottom: 20px;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn{position:relative; left: 50px; top: 30px; width: 200px; height: 50px; border-radius: 5px; border: 1px solid #bbb; text-align: center; line-height:45px; font-size: 16px; box-sizing: border-box; cursor: pointer;}
        #approval_write .bottom_area .left_area .btn_box .approver_btn:hover{border: 1px solid #333; transition: 0.2s;}
        #approval_write .bottom_area .left_area .sortation_box{width: 100%;}
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
        #approval_write .bottom_area .right_area .form_bottom{position:relative; height: 472px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul{position: relative; width: 800px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li{position:relative; float: left; width:82%; border-bottom: 1px solid #333; border-right: 1px solid #333; box-sizing: border-box; padding: 5px; height: 36px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.head{width: 18%; text-align: center; font-weight: 500; background-color: #dedede;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.bor_top{border-top: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li.bor_left{border-left: 1px solid #333;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(2){width: 24%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(4){width: 40%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(6){width: 24%;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:nth-child(7){width: 18%; }
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li:last-child{width: 100%; height:400px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li>input, #approval_write .bottom_area .right_area .form_bottom>div>ul>li>select{width: 100%; height: 100%; box-sizing: border-box; border: 1px solid #ccc;;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li #testDatepicker{padding-left: 26px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li svg{position:absolute; left: 9px; top: 9px;}
        #approval_write .bottom_area .right_area .form_bottom>div>ul>li #rich_editor{width: 100%; height:400px;}
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
            <h2 class="title">업무기안</h2>
            <ul class="approval_btn">
                <li><a href="javascript:" id="approval_do"><svg width="15" height="15" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="m7.5 9l-3 .54L5 6.5L10.73.79a1 1 0 0 1 1.42 0l1.06 1.06a1 1 0 0 1 0 1.42Z"/><path d="M12 9.5v3a1 1 0 0 1-1 1H1.5a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h3"/></g></svg> 결재요청</a></li>
                <li><a href="javascript:" onclick="approval_select_go()"><svg width="16" height="16" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M24 24v2h2.46A5.94 5.94 0 0 1 22 28a6.007 6.007 0 0 1-6-6h-2a7.984 7.984 0 0 0 14 5.265V30h2v-6zm-2-10a8.04 8.04 0 0 0-6 2.735V14h-2v6h6v-2h-2.46A5.94 5.94 0 0 1 22 16a6.007 6.007 0 0 1 6 6h2a8.01 8.01 0 0 0-8-8"/><path fill="currentColor" d="M12 28H6v-4h2v-2H6v-5h2v-2H6v-5h2V8H6V4h18v8h2V4a2 2 0 0 0-2-2H6a2 2 0 0 0-2 2v4H2v2h2v5H2v2h2v5H2v2h2v4a2 2 0 0 0 2 2h6Z"/></svg> 양식변경</a></li>
                <li><a href="javascript:"><svg width="18" height="18" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M16 3C8.832 3 3 8.832 3 16s5.832 13 13 13s13-5.832 13-13S23.168 3 16 3m0 2c6.087 0 11 4.913 11 11s-4.913 11-11 11S5 22.087 5 16S9.913 5 16 5m-3.78 5.78l-1.44 1.44L14.564 16l-3.782 3.78l1.44 1.44L16 17.437l3.78 3.78l1.44-1.437L17.437 16l3.78-3.78l-1.437-1.44L16 14.564l-3.78-3.782z"/></svg> 취소</a></li>
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
                    <ul class="list_box approver">
                        <li class="on">
                            <div class="info_box">
                                <div class="left_box">
                                    <div class="img_box">
                                        <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
                                    </div>
                                </div>
                                <div class="right_box">
                                    <ul class="approver_info">
                                        <li class="member_name"><a href="javascript:">강태오 사원</a></li>
                                        <li class="depart_name">지원팀</li>
                                        <li class="sortation">기안</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="info_box">
                                <div class="left_box">
                                    <div class="img_box">
                                        <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
                                    </div>
                                </div>
                                <div class="right_box">
                                    <ul class="approver_info">
                                        <li class="member_name"><a href="javascript:">강태오 사원</a></li>
                                        <li class="depart_name">지원팀</li>
                                        <li class="sortation">결재</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul class="list_box observer">
                        <li>
                            <div class="info_box">
                                <div class="left_box">
                                    <div class="img_box">
                                        <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
                                    </div>
                                </div>
                                <div class="right_box">
                                    <ul class="approver_info">
                                        <li class="member_name"><a href="javascript:">강태오 사원</a></li>
                                        <li class="depart_name">지원팀</li>
                                        <li class="sortation">기안</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="info_box">
                                <div class="left_box">
                                    <div class="img_box">
                                        <a href="javascript:"><img src="/resources/img/common/kang.jpg" alt="231217_강태오"></a>
                                    </div>
                                </div>
                                <div class="right_box">
                                    <ul class="approver_info">
                                        <li class="member_name"><a href="javascript:">강태오 사원</a></li>
                                        <li class="depart_name">지원팀</li>
                                        <li class="sortation">결재</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
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
                                <li><input type="text" value="강태오" readonly/></li>
                                <li class="head">소속</li>
                                <li><input type="text" value="지원팀" readonly/></li>
                                <li class="head">기안일</li>
                                <li><input type="text" value="2023-12-27(수)" readonly/></li>
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
                                        <div class="sign_rank">사원</div>
                                        <div class="sign_name">강태오</div>
                                        <div class="sign_date">2023/12/27</div>
                                    </div>
                                </div>
                                <div class="approver sign_wrap">
                                    <div class="left_wrap">
                                        <p>승<br>인</p>
                                    </div>
                                    <div class="right_wrap">
                                        <div class="sign_rank">사원</div>
                                        <div class="sign_name">강태오</div>
                                        <div class="sign_date"></div>
                                        <input type="hidden" name="first_approver">
                                    </div>
                                    <div class="right_wrap">
                                        <div class="sign_rank">사원</div>
                                        <div class="sign_name">강태오</div>
                                        <div class="sign_date"></div>
                                        <input type="hidden" name="second_approver">
                                    </div>
                                    <div class="right_wrap">
                                        <div class="sign_rank">사원</div>
                                        <div class="sign_name">강태오</div>
                                        <div class="sign_date"></div>
                                        <input type="hidden" name="third_approver">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form_bottom">
                        <div class="bottom_inner">
                            <ul>
                                <li class="head bor_top bor_left">시행일자</li>
                                <li class="bor_top"><input type="text" name="date" id="testDatepicker"><svg width="17" height="17" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
                                    <g fill="none">
                                        <path fill="#B4ACBC" d="m2 9l13.267-2.843a3.5 3.5 0 0 1 1.466 0L30 9v15.8a5.2 5.2 0 0 1-5.2 5.2H7.2A5.2 5.2 0 0 1 2 24.8z"/>
                                        <path fill="#F3EEF8" d="m3 8l12.213-2.818a3.5 3.5 0 0 1 1.574 0L29 8v16.5a4.5 4.5 0 0 1-4.5 4.5h-17A4.5 4.5 0 0 1 3 24.5z"/>
                                        <path fill="#998EA4" d="M8 12a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm0 5.5a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm-.2 5.6c0-.11.09-.2.2-.2h2.8c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2H8a.2.2 0 0 1-.2-.2zM14.6 12a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zm-.2 5.7c0-.11.09-.2.2-.2h2.8c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2h-2.8a.2.2 0 0 1-.2-.2zm.2 5.2a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2h2.8a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2zM21 12.2c0-.11.09-.2.2-.2H24c.11 0 .2.09.2.2v2.6a.2.2 0 0 1-.2.2h-2.8a.2.2 0 0 1-.2-.2zm.2 10.7a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2H24a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2z"/>
                                        <path fill="#0084CE" d="M7.2 2A5.2 5.2 0 0 0 2 7.2V9h28V7.2A5.2 5.2 0 0 0 24.8 2zm14 15.5a.2.2 0 0 0-.2.2v2.6c0 .11.09.2.2.2H24a.2.2 0 0 0 .2-.2v-2.6a.2.2 0 0 0-.2-.2z"/>
                                    </g>
                                </svg></li>
                                <li class="head bor_top">협조팀명</li>
                                <li class="bor_top">
                                    <select name="team_name">
                                        <option value="0">-</option>
                                        <option value="1">광고팀</option>
                                        <option value="2">기획팀</option>
                                        <option value="3">영상/디자인팀</option>
                                        <option value="4">물류팀</option>
                                        <option value="5">저작권 관리팀</option>
                                        <option value="6">계약운영 관리팀</option>
                                        <option value="7">전략/분석팀</option>
                                        <option value="8">지원팀</option>
                                        <option value="9">총무팀</option>
                                        <option value="10">인사팀</option>
                                    </select>
                                </li>
                                <li class="head bor_top bor_left">음반명</li>
                                <li class="bor_top"><input type="text" name="albName"/></li>
                                <li class="head bor_top">아티스트명</li>
                                <li class="bor_top" style="width: 40%;"><input type="text" name="artName"/></li>
                                <li class="head bor_top bor_left">판매 가격</li>
                                <li class="bor_top" style="width: 24%;"><input type="text" name="price"/></li>
                                <li class="head bor_top">수익 분배율</li>
                                <li class="bor_top" style="width: 40%;"><input type="text" name="revenue"/></li>
                                <li class="head bor_top bor_left">계약 시작일</li>
                                <li class="bor_top" style="width: 24%;"><input type="text" name="contract_start"/></li>
                                <li class="head bor_top">계약 만료일</li>
                                <li class="bor_top" style="width: 40%;"><input type="text" name="contract_expire"/></li>
                                
                                <li class="head bor_left">제목</li>
                                <li><input type="text" name="title"/></li>
                                <li id="rich_editor" class="bor_left"></li>
                                <input type="hidden" name="content" value=""/>
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


    <!-- -------------------------------------------select_approval_form start------------------------------------------ -->
    <div id="approval_light_box">
        <div class="select_form_box">
            <div class="form_box_inner">
                <div class="cancel_box">
                    <svg width="32" height="32" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M6.758 17.243L12.001 12m5.243-5.243L12 12m0 0L6.758 6.757M12.001 12l5.243 5.243"/></svg>
                </div>
                <h3>결재양식 선택</h3>
                <div class="select_form">
                    <div class="left_box">
                        <ul>
                            <li><span><svg width="12" height="12" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path fill="#FFA000" d="M40 12H22l-4-4H8c-2.2 0-4 1.8-4 4v8h40v-4c0-2.2-1.8-4-4-4"/><path fill="#FFCA28" d="M40 12H8c-2.2 0-4 1.8-4 4v20c0 2.2 1.8 4 4 4h32c2.2 0 4-1.8 4-4V16c0-2.2-1.8-4-4-4"/></svg> 일반</span>
                                <ul>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 기안서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 품의서</span></li>
                                </ul>
                            </li>
                            <li><span><svg width="12" height="12" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path fill="#FFA000" d="M40 12H22l-4-4H8c-2.2 0-4 1.8-4 4v8h40v-4c0-2.2-1.8-4-4-4"/><path fill="#FFCA28" d="M40 12H8c-2.2 0-4 1.8-4 4v20c0 2.2 1.8 4 4 4h32c2.2 0 4-1.8 4-4V16c0-2.2-1.8-4-4-4"/></svg> 휴가</span>
                                <ul>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 휴가신청서</span></li>
                                </ul>
                            </li>
                            <li><span><svg width="12" height="12" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><path fill="#FFA000" d="M40 12H22l-4-4H8c-2.2 0-4 1.8-4 4v8h40v-4c0-2.2-1.8-4-4-4"/><path fill="#FFCA28" d="M40 12H8c-2.2 0-4 1.8-4 4v20c0 2.2 1.8 4 4 4h32c2.2 0 4-1.8 4-4V16c0-2.2-1.8-4-4-4"/></svg> 계약</span>
                                <ul>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음원 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음원 계약 취소 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음반 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 음반 계약 취소 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 저작권 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 저작권 계약 취소 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 고객사 계약 신청서</span></li>
                                    <li><span><svg width="12" height="12" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><g fill="#f4ae7f"><path d="M52.11 58.32c0 3.056-2.289 5.531-5.116 5.531H14.379c-2.824 0-5.114-2.476-5.114-5.531V8.447c0-3.059 2.291-5.534 5.114-5.534h32.615c2.827 0 5.116 2.475 5.116 5.534z"/><path d="M30.899 10.509c0 .581-1.158 1.051-2.58 1.051H11.848c-1.426 0-2.582-.47-2.582-1.051v-9.46C9.266.47 10.421 0 11.848 0h16.471c1.422 0 2.58.47 2.58 1.049z"/></g><path fill="#d0d2d3" d="M54.662 56c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69V13.73c0-2.591 2.316-4.69 5.167-4.69h32.959c2.855 0 5.167 2.1 5.167 4.69z"/><path fill="#fff" d="M54.662 52.694c0 2.593-2.312 4.69-5.167 4.69H16.536c-2.851 0-5.167-2.098-5.167-4.69v-42.27c0-2.591 2.316-4.688 5.167-4.688h32.959c2.855 0 5.167 2.098 5.167 4.688z"/><path fill="#d0d2d3" d="M43.1 8.28c0 .312-1.538.566-3.43.566h-21.9c-1.896 0-3.434-.254-3.434-.566V3.185c0-.315 1.538-.566 3.434-.566h21.9c1.892 0 3.43.251 3.43.566z"/><path fill="#35494d" d="M20.07 18.03h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.485h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 5.605h28.562c1.922 0 1.922-2.7 0-2.7H20.07c-1.915 0-1.915 2.7 0 2.7m0 5.48h28.562c1.922 0 1.922-2.698 0-2.698H20.07c-1.915 0-1.915 2.698 0 2.698m0 10.58h13.148c1.916 0 1.916-2.699 0-2.699H20.07c-1.915-.001-1.915 2.699 0 2.699"/></svg> 고객사 계약 취소 신청서</span></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="right_box">
                        <h6>상세정보</h6>
                        <div>
                            <form>
                                <ul>
                                    <li>제목</li>
                                    <li>기안자</li>
                                    <li>기안부서</li>
                                    <li>기안일</li>
                                    <li>보존연한</li>
                                </ul>
                                <ul>
                                    <li class="selected_form_name">&nbsp;</li>
                                    <li>한지훈</li>
                                    <li>지원팀</li>
                                    <li class="cur_date">2023-12-25</li>
                                    <li>5년</li>
                                </ul>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="btn_area">
                    <div class="btn_inner">
                        <button id="form_go" type="submit">확인</button>
                        <button class="cancel_btn">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------select_approval_form end------------------------------------------ -->


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
                                <li>
                                    <span>
                                        <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                        <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 마케팅 본부
                                    </span>
                                    <ul>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 광고팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 한지훈 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 황희찬 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 기획팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 황용하 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 설유린 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 영상/디자인팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <span>
                                        <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                        <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 운영 본부
                                    </span>
                                    <ul>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 물류팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 김민지 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 조영웅 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 저작권 관리팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 정성우 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 계약운영 관리팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <span>
                                        <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                        <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 경영지원 본부
                                    </span>
                                    <ul>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 지원팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 홍길동 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 차재호 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 총무팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 최치언 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <span>
                                                <svg class="plus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M352 240v32c0 6.6-5.4 12-12 12h-88v88c0 6.6-5.4 12-12 12h-32c-6.6 0-12-5.4-12-12v-88h-88c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h88v-88c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v88h88c6.6 0 12 5.4 12 12m96-160v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg>
                                                <svg class="minus" width="12" height="12" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path fill="currentColor" d="M108 284c-6.6 0-12-5.4-12-12v-32c0-6.6 5.4-12 12-12h232c6.6 0 12 5.4 12 12v32c0 6.6-5.4 12-12 12zM448 80v352c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V80c0-26.5 21.5-48 48-48h352c26.5 0 48 21.5 48 48m-48 346V86c0-3.3-2.7-6-6-6H54c-3.3 0-6 2.7-6 6v340c0 3.3 2.7 6 6 6h340c3.3 0 6-2.7 6-6"/></svg> 인사팀
                                            </span>
                                            <ul>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <svg width="14" height="14" viewBox="0 0 1408 1472" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill="#df7ca2" d="M704 128q-144 0-225 106t-81 271q-1 205 132 325q17 16 12 41l-23 48q-11 24-32.5 37.5T396 995q-3 1-126.5 41T138 1080q-84 35-110 73q-28 63-28 319h1408q0-256-28-319q-26-38-110-73q-8-4-131.5-44T1012 995q-69-25-90.5-38.5T889 919l-23-48q-5-25 12-41q133-120 132-325q0-165-81-271T704 128"/>
                                                        </svg> 손흥민 과장
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
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
                            <button onclick="selected_form_go()" id="">확인</button>
                            <button class="cancel_btn">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- -------------------------------------------select_approver end------------------------------------------ -->


    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">

        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
<script>

var firstIdx = 1;
var secondIdx = 2;
var thirdIdx = 3;
var firstOb = 4;
var secondOb = 5;

$('input[name="first_approver"]').val(firstIdx);
$('input[name="second_approver"]').val(secondIdx);
$('input[name="third_approver"]').val(thirdIdx);
$('input[class="observer1"]').val(firstOb);
$('input[class="observer2"]').val(secondOb);

$('#approval_do').on('click',function(event){
	event.stopPropagation();
	var form = document.getElementById("form_info");
	var content = editor.getHTMLCode();
	
	$('input[name="content"]').val(content);
	console.log($('input[name="content"]').val(content));
	console.log((content.length/1024/1024)+'MB');
	if(content.length > (2*1024*1024)){
		// POST 방식은 순수 컨텐츠의 크기가 2MB 이상은 수용하지 못한다.
		// data:image는 별도의 파트가 아닌, 문자열과 함께하는 컨텐츠이기 때문에 2MB가 넘어가면 안된다.
		// 되도록이면 2MB를 넘으면 안되지만, 넘어야 할 경우라면 server.xml에서 조정 가능하다.
		// maxPostSize = -1 (무제한) maxPostSize = 허용바이트
		// <Connector maxPostSize="-1" connectionTimeout="20000" maxParameterCount="1000" port="8080" protocol="HTTP/1.1" redirectPort="8443"/>
		alert('컨텐츠의 크기가 너무 큽니다. 이미지의 갯수나 크기를 줄여 주세요.');
	}else{
		form.submit();
	}
});    

// nav approval select fadeIn
function approval_select_go(){
    $('#approval_light_box').fadeIn(500);
}

// ------------------------------------ approver_select_box start ------------------------------------

var p_text = "";
var splite_text = "";
var member_name = "";
var member_position = "";
var member_team = "";

function approver_select_go(){
    $('#approver_light_box').fadeIn(500);
}

$('.cancel_box').on('click',function(){
    $('#approver_light_box').fadeOut(500);
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
    console.log(member_name);
    console.log(member_position);
    console.log(member_team);
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
        approver_count++;
        approver_class_num++;
        var content = "";
        content += '<li class="name appr_list'+approver_class_num+'">'+member_name+'</li>';
        content += '<li class="position appr_list'+approver_class_num+'">'+member_position+'</li>';
        content += '<li class="team appr_list'+approver_class_num+'">'+member_team+'</li>';
        content += '<li class="del appr_list'+approver_class_num+'"><a href="javascript:" onclick="approver_selected_del(this)" class="appr_list'+approver_class_num+'"><svg width="14" height="14" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg"><path fill="#555" d="M11.5-.031c-1.958 0-3.531 1.627-3.531 3.594V4H4c-.551 0-1 .449-1 1v1H2v2h2v15c0 1.645 1.355 3 3 3h12c1.645 0 3-1.355 3-3V8h2V6h-1V5c0-.551-.449-1-1-1h-3.969v-.438c0-1.966-1.573-3.593-3.531-3.593zm0 2.062h3c.804 0 1.469.656 1.469 1.531V4H10.03v-.438c0-.875.665-1.53 1.469-1.53zM6 8h5.125c.124.013.247.031.375.031h3c.128 0 .25-.018.375-.031H20v15c0 .563-.437 1-1 1H7c-.563 0-1-.437-1-1zm2 2v12h2V10zm4 0v12h2V10zm4 0v12h2V10z"/></svg></a></li>';
        $('.approver_box>ul').append(content);
        
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
        observer_count++;
        observer_class_num++;
        var content = "";
        content += '<li class="name appr_list'+observer_class_num+'">'+member_name+'</li>';
        content += '<li class="position appr_list'+observer_class_num+'">'+member_position+'</li>';
        content += '<li class="team appr_list$'+observer_class_num+'">'+member_team+'</li>';
        content += '<li class="del appr_list'+observer_class_num+'"><a href="javascript:" onclick="approver_selected_del(this)" class="appr_list'+observer_class_num+'"><svg width="14" height="14" viewBox="0 0 26 26" xmlns="http://www.w3.org/2000/svg"><path fill="#555" d="M11.5-.031c-1.958 0-3.531 1.627-3.531 3.594V4H4c-.551 0-1 .449-1 1v1H2v2h2v15c0 1.645 1.355 3 3 3h12c1.645 0 3-1.355 3-3V8h2V6h-1V5c0-.551-.449-1-1-1h-3.969v-.438c0-1.966-1.573-3.593-3.531-3.593zm0 2.062h3c.804 0 1.469.656 1.469 1.531V4H10.03v-.438c0-.875.665-1.53 1.469-1.53zM6 8h5.125c.124.013.247.031.375.031h3c.128 0 .25-.018.375-.031H20v15c0 .563-.437 1-1 1H7c-.563 0-1-.437-1-1zm2 2v12h2V10zm4 0v12h2V10zm4 0v12h2V10z"/></svg></a></li>';
        $('.observer_box>ul').append(content);
        
        $('.observer_box>ul>li.name').each(function(index){
            $(this).attr('data-index',index+1);
        });
     }
}

function approver_selected_del(element){
    var class_value = $(element).attr('class');
    $('li.' + class_value).remove();
    approver_count--;
    $('.approver_box>ul>li.name').each(function(index){
        $(this).attr('data-index',index+1);
    });
}

function observer_selected_del(element){
    var class_value = $(element).attr('class');
    $('li.' + class_value).remove();
    observer_count--;
    $('.observer_box>ul>li.name').each(function(index){
        $(this).attr('data-index',index+1);
    });
}

function selected_form_go(){

}








// ------------------------------------ approver_select_box end --------------------------------------



// ------------------------------------ approval_select_box start ------------------------------------
var dataIndexValue = 0;
var queryNo = window.location.search;
var params = new URLSearchParams(queryNo);
var rcvFormNo = params.get("form_no");
$('input[name="form_no"]').val(rcvFormNo);

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

$('#form_go').on('click',function(){
    if(dataIndexValue == 0){
        alert("양식을 선택해 주세요.");
    } else if(dataIndexValue == 1){
        window.location.href = '/approval/draftDocForm?form_no='+encodeURIComponent(dataIndexValue);
    } else if(dataIndexValue == 2){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 3){
        window.location.href = 'form_two.html';
    } else if(dataIndexValue == 4){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 5){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 6){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 7){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 8){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 9){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 10){
        window.location.href = 'javascript:';
    } else if(dataIndexValue == 11){
        window.location.href = 'javascript:';
    }
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

// ------------------------------------ approval_select_box end ------------------------------------




// nav trigger
$(document).ready(function() {
    $('.dep1').eq(2).trigger('click');
    $('.dep2').eq(8).trigger('click');
    $('.dep3').eq(1).addClass('active');
});
// ----------------------------------- nav toggle start -------------------------------------------
document.addEventListener('DOMContentLoaded', function () {
var dep1Items = document.querySelectorAll('.gnb .dep1[data-index]');
var dep2Items = document.querySelectorAll('.gnb .dep2[data-index]');

dep1Items.forEach(function (item) {
  item.addEventListener('click', function () {
    var dataIndex = item.getAttribute('data-index');
    var targetUl = document.querySelector('.gnb ul[data-index="' + dataIndex + '"]');
    var isActive = targetUl.classList.contains('active');

    // 현재 상태에 따라 토글
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

    // 현재 상태에 따라 토글
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
// ----------------------------------- nav toggle end ---------------------------------------------

// ----------------------------------- datepicker start -------------------------------------------
$( "#testDatepicker" ).datepicker({
    dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dateFormat: 'yy/mm/dd'
});
// ----------------------------------- datepicker end -------------------------------------------

// ----------------------------------- sortation tabs start -------------------------------------------
function tabs(index){
            $('.list_btn>li[data-index='+index+']').addClass('on');
            $('.list_btn>li[data-index!='+index+']').removeClass('on');
            $('.list_box[data-index='+index+']').stop().fadeIn(1000);
            $('.list_box[data-index!='+index+']').css('display','none');
        }

        $('.list_box').each(function(index){
            $(this).attr('data-index',index)
        })

        $('.list_btn>li').each(function(index){
            $(this).attr('data-index',index);
            $(this).click(function(){
                tabs(index);
            })
        })
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
</script>
</html>