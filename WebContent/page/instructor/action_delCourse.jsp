<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");
	String courseID = request.getParameter("courseID");
	String sql = "delete from sys_course where courseID=? ";
	Connection conn = getConn();
	//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, courseID);
	//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
	pstmt.executeUpdate();
	close(pstmt,conn);
	request.getRequestDispatcher("course_list.jsp").forward(request, response);
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