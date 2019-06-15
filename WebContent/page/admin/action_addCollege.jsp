<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");
	String depID = request.getParameter("depID");
	String depName = request.getParameter("depName");
	Connection conn = getConn();
	String sql = "insert into sys_department(depID,depName) values(?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, depID);
	pstmt.setString(2, depName);
	pstmt.executeUpdate();
	close(pstmt,conn);
    //3:跳转到二级学院列表页面(college_list.jsp)
    request.getRequestDispatcher("/page/admin/college_list.jsp").forward(request, response);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>