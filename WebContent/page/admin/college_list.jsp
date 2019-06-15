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
		<script src="<%= basePath%>/js/jquery.js"></script>
		<script src="<%= basePath%>/js/pintuer.js"></script>
	</head>
	<body>
		<form method="post" action="college_list.jsp" id="listform">
		  <div class="panel admin-panel">
		    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
		    <div class="padding border-bottom">
		      <ul class="search" style="padding-left:10px;">
		        <li> <a class="button border-main icon-plus-square-o" href="college_add.jsp"> 添加二级学院信息</a> </li>
		         <li>
          			<input type="text" placeholder="请输入二级学院名称" name="name" class="input" style="width:250px; line-height:17px;display:inline-block" />
          			<input type="submit" class="button border-main icon-search" value="查询二级学院信息"></li>
		      </ul>
		    </div>
		    <table class="table table-hover text-center">
		      <tr>
		        <th>二级学院编号</th>
		        <th>名称</th>
		        <th width="310">操作</th>
		      </tr>
		      <volist name="list" id="vo">
				<tr>
				<%
		       		request.setCharacterEncoding("utf-8");
		       		String depID = "";
		       		String depName = "";
		       		String query = request.getParameter("name");
					String sql = "select * from sys_department where 1=1";
					if(query!=null){
		       			sql = sql+" and depName like '%"+query+"%'";
		       		}
					//2:查询数据库记录
					//2.1 加载驱动
					Connection conn = getConn();
					//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
					PreparedStatement pstmt = conn.prepareStatement(sql);
		
					//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
					ResultSet rs = pstmt.executeQuery();
		       		while(rs.next()){
		       			depID = rs.getString(1);
		       			depName = rs.getString(2);
		       		
				%>
		          <td><%=depID %></td>
		          <td><%=depName %></td>
		          
		          <td><div class="button-group"> <a class="button border-main" href="college_edit.jsp?depID=<%=depID%>"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="action_delCollege.jsp?depID=<%=depID%>" onclick="return del()"><span class="icon-trash-o"></span> 删除</a> </div></td>
		        </tr>
		          <%
					}
		       		close(rs,pstmt,conn);
		          %>
		      <tr>
		        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
		      </tr>
		    </table>
		  </div>
		</form>
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