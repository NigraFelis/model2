<%@page import="com.gms.web.util.Clock"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>MEMBER_DETAIL</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
   <div id = "gms-wrapper">
   <div class="gms-text-center">
   <header><h1>게시판</h1></header>
   <div>
      <%=new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss").format(new Date())%>
   </div>
      <a class="gms-gomain" href="<%=request.getContextPath()%>/index.jsp">메인으로 가기</a><hr>
   <h3>Hello !!</h3>
   </div>