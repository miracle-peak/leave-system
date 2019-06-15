<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");
	String leaveID = request.getParameter("leaveID");
	String courseID = request.getParameter("courseID");
	if(courseID==null||courseID.equals("")){
		System.out.println(courseID);
		courseID = (String)request.getAttribute("course_ID");
	}
	String reason = request.getParameter("reason");
	String daynum = request.getParameter("daynum");
	String stuNo = (String)request.getSession().getAttribute("name");
	String applytime = (String)request.getSession().getAttribute("applytime");
	String status = "0";
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "insert into sys_leave(leaveID, courseID, reason, daynum, stuNo, applytime, status) values(?, ?, ?, ?, ?, ?, ?)";
	conn = getConn();
	//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, leaveID);
	pstmt.setString(2, courseID);
	pstmt.setString(3, reason);
	pstmt.setString(4, daynum);
	pstmt.setString(5, stuNo);
	pstmt.setString(6, applytime);
	pstmt.setString(7, status);
	//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
	pstmt.executeUpdate();
	close(pstmt,conn);
	request.getRequestDispatcher("leave_list.jsp").forward(request, response);
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