<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %> 
<%
	request.setCharacterEncoding("utf-8");
	String stuID = request.getParameter("stuID");
	String classID = request.getParameter("classID");
	String stuName = request.getParameter("stuName");
	String sex = request.getParameter("sex");
	String address = request.getParameter("address");
	String stuTel = request.getParameter("stuTel");
	String contact = request.getParameter("contact");
	String contactTel = request.getParameter("contactTel");
	String password = request.getParameter("newpass");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "insert into sys_student(stuID, classID, stuName, sex, address, stuTel, contact, contactTel, password) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	conn = getConn();
	//2.3:由给定Connection类型的连接对象conn执行SQL指令的PrepareStatement类型的对象pstmt
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, stuID);
	pstmt.setString(2, classID);
	pstmt.setString(3, stuName);
	pstmt.setString(4, sex);
	pstmt.setString(5, address);
	pstmt.setString(6, stuTel);
	pstmt.setString(7, contact);
	pstmt.setString(8, contactTel);
	pstmt.setString(9, password);
	//2.4:PrepareStatement类型的对象pstmt执行SQL查询语句并返回结果
	pstmt.executeUpdate();
	close(pstmt,conn);
	request.getRequestDispatcher("student_list.jsp").forward(request, response);
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