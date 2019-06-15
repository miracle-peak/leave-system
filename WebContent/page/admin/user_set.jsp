<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>    
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		<title></title>
		<link rel="stylesheet" href="<%=path %>/css/pintuer.css">
		<link rel="stylesheet" href="<%=path %>/css/admin.css">
		<script src="<%= basePath%>/js/jquery.js"></script>
		<script src="<%= basePath%>/js/pintuer.js"></script>
	</head>
	<body>
	<div class="panel admin-panel">
	  <div class="body-content">
	    <form method="post" class="form-x" action="action_setUser.jsp" target="_parent">
	    	<div class="form-group">
		        <div class="label">
		          <label>管理员姓名：</label>
		        </div>
		        <div class="field">
		          <input type="text" class="input w50" name="fullname" value="" data-validate="required:请输入管理员姓名"/>
		          <div class="tips"></div>
		        </div>
	      </div>
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">原始密码：</label>
	        </div>
	        <div class="field">
	          <input type="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />       
	        </div>
	      </div>      
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">新密码：</label>
	        </div>
	        <div class="field">
	          <input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />         
	        </div>
	      </div>
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">确认新密码：</label>
	        </div>
	        <div class="field">
	          <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />          
	        </div>
	      </div>
	      <div class="form-group">
		        <div class="label">
		          <label>手机号信息：</label>
		        </div>
		        <div class="field">
		          <input type="text" class="input w50" name="telephone" value="" data-validate="required:请输入手机号信息" />
		          <div class="tips"></div>
		        </div>
	      </div>
	      <div class="form-group">
	        <div class="label">
	          <label></label>
	        </div>
	        <div class="field">
	          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>   
	        </div>
	      </div>      
	    </form>
	  </div>
	</div>
	</body>
</html>