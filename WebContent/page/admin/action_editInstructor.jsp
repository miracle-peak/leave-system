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
	Connection conn=getConn();
	String sql="update sys_instructor set instName = ? ,depID = ?, telephone = ? where instID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, instName);
	pstmt.setString(2, depID);
	pstmt.setString(3, telephone);
	pstmt.setString(4, instID);
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