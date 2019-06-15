<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>   
<%
	request.setCharacterEncoding("utf-8");
	String depID = request.getParameter("depID");
	String depName = request.getParameter("depName");
	Connection conn=getConn();
	String sql="update sys_department set depName = ? where depID=?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, depName);
	pstmt.setString(2, depID);
	pstmt.executeUpdate();
	close(pstmt,conn);
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