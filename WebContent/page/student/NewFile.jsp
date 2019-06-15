<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp" %>
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>填写请假信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_addstudent.jsp">  
		   		<div class="form-group">
			        <div class="label">
			          <label>学号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="stuID" data-validate="required:请输入学号"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		   		<div class="form-group">
			        <div class="label">
			          <label>班级编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="classID" data-validate="required:请输入班级编号"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      <div class="form-group">
			        <div class="label">
			          <label>姓名：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="stuName" data-validate="required:请输入姓名"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
				<div class="form-group">
			        <div class="label">
			          <label>性别：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="sex" data-validate="required:请输入性别"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>通讯地址：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="address" data-validate="required:请输入通讯地址"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>学生电话：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="stuTel" data-validate="required:请输入学生电话"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>联系人：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="contact" data-validate="required:请输入联系人"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>联系人电话：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="contactTel" data-validate="required:请输入联系人电话"/>
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