<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/base/base.jsp"%>
<%@ include file="/base/database.jsp" %>
<%
	String utype = request.getParameter("utype");
	String user = "";  // 登录用户类型
	String name = "";  // 登录用户账号
	String password = "";  // 登录用户密码
	String userID = ""; // 数据库的用户账号字段
	String filePath = ""; // 文件模块路径
	Connection conn = getConn();
	Statement stmt = null;
	ResultSet rs = null;

	if(utype.equals("0")){
		user = "student";
		userID = "stuID";
		filePath = "student";
	}
	if(utype.equals("1")){
		user = "instructor";
		userID = "instID";
		filePath = "instructor";
	}
	if(utype.equals("2")){
		user = "user";
		userID = "userid";
		filePath = "admin";
	}
	// 获取用户输入的账号密码
	name = request.getParameter("name");
	password = request.getParameter("password");
// 	request.getSession().setAttribute("loginName", name);
	// 查询数据库是否存在该用户的账号和密码
	String sql = "select * from sys_"+user+" where "+userID+" = '"+name+"' and password = '"+password+"'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	try{
		if(rs.next() == true){	
			// 存在用户账号，则 把用户的账号存到session，并跳转到相应的用户类型的页面
			request.getSession().setAttribute("name", name);  // 把用户的账号存到session
			request.getSession().setAttribute("utype", user);  // 把用户的类型存到session
			request.getRequestDispatcher( "page/"+filePath+"/"+user+"_index.jsp").forward(request,response);				
		}else{	
			// 不存在用户账号，
			request.getRequestDispatcher( "login_fail.jsp").forward(request,response);
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		close(rs,stmt,conn);
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>check</title>
	</head>
	<body>
		<h2><%=utype %></h2>
	</body>
</html>