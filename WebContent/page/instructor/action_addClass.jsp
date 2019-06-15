<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String classID = request.getParameter("classID");
	String className = request.getParameter("className");
	String depID = request.getParameter("depID");
	String major = request.getParameter("major");
	String grade = request.getParameter("grade");
	Connection conn=getConn();
	String sql="insert into sys_classes(classID, className, depID, major, grade) values(?, ?, ?, ?, ?)";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, classID);
	pstmt.setString(2, className);
	pstmt.setString(3, depID);
	pstmt.setString(4, major);
	pstmt.setString(5, grade);
	pstmt.executeUpdate();
	close(pstmt,conn);
    request.getRequestDispatcher("/page/instructor/class_list.jsp").forward(request, response);
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