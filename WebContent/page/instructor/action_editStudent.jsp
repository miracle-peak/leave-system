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
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "update sys_student set classID = ?, stuName = ?, sex = ?, address = ? , stuTel = ? ,contact = ? , contactTel = ? where stuID = ?";
	conn = getConn();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, classID);
	pstmt.setString(2, stuName);
	pstmt.setString(3, sex);
	pstmt.setString(4, address);
	pstmt.setString(5, stuTel);
	pstmt.setString(6, contact);
	pstmt.setString(7, contactTel);
	pstmt.setString(8, stuID);
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