<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <div id="gms-container">
   <fieldset class="gms-imgsize">
   <legend>Personal information</legend>
   <form id="gms-join-form" action="member_detail.jsp" method="get" class="gms-text-center">
   <span id="join-birth">ID</span><br>
   <input name="userId" type="text" placeholder="아이디"/><br>
   <span id="join-birth">PASSWORD</span><br>
   <input name="userPw" type="password" placeholder="비밀번호"/><br>
   <span id="join-birth">NAME</span><br>
   <input name="name" type="text" placeholder="이름"/><br>
   <span id="join-birth">BIRTHDAY</span><br>
   <input name="birthday" type="text" placeholder="생년월일"/><br>
   <input type="radio" name="gender" value="남자"/> 남자
   <input type="radio" name="gender" value="여자"/> 여자
   <br />
   이메일<br><input type="email" name="email" />
   <h3>전공</h3><br />
   <select name="major" id="">
      <option value="computer">컴퓨터공학</option>
      <option value="economics">경제학</option>
      <option value="tourism">관광학</option>
      <option value="art" selected="selected">미술</option>
   </select><br>
   <h3>수강 과목</h3><br />
   <input type="checkbox" name="subject" value="java" checked/>자바 <br />
   <input type="checkbox" name="subject" value="c" checked/>C언어<br />
   <input type="checkbox" name="subject" value="html" />HTML <br />
   <input type="checkbox" name="subject" value="css" />CSS <br />
   <input type="checkbox" name="subject" value="javascript" />자바스크립트 <br />
   <input type="checkbox" name="subject" value="sql" />SQL <br />
   <input type="checkbox" name="subject" value="python" />파이선 <br />
   <input type="submit" name="submit" value="회원가입"/>
   <input type="reset" name="reset" value="초기화" />
   </form>
   </fieldset>
   </div>
   <%@ include file = "../common/footer.jsp" %>