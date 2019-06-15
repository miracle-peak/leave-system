<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<%
	String depID = "";
	String depName = "";
	String id = request.getParameter("depID");
	Connection conn=getConn();
	String sql="select * from sys_department where depID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs=pstmt.executeQuery();
	while(rs.next()){
			depID = rs.getString(1);
			depName = rs.getString(2);
	}
	close(rs,pstmt,conn);

%>      
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改二级学院信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_editCollege.jsp">  
		      <div class="form-group">
			        <div class="label">
			          <label>二级学院编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=depID%>" name="depID" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      <div class="form-group">
		      	<div class="label">
		          <label>名称：</label>
		        </div>
		        <div class="field">
		          <input type="text" class="input w50" value="<%=depName%>" name="depName" data-validate="required:请输入名称" />
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