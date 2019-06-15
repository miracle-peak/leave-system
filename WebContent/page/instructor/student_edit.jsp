<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String stuID = request.getParameter("stuID");
	String classID = "";
	String stuName = "";
	String sex = "";
	String address = "";
	String stuTel = "";
	String contact = "";
	String contactTel = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from sys_student where stuID = ?";
	conn = getConn();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, stuID);
	rs = pstmt.executeQuery();
	while(rs.next()){
		stuID = rs.getString(1);
		classID = rs.getString(2);
		stuName = rs.getString(3);
		sex = rs.getString(4);
		address = rs.getString(5);
		stuTel = rs.getString(6);
		contact = rs.getString(7);
		contactTel = rs.getString(8);
	}
	close(rs, pstmt, conn);
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改学生信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_editStudent.jsp">  
		   		<div class="form-group">
			        <div class="label">
			          <label>学号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=stuID %>" name="stuID" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		   		<div class="form-group">
			        <div class="label">
			          <label>班级编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=classID %>" name="classID" data-validate="required:请输入班级编号"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      <div class="form-group">
			        <div class="label">
			          <label>姓名：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=stuName %>" name="stuName" data-validate="required:请输入姓名"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
				<div class="form-group">
			        <div class="label">
			          <label>性别：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=sex %>" name="sex" data-validate="required:请输入性别"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>通讯地址：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=address %>" name="address" data-validate="required:请输入通讯地址"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>学生电话：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=stuTel %>" name="stuTel" data-validate="required:请输入学生电话<"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>联系人：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=contact %>" name="contact" data-validate="required:请输入联系人"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>联系人电话：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=contactTel %>" name="contactTel" data-validate="required:请输入联系人电话"/>
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