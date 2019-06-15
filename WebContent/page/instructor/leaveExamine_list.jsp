<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
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
		<script type="text/javascript" src="<%=path %>/layer/layer.js"></script>
		<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
		<script src="<%= basePath%>/js/pintuer.js"></script>
	</head>
	<body>
		<form method="post" action="leaveExamine_list.jsp" id="listform">
		  <div class="panel admin-panel">
		    <div class="panel-head"><strong class="icon-reorder"> 请假信息列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
		    <div class="padding border-bottom">
		      <ul class="search" style="padding-left:10px;">
		        <li>
		          <input type="text" placeholder="请输入学号" name="name" class="input" style="width:250px; line-height:17px;display:inline-block" />
		          <input type="submit" class="button border-main icon-search" value="查询请假信息"></li>
		      </ul>
		    </div>
		    <table class="table table-hover text-center">
		      <tr>
		      	<th>请假编号</th>
		        <th>课程编号</th>
		        <th>请假事由</th>
		        <th>天数</th>
		        <th>学号</th>
		        <th>请假时间</th>
		        <th>状态</th>
		        <th>审核时间</th>
		        <th>审核意见</th>
		        <th width="310">操作</th>
		      </tr>
		      <volist name="list" id="vo">
				<tr>
				<%
		       		request.setCharacterEncoding("utf-8");
		       		String leaveID = "";
		       		String courseID = "";
		       		String reason = "";
		       		String daynum = "";
		       		String stuNo = "";
		       		String applytime = "";
		       		String status = "";
		       		String audittime = "";
		       		String opinion = "";
		       		String query = request.getParameter("name");
					String sql = "select * from sys_leave where status = '0' ";
		       		if(query!=null){
		       			sql = sql+" and stuNo like '%"+query+"%'";
		       		}
		       		Connection conn = getConn();
		       		//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
		       		PreparedStatement pstmt = conn.prepareStatement(sql);
		       		//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
		       		ResultSet rs = pstmt.executeQuery();
		       		while(rs.next()){
		       			leaveID = rs.getString(1);
		       			courseID = rs.getString(2);
		       			reason = rs.getString(3);
		       			daynum = rs.getString(4);
		       			stuNo = rs.getString(5);
		       			applytime = rs.getString(6);
		       			status = rs.getString(7);
		       			audittime = rs.getString(8);
		       			opinion = rs.getString(9);
		       			if(status != null){
		       				if("0".equals(status)){
		       					status = "未审核";
		       				}else if("1".equals(status)){
		       					status = "同意";
		       				}else if("2".equals(status)){
		       					status = "不同意";
		       				}
		       			}
		       			if(audittime == null){
		       				audittime = "";
		       			}
		       			if(opinion == null){
		       				opinion = "";
		       			}
		       		
				%>
		          	<td><%=leaveID %></td>
					<td><%=courseID %></td>
					<td><%=reason %></td>
					<td><%=daynum %></td>
					<td><%=stuNo %></td>
					<td><%=applytime %></td>
					<td><%=status %></td>
					<td><%=audittime %></td>
		          	<td><%=opinion %></td>
		          	
<%-- 		          	<td><div class="button-group"> <a class="button border-main" href="leave_preview.jsp?leaveID=<%=leaveID%>"><span class="icon-edit"></span> 预览</a>  </div></td> --%>
		          	<td><div class="button-group"> <button id ="test" class="button border-main" type="button" onclick = "Eject()">预览</button></div></td>
<!-- 		           <td><div class="button-group"> <input  id ="preview_btn" class="button border-main" type="button" value="预览 "  ></div></td> -->
		        </tr>
		          <%
					}
		       		close(rs, pstmt, conn);
		          %>
		      <tr>
		        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
		      </tr>
		    </table>
		  </div>
		</form>
	</body>
		<script type="text/javascript">
		
	 	function Eject() {
				 layer.open({
					  type: 2,
					  title: '请假详情',
					  shadeClose: true,
					  shade: 0.8,
					  area: ['60%', '90%'],
					  content: 'leave_preview1.jsp?leaveID=<%=leaveID%>' //iframe的url
					}); 
		}
		
		
		
// 			layer.open({
// 				  type: 1,
// 				  skin: 'layui-layer-rim', //加上边框
// 				  area: ['420px', '240px'], //宽高
<%-- 				  content: '<%=basePath%>/page/instructor/leave_preview1.jsp' --%>
// 				});
					

			 
		</script>
</html>