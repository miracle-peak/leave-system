<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/base/base.jsp" %>  
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加辅导员信息</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_addInstructor.jsp">  
		   		<div class="form-group">
			        <div class="label">
			          <label>辅导员编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="instID" data-validate="required:请输入辅导员编号"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      <div class="form-group">
			        <div class="label">
			          <label>姓名：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="instName" data-validate="required:请输入姓名"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
				<div class="form-group">
		          <div class="label">
		            <label>所属二级学院编号：</label>
		          </div>
		          <div class="field">
		            <select name="depID" class="input w50">
<!-- 		            	<option value="">请选择所属二级学院编号</option> -->
                       		<%
								request.setCharacterEncoding("utf-8");
								String depID = "";
								String sql = "select depID from sys_department";
								Connection conn = getConn();
									//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
									PreparedStatement pstmt = conn.prepareStatement(sql);
									//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
									ResultSet rs = pstmt.executeQuery();
									while(rs.next()){
										depID = rs.getString(1);
							
							%> 
                       		<option value="<%=depID%>"><%=depID%></option>
							<%
								}
								close(rs, pstmt, conn);
							%>
		            </select>
<!-- 		            <div class="tips">不选择默认为第一条</div> -->
		          </div>
		        </div>
		      	<div class="form-group">
			        <div class="label">
			          <label>联系电话：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="" name="telephone" data-validate="required:请输入联系电话"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label for="sitename">辅导员密码：</label>
			        </div>
			        <div class="field">
			          <input type="password" class="input w50" name="password" size="50" placeholder="请输入辅导员密码：" data-validate="required:请输入辅导员密码：,length#>=5:新密码不能小于5位" />         
			        </div>
			      </div>
			      <div class="form-group">
			        <div class="label">
			          <label for="sitename">确认密码：</label>
			        </div>
			        <div class="field">
			          <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入密码" data-validate="required:请再次输入密码,repeat#newpass:两次输入的密码不一致" />          
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