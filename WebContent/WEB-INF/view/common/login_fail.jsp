<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>LOGIN_FAIL</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
   <div id = "gms-wrapper">
   <div class="gms-text-center">
   <header><h1>LOGIN_FAIL</h1></header>
   </div>
   <div id="gms-container">
   <a href=""><%=request.getContextPath() %>/common.do"</a>
      <form id="Login-box" action="<%=request.getContextPath() %>/common.do?action=login&page=main" method="get">
         <img class="gms-imgsize" src="<%=request.getContextPath() %>/img/login.jpg" alt="" /><br />
         <span class="gms-idtex">ID</span>
         <input type="text" name="userId" value="1" /><br />
         <span class="gms-tex-sty">PASSWORD</span>
         <input type="password" name="userPw" value="1" /><br />
         <br />
         <input type="submit" value="LOGIN" />
         <input type="reset" value="CANCLE"/>
         <input type="hidden" name ="action" value="login" />
         <input type="hidden" name = "page" value="main"/>
      </form>
   </div>
   <footer id="footer-main">
       <div>
           <p>Posted by: hanbit</p>
           <p>Contact information: <a href="mailto:someone@example.com">
             someone@hanbit.com</a>.</p>
             <a href="util/jdbc_test.jsp"> DB 연결 테스트 </a>
             <a href="util/update_email.jsp"> 이메일업데이트 </a>
       </div>
   </footer>
   </div>
</body>
</html>