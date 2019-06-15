<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>    
<%
	String classID = request.getParameter("classID");
	Connection conn=getConn();
	String sql="delete from sys_classes where classID = ?";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, classID);
	pstmt.executeUpdate();
	if(pstmt!=null){
        pstmt.close();
    }
    if(conn!=null){
      conn.close();
    }
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