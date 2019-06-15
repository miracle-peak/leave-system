<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>    
<%
	String instID = request.getParameter("instID");
	Connection conn=getConn();
	String sql="delete from sys_instructor where instID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, instID);
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