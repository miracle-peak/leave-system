<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String instID = request.getParameter("instID");
	String instName = request.getParameter("instName");
	String depID = request.getParameter("depID");
	String telephone = request.getParameter("telephone");
	String password = request.getParameter("password");
	Connection conn=getConn();
	String sql="insert into sys_instructor(instID, instName, depID, telephone, password) values(?, ?, ?, ?, ?)";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, instID);
	pstmt.setString(2, instName);
	pstmt.setString(3, depID);
	pstmt.setString(4, telephone);
	pstmt.setString(5, password);
	pstmt.executeUpdate();
	close(pstmt,conn);
    request.getRequestDispatcher("/page/admin/instructor_list.jsp").forward(request, response);
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