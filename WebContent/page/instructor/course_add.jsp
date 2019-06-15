<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %> 
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加课程信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_addCourse.jsp">  
		   		<div class="form-group">
			        <div class="label">
			          <label>课程编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="courseID" data-validate="required:请输入课程编号"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
		          <div class="label">
		            <label>班级编号：：</label>
		          </div>
		          <div class="field">
		            <select name="classID" class="input w50">
<!-- 		            	<option value="">请选择班级编号</option> -->
                       		<%
								request.setCharacterEncoding("utf-8");
								String classID = "";
								String sql = "select classID from sys_classes";
								Connection conn = getConn();
									//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
									PreparedStatement pstmt = conn.prepareStatement(sql);
									//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
									ResultSet rs = pstmt.executeQuery();
									while(rs.next()){
										classID = rs.getString(1);
							
							%> 
                       		<option value="<%=classID%>"><%=classID%></option>
							<%
								}
								close(rs, pstmt, conn);
							%>
		            </select>
		            <div class="tips"></div>
		          </div>
		        </div>
		      <div class="form-group">
			        <div class="label">
			          <label>课程名称：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="courseName" data-validate="required:请输入课程名称"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
				<div class="form-group">
			        <div class="label">
			          <label>学年：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="year" data-validate="required:请输入学年"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>学期：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="term" data-validate="required:请输入学期"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>学时：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="hour" data-validate="required:请输入学时"/>
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