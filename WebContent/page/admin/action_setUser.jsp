<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<%
	String passwordFirst = request.getParameter("newpass");     // 第一次输入的新密码
	String passwordSecond = request.getParameter("renewpass");  // 第二次输入的新密码
	String oldPassword = request.getParameter("mpass");         // 用户输入的原始密码
	String fullname = request.getParameter("fullname");         // 管理员姓名
	String telephone = request.getParameter("telephone");       // 手机号信息
	String userid = (String)request.getSession().getAttribute("name"); // 获取登录页面的用户账号
	String utype = (String)request.getSession().getAttribute("utype"); // 获取登录页面的用户类型
	if(utype.equals("0")){
		utype = "student";
	}
	if(utype.equals("1")){
		utype = "instructor";
	}
	if(utype.equals("2")){
		utype = "user";
	}
	String password = "";   // 数据库的用户原始密码           
	// 通过登录页面的用户账号来获取用户原始密码
	Connection conn = getConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select password from sys_"+utype+" where userid = ?";
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		while(rs.next()){
			password = rs.getString(1);
		}
		if (password.equals(oldPassword)) {
			String s = "update sys_"+utype+" set password = '"+passwordFirst+"' where userid = '"+userid+"'";
			pstmt = conn.prepareStatement(s);
			pstmt.executeUpdate();
// 			request.getSession().invalidate();
			session.invalidate();
			response.sendRedirect("../../login.jsp");
		}else{
			request.getRequestDispatcher("tips.jsp").forward(request, response);
		}
	}
	catch(Exception e){
		throw e;
	}
	finally{
		close(rs,pstmt,conn);
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>change</title>
	</head>
	<body>
	
	</body>
</html>