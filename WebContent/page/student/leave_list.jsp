<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<script src="<%= basePath%>/js/jquery.js"></script>
		<script src="<%= basePath%>/js/pintuer.js"></script>
	</head>
	<body>
		<form method="post" action="leave_list.jsp" id="listform">
		  <div class="panel admin-panel">
		    <div class="panel-head"><strong class="icon-reorder"> 个人请假信息列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
		    <div class="padding border-bottom">
		      <ul class="search" style="padding-left:10px;">
		        <li> <a class="button border-main icon-plus-square-o" href="leave_write.jsp"> 填写请假申请</a> </li>
		        <li>
		          <input type="text" placeholder="请输入请假时间" name="name" class="input" style="width:250px; line-height:17px;display:inline-block" />
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
		       		String stuNo = (String)request.getSession().getAttribute("name");
		       		String applytime = "";
		       		String status = "";
		       		String audittime = "";
		       		String opinion = "";
		       		String query = request.getParameter("name");
		       		String sql = "select * from sys_leave where stuNo = ? and status = '0'";
		       		if(query!=null){
		       			sql = sql+" and applytime like '%"+query+"%'";
		       		}
		       		Connection conn = getConn();
		       		//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
		       		PreparedStatement pstmt = conn.prepareStatement(sql);
		       		pstmt.setString(1, stuNo);
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
		       			
		       			if(audittime==null){
		       				audittime = "";
		       			}
		       			if(opinion==null||opinion.equals("")){
		       				if("1".equals(status)||"2".equals(status)){
		       					opinion = "无";
		       				}else{
		       					opinion = "";
		       				}
		       			}
		       			if(status != null){
		       				if("0".equals(status)){
		       					status = "未审核";
		       				}else if("1".equals(status)){
		       					status = "同意";
		       				}else if("2".equals(status)){
		       					status = "不同意";
		       				}
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
		          	
		          <td><div class="button-group">  <a class="button border-red" href="action_delLeave.jsp?leaveID=<%=leaveID%>" onclick="return del()"><span class="icon-trash-o"></span> 删除</a> </div></td>
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
		 <!-- 分页显示 -->
	 	<%-- 	<div>
			  <div align="center">
				<c:choose>
					<c:when test="${Paging.hasPre}">
					  <a href="GetDiaryListServlet?currentPage=1">首页</a> | 
					  <a href="GetDiaryListServlet?currentPage=${Paging.currentPage-1 }">上一页</a>
					</c:when>
					<c:otherwise>
						首页 | 上一页
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${Paging.hasNext}">
					<a href="GetDiaryListServlet?currentPage=${Paging.currentPage + 1 }">下一页</a> | 
				<a href="GetDiaryListServlet?currentPage=${Paging.totalPage }">尾页</a>
				</c:when>
				<c:otherwise>
					下一页 | 尾页
				</c:otherwise>
				</c:choose>
				当前为第${Paging.currentPage}页,共${Paging.totalPage}页
			  </div>
			</div> --%>
		</body>
		<script type="text/javascript">
			function del(){
				var r = confirm("您确定要删除吗?");
				if(r==true){
					alert("删除成功");
					return r;
				}else{
					return r;
				}
			}
		</script>
</html>