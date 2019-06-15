<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String courseID = request.getParameter("courseID");
	String classID = "";
	String courseName = "";
	String year = "";
	String term = "";
	int hour = 0;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from sys_course where courseID = ?";
	conn = getConn();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, courseID);
	rs = pstmt.executeQuery();
	while(rs.next()){
		courseID = rs.getString(1);
		classID = rs.getString(2);
		courseName = rs.getString(3);
		year = rs.getString(4);
		term = rs.getString(5);
		hour =  rs.getInt("hour");
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改课程信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_editCourse.jsp">  
		   		<div class="form-group">
			        <div class="label">
			          <label>课程编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=courseID %>" name="courseID" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		   		<div class="form-group">
			        <div class="label">
			          <label>班级编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=classID %>" name="classID" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      <div class="form-group">
			        <div class="label">
			          <label>课程名称：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=courseName %>" name="courseName" data-validate="required:请输入课程名称"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
				<div class="form-group">
			        <div class="label">
			          <label>学年：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=year %>" name="year" data-validate="required:请输入学年"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>学期：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=term %>" name="term" data-validate="required:请输入学期"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>学时：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=hour %>" name="hour" data-validate="required:请输入学时"/>
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