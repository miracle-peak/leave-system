<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String courseID = request.getParameter("courseID");
	String classID = request.getParameter("classID");
	String courseName = request.getParameter("courseName");
	String year = request.getParameter("year");
	String term = request.getParameter("term");
	int hour = Integer.parseInt(request.getParameter("hour"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "update sys_course set classID = ?, courseName = ?, year = ?, term = ? , hour = ? where courseID = ?";
	conn = getConn();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, classID);
	pstmt.setString(2, courseName);
	pstmt.setString(3, year);
	pstmt.setString(4, term);
	pstmt.setInt(5, hour);
	pstmt.setString(6, courseID);
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