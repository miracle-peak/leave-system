<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String calssID = request.getParameter("calssID");
	String className = request.getParameter("className");
	String depID = request.getParameter("depID");
	String major = request.getParameter("major");
	String grade = request.getParameter("grade");
	Connection conn = getConn();
	String sql="update sys_classes set className = ? ,depID = ?, major = ?, grade = ?  where classID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, className);
	pstmt.setString(2, depID);
	pstmt.setString(3, major);
	pstmt.setString(4, grade);
	pstmt.setString(5, calssID);
	pstmt.executeUpdate();
	close(pstmt,conn);
	request.getRequestDispatcher("class_list.jsp").forward(request, response);
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