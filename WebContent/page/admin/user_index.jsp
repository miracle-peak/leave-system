<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String name = (String)request.getSession().getAttribute("name");
	String uType = (String)request.getSession().getAttribute("utype");
	if(uType.equals("student")){
		uType = "学生";
	}else if(uType.equals("instructor")){
		uType = "辅导员";
	}else if(uType.equals("user")){
		uType = "系统管理员";
	}
%>
<html lang="zh-cn">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	    <meta name="renderer" content="webkit">
	    <title>请假管理系统</title>  
	    <link rel="stylesheet" href="css/pintuer.css">
	    <link rel="stylesheet" href="css/admin.css">
	    <link rel="shortcut icon" href="images/logo.jpg">
	    <script src="js/jquery.js"></script>   
	</head>
	<body style="background-color:#f2f9fd;">
		<div class="header bg-main">
		  <div class="logo margin-big-left fadein-top">
		    <h1><img src="images/logo.jpg" class="radius-circle rotate-hover" height="50" alt="" />请假管理系统</h1>
		  </div>
		  <div class="head-l" ><a href="" target="_blank" style="color:#FFF" ><span class="icon-user"></span> 欢迎 <%=uType %><%=name %></a>&nbsp;&nbsp;<a class="button button-little bg-red" href="login.jsp"><span class="icon-power-off"></span> 退出登录</a> </div>
		</div>
		<div class="leftnav">
		  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>    
		    <h2><span class="icon-user"></span>系统管理员</h2>
		  <ul>
		    <li><a href="page/admin/user_set.jsp" target="right"><span class="icon-caret-right"></span>个人设置</a></li>    
		    <li><a href="page/admin/college_list.jsp" target="right"><span class="icon-caret-right"></span>二级学院信息管理</a></li>
		    <li><a href="page/admin/instructor_list.jsp" target="right"><span class="icon-caret-right"></span>辅导员信息管理</a></li>
		  </ul> 
		</div>
		<script type="text/javascript">
		$(function(){
		  $(".leftnav h2").click(function(){
			  $(this).next().slideToggle(200);	
			  $(this).toggleClass("on"); 
		  })
		  $(".leftnav ul li a").click(function(){
			    $("#a_leader_txt").text($(this).text());
		  		$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
		  })
		});
		</script>
		<ul class="bread">
		  <li><a href="##" id="a_leader_txt">欢迎界面</a></li>
		</ul>
		<div class="admin">
		  <iframe scrolling="auto" rameborder="0" src="page/welcome.jsp" name="right" width="100%" height="100%"></iframe>
		</div>
	</body>
</html>