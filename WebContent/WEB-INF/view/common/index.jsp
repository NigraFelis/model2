<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Grade Management System</title>
<link rel="stylesheet" href="${css}/board.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
   <div id = "gms-wrapper">
   <div class="gms-text-center">
   <header><h1>Grade Management System</h1></header>
   </div>
   <div id="gms-container">
      <form id="Login-box">
         <img class="gms-imgsize" src="${img}/login.jpg" alt="" /><br />
         <span class="gms-idtex">ID</span>
         <input type="text" id="input_id" name="input_id" /><br />
         <span class="gms-tex-sty" >PASSWORD</span>
         <input type="password" id="input_pass" name="input_pass" /><br />
         <br />
         <input type="submit" value="LOGIN" onclick="loginAlert()" />
         <input type="reset" value="CANCLE"/>
         <input type="hidden" name="action" value="login" />
      </form>
   </div>
   <footer id="footer-main">
       <div>
           <p>Posted by: hanbit</p>
           <p>Contact information: <a href="mailto:someone@example.com">
             someone@hanbit.com</a>.</p>
             <a href="jdbc_test.jsp"> DB 연결 테스트 </a>
             <a href="util/update_email.jsp"> 이메일업데이트 </a>
       </div>
   </footer>
   </div>
<script>
	function loginAlert(){
		var input_id=document.getElementById('input_id').value;
		var input_pass=document.getElementById('input_pass').value;
	
		if(input_id===""){
			alert('ID를 입력해 주세요');
			return false;
		}
		if(input_pass===""){
			alert('PassWord를 입력해 주세요');
			return false;
		}
		var form=document.getElementById('Login-box');
		form.action="${ctx}/common.do";
		form.method="post";
		return true;
	}
</script>
</body>
</html>