<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GMS</a>
    </div>
    <ul class="nav navbar-nav">
        
      <li id="nav-home" class="active"><a onclick="moveTo('common','main')"><span class="glyphicon glyphicon-home">&nbsp; Home </span></a></li>
      
        
        <li class="dropdown">
           <a href="#" class="dropdown-toggle"
           data-toggle="dropdown" role="button"
           aria-haspopup="true"
           aria-expanded="false">회원관리 <span class="caret"></span></a>
           <ul id="navbar_ul_stu">
           <li><a>학생추가</a></li>
           <li><a>학생목록</a></li>
           <li><a>학생조회</a></li>
           <li role="separator" class="divider"></li>
           <li><a>학생삭제</a></li>
           </ul>
        </li>
        
        <li class="dropdown">
           <a href="#" class="dropdown-toggle"
           data-toggle="dropdown" role="button"
           aria-haspopup="true"
           aria-expanded="false">성적관리 <span class="caret"></span></a>
           <ul id="navbar_ul_grade">
           <li><a>성적추가</a></li>
           <li><a>성적목록</a></li>
           <li><a>성적조회</a></li>
           <li role="separator" class="divider"></li>
           <li><a>성적삭제</a></li>
           </ul>
        </li>
        
        <li class="dropdown">
           <a href="#" class="dropdown-toggle"
           data-toggle="dropdown" role="button"
           aria-haspopup="true"
           aria-expanded="false">게시글관리 <span class="caret"></span></a>
           <ul id="navbar_ul_board">
           <li><a>게시글추가</a></li>
           <li><a>게시글목록</a></li>
           <li><a>게시글수정</a></li>
           <li role="separator" class="divider"></li>
           <li><a>게시글삭제</a></li>
           </ul>
        </li>
 
    </ul>
    
       <span class="float-right"> ${sessionScope.user.name} &nbsp;
        
       <a id="logout" onclick="logout('common','index')">로그아웃</a></span>

  </div>
</nav>
<script>
/*         function logout(){
           var out = confirm('로그아웃 하시겠습니까?');
           if(out==true){
              
              location.href="${ctx}/common.do?action=logout&page=common_index";
           }
        } */
       function logout(dir, page){
        	location.href="${ctx}/"+dir+".do?action=logout&Page="+page;
        }

        function moveTo(dir, page){
        	location.href="${ctx}/"+dir+".do?action=move&page="+page;
        }
        function deleteTarget(txt){
        	window.prompt(txt+"삭제");
        }
        function list(dir,page){
        	location.href="${ctx}/"+dir+".do?action=list&page="+page;
        }
        
        function mainLoad(){
        	var u1 = document.getElementById("main_ul_stu");
        	var u2 = document.getElementById("main_ul_grade");
        	var u3 = document.getElementById("main_ul_board");

        	u1.setAttribute("class","list-group");
        	u2.setAttribute("class","list-group");
        	u3.setAttribute("class","list-group");

        	var u1c = u1.children;
        	var u2c = u2.children;
        	var u3c = u3.children;

        	var i;
        	for(i=0; i<u1c.length; i++){
        		u1c[i].setAttribute("class","list-group-item");
        	}
        	for(i=0; i<u2c.length; i++){
        		u2c[i].setAttribute("class","list-group-item");
        	}
        	for(i=0; i<u3c.length; i++){
        		u3c[i].setAttribute("class","list-group-item");
        	}

        	u1c[0].setAttribute("onclick","moveTo('member','member_add')");
        	u1c[1].setAttribute("onclick","list('member','member_list')");
        	u1c[2].setAttribute("onclick","moveTo('member','member_detail')");
        	u1c[3].setAttribute("onclick","moveTo('member','member_update')");
        	u1c[4].setAttribute("onclick","deleteTarget('학생')");

        	u2c[0].setAttribute("onclick","moveTo('grade','grade_add')");
        	u2c[1].setAttribute("onclick","list('grade','grade_list')");
        	u2c[2].setAttribute("onclick","moveTo('grade','grade_detail')");
        	u2c[3].setAttribute("onclick","moveTo('grade','grade_update')");
        	u2c[4].setAttribute("onclick","deleteTarget('성적')");

        	u3c[0].setAttribute("onclick","moveTo('board','board_write')");
        	u3c[1].setAttribute("onclick","list('board','board_list')");
        	u3c[2].setAttribute("onclick","moveTo('board','board_update')");
        	u3c[3].setAttribute("onclick","deleteTarget('게시글')");

        	

        }
        
        function navbarLoad(){
        	var u1 = document.getElementById("navbar_ul_stu");
            var u2 = document.getElementById("navbar_ul_grade");
            var u3 = document.getElementById("navbar_ul_board");

            var u1c = u1.children;
            var u2c = u2.children;
            var u3c = u3.children;
            
            u1.setAttribute("class","dropdown-menu");
            u2.setAttribute("class","dropdown-menu");
            u3.setAttribute("class","dropdown-menu");

           
            u1c[0].setAttribute("onclick","moveTo('member','member_add')");
            u1c[1].setAttribute("onclick","moveTo('member','member_list')");
            u1c[2].setAttribute("onclick","moveTo('member','member_detail')");
            u1c[3].setAttribute("onclick","moveTo('member','member_update')");
            u1c[4].setAttribute("onclick","deleteTarget('학생')");
            
            u2c[0].setAttribute("onclick","moveTo('grade','grade_add')");
            u2c[1].setAttribute("onclick","moveTo('grade','grade_list')");
            u2c[2].setAttribute("onclick","moveTo('grade','grade_detail')");
            u2c[3].setAttribute("onclick","moveTo('grade','grade_update')");
            u2c[4].setAttribute("onclick","deleteTarget('성적')");

            u3c[0].setAttribute("onclick","moveTo('board','board_write')");
            u3c[1].setAttribute("onclick","moveTo('board','board_list')");
            u3c[2].setAttribute("onclick","moveTo('board','board_update')");
            u3c[3].setAttribute("onclick","deleteTarget('게시글')");
			
        }
        
        function logout(){
        	document.getElementById("logout").setAttribute("onclick","moveTo('common','index')");
        }
        
        window.onload=navbarLoad();
        
</script>  