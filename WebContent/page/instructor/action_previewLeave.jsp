<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");
	String leaveID = request.getParameter("leaveID");
	String status = request.getParameter("status");
	String opinion = request.getParameter("opinion");
	String audittime = (String)request.getSession().getAttribute("audittime");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "update sys_leave set status = ? , opinion = ?, audittime = ?  where leaveID = ? ";
	conn = getConn();
	//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, status);
	pstmt.setString(2, opinion);
	pstmt.setString(3, audittime);
	pstmt.setString(4, leaveID);
	//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
	pstmt.executeUpdate();
	close(pstmt,conn);
	request.getRequestDispatcher("leaveExamine_list.jsp").forward(request, response);
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