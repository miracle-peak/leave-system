<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.text.SimpleDateFormat, java.util.Date,
    java.util.Random"%>
<%@ include file="/base/base.jsp" %>
<%@ include file="/base/database.jsp" %>  
<%
	Date t = new Date();
	SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// 设置三位数的随机数
	int num = (int)(Math.random()*900)+100;
	request.getSession().setAttribute("applytime", d.format(t));
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
		<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
	</head>
	<body>
		<div class="panel admin-panel">
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>填写请假信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_writeLeave.jsp">  
		    	<div class="form-group">
			        <div class="label">
			          <label>请假编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%= d.format(t)+num %>" name="leaveID" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
		          <div class="label">
		            <label>请假课程编号：</label>
		          </div>
		          <div class="field">
		            <select name="courseID" class="input w50">
<!-- 		            	<option value="">请选择课程编号</option> -->
                       		<%
								request.setCharacterEncoding("utf-8");
								String courseID = "";
								String sql = "select courseID from sys_course";
								Connection conn = getConn();
									//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
									PreparedStatement pstmt = conn.prepareStatement(sql);
									//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
									ResultSet rs = pstmt.executeQuery();
									while(rs.next()){
										courseID = rs.getString(1);
							
							%> 
                       		<option value="<%=courseID%>"><%=courseID%></option>
							<%
									request.setAttribute("course_ID", rs.getString(1));
								}
								close(rs, pstmt, conn);
							%>
		            </select>
		            <div class="tips"></div>
		          </div>
		        </div>
		   		<div class="form-group">
			        <div class="label">
			          <label>请假天数：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="daynum" data-validate="required:请输入请假天数"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>请假时间：</label>
			        </div>
			        <div class="field">
			        
			        <input type="text" class="input w50" id="applytime" name="applytime" value="<%=d.format(t) %>" />
			        
			         <%--  <input type="text" class="input w50" value="<%=d.format(t) %>" name="applytime" readonly="readonly"/>--%>
			          <div class="tips"></div> 
			          
			        </div>
		      	</div>
				<div class="form-group">
					<div class="label">
					  <label>请假事由：</label>
					</div>
					<div class="field">
					  <textarea name="reason" class="input" style="height:450px; border:1px solid #ddd;" data-validate="required:请输入请假事由"></textarea>
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
		<script src="<%= basePath%>/laydate/laydate.js"></script>
		<script type="text/javascript">
		     laydate.render({
		       elem: '#applytime'
		      ,type: 'datetime'
		     });
		</script>
	</body>
</html>