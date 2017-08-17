<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gms.web.constant.DB"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName(DB.ORDRIVER);
	Connection conn=DriverManager.getConnection(DB.ORURL,DB.USERNAME,DB.PASSWORD);
	Statement stmt=conn.createStatement();
	String sql="SELECT * FROM Member WHERE member_id='hong'";
	ResultSet rs = stmt.executeQuery(sql);
	String findName="";
	if(rs.next()){ //있으면 돌린다
		findName=rs.getString("name");
	}
%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<h1>Hello <%=findName%>!</h1>
</body>
</html>