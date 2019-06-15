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
		<form method="post" action="export_list.jsp" id="listform">
		  <div class="panel admin-panel">
		    <div class="panel-head"><strong class="icon-reorder">请假信息列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
		    <div class="padding border-bottom">
		      <ul class="search" style="padding-left:10px;">
		        <li> <input type = "button" class = "button border-main icon-plus-square" value = "导出Excel" onclick="tableToExcel('leave_table','leave')"> </li>
		        <li>
 		         <div class="form-group">
                       <div class="field field-icon-right">
                       	<select name="name" class="input" onchange="changesearch()"  style="width:140px; line-height:17px;display:inline-block">
<!--                        		<option value="">请选择班级编号</option> -->
                       		<%
								request.setCharacterEncoding("utf-8");
								String ClassID = "";
								String sql1 = "select classID from sys_classes";
								Connection conn1 = getConn();
									//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
									PreparedStatement pstmt1 = conn1.prepareStatement(sql1);
									//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
									ResultSet rs1 = pstmt1.executeQuery();
									while(rs1.next()){
										ClassID = rs1.getString(1);
							
							%> 
                       		<option value="<%=ClassID%>"><%=ClassID%></option>
							<%
								}
								close(rs1, pstmt1, conn1);
							%>
                       	</select>
                       </div>
                   </div>
<!-- 		          <input type="text" placeholder="请输入班级编号" name="name" class="input" style="width:250px; line-height:17px;display:inline-block" /> -->
		          <input type="submit" class="button border-main icon-search" value="查询请假信息"></li>
		      </ul>
		    </div>
		    <table id = "leave_table" class="table table-hover text-center">
		      <tr>
		      	<th>班级编号</th>
		      	<th>请假编号</th>
		        <th>课程编号</th>
		        <th>请假事由</th>
		        <th>天数</th>
		        <th>学号</th>
		        <th>请假时间</th>
		        <th>状态</th>
		        <th>审核时间</th>
		        <th>审核意见</th>
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
		       		String classID = "";
		       		String query = request.getParameter("name");
		       		// 按照课程表的班级编号查询	
		       		// "SELECT leaveID,a.courseID,reason,daynum,stuNO,applytime,status,audittime,opinion FROM sys_leave a,sys_course b WHERE a.courseID=b.courseID and b.classID=b.classID AND 1 = 1"
		       		// 按照班级表的班级编号查询		
		       		String sql = "SELECT leaveID,a.courseID,reason,daynum,stuNO,applytime,status,audittime,opinion,c.classID FROM sys_leave a,sys_course b,sys_classes c WHERE a.courseID=b.courseID and c.classID=b.classID and 1 = 1";
		       		if(query!=null){
		       			sql = sql+" AND c.classID  like '%"+query+"%'";
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
		       			classID = rs.getString(10);
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
					<td><%=classID %></td>
		          	<td><%=leaveID %></td>
					<td><%=courseID %></td>
					<td><%=reason %></td>
					<td><%=daynum %></td>
					<td><%=stuNo %></td>
					<td><%=applytime %></td>
					<td><%=status %></td>
					<td><%=audittime %></td>
		          	<td><%=opinion %></td>
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
			
			function base64 (content) {
			       return window.btoa(unescape(encodeURIComponent(content)));         
			    }
			    function tableToExcel(tableID,fileName){
			        var table = document.getElementById(tableID);
			      var excelContent = table.innerHTML;
			      var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
			      excelFile += "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>";
			      excelFile += "<body><table>";
			      excelFile += excelContent;
			      excelFile += "</table></body>";
			      excelFile += "</html>";
			      var link = "data:application/vnd.ms-excel;base64," + base64(excelFile);
			      var a = document.createElement("a");
			      a.download = fileName+".xlsx";
			      a.href = link;
			      a.click();
			    }
		</script>
</html>