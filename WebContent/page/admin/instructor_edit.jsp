<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>   
<%
	request.setCharacterEncoding("utf-8");
	String instID = request.getParameter("instID");
	String instName = "";
	String depID = "";
	String telephone = "";
	Connection conn=getConn();
	String sql="select * from sys_instructor where instID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, instID);
	ResultSet rs=pstmt.executeQuery();
	while(rs.next()){
			instID = rs.getString(1);
			instName = rs.getString(2);
			depID = rs.getString(3);
			telephone = rs.getString(4);
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改辅导员信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_editInstructor.jsp">  
		   		<div class="form-group">
			        <div class="label">
			          <label>辅导员编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=instID%>" name="instID" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      <div class="form-group">
			        <div class="label">
			          <label>姓名：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=instName%>" name="instName" data-validate="required:请输入姓名"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
				<div class="form-group">
			        <div class="label">
			          <label>所属二级学院编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=depID%>" name="depID" data-validate="required:请输入所属二级学院编号"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>联系电话：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=telephone%>" name="telephone" data-validate="required:请输入联系电话"/>
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