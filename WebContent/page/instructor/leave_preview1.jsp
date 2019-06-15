<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.text.SimpleDateFormat, java.util.Date,
    java.util.Random"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String leaveID = request.getParameter("leaveID");
	String courseID = "";
	String reason = "";
	String daynum = "";
	String stuNo = "";
	// 生成审核时间
	String applytime = "";
	Date t = new Date();
	SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	request.getSession().setAttribute("audittime", d.format(t));
	String audittime = d.format(t);
	String opinion = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from sys_leave where leaveID = ?";
	conn = getConn();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, leaveID);
	rs = pstmt.executeQuery();
	while(rs.next()){
		leaveID = rs.getString(1);
		courseID = rs.getString(2);
		reason = rs.getString(3);
		daynum = rs.getString(4);
		stuNo = rs.getString(5);
		applytime = rs.getString(6);
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
		  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>审核请假申请</strong></div>
		  <div class="body-content">
		    <form method="post" class="form-x" action="action_previewLeave.jsp">  
		   		<div class="form-group">
			        <div class="label">
			          <label>请假编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=leaveID %>" name=leaveID readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		   		<div class="form-group">
			        <div class="label">
			          <label>班级编号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=courseID %>" name="courseID" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
					<div class="label">
					  <label>请假事由：</label>
					</div>
					<div class="field">
					  <textarea name="reason" class="input"  readonly="readonly" style="height:260px; border:1px solid #ddd;"><%=reason %></textarea>
					  <div class="tips"></div>
					  </div>
				</div>
				<div class="form-group">
			        <div class="label">
			          <label>请假天数：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=daynum %>" name="daynum" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>学号：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=stuNo %>" name="stuNo" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>请假时间：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=applytime %>" name="applytime" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>	
		      	<div class="form-group">
			        <div class="label">
			          <label>审核时间：</label>
			        </div>
			        <div class="field">
			          <input type="text" class="input w50" value="<%=audittime %>" name="audittime" readonly="readonly"/>
			          <div class="tips"></div>
			        </div>
		      	</div>
		      	<div class="form-group">
			        <div class="label">
			          <label>审核状态：</label>
			        </div>
			        <div class="field">
			          <div class="button-group radio">
			          
			          <label class="button active">
			         	  <span class="icon icon-check"></span>             
			              <input name="status" value="1" type="radio" checked="checked">同意             
			          </label>             
			        
			          <label class="button active"><span class="icon icon-times"></span>          	
			              <input name="status" value="2"  type="radio" >不同意
			          </label>         
			           </div>       
			        </div>
			    </div>
		      	<div class="form-group">
					<div class="label">
					  <label>审核意见：</label>
					</div>
					<div class="field">
					  <textarea name="opinion" class="input" style="height:260px; border:1px solid #ddd;"></textarea>
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